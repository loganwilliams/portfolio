---
title: Phased-based frame interpolation, a Julia implementation
---

In this post, I'll show how we can use Julia and my multi-scale image decomposition library, [Pyramids.jl](https://github.com/loganwilliams/Pyramids.jl), to implement [*Phase-Based Frame Interpolation for Video*](https://www.disneyresearch.com/publication/phasebased/), an algorithm from CVPR 2015. This assumes some familiarity with [complex steerable pyramids](http://www.cns.nyu.edu/~eero/STEERPYR/).

## The paper

The [paper](https://s3-us-west-1.amazonaws.com/disneyresearch/wp-content/uploads/20150605230239/Phase-Based-Frame-Interpolation-for-Video-Paper.pdf) describes an algorithm for interpolating between video frames, with applications from smoother slow-motion video to creative animation effects.

The algorithm itself is fairly straightforward. First, two complex steerable pyramids are constructed from the two reference frames. The method rests on two observations:

* As image structure is encoded primarily by phase, interpolating the *phase* of each pixel produces a much higher quality result. *However, this only works if the phase is correctly unwrapped.*
* Inherent ambiguity in phase unwrapping can be resolved by looking at the phase of pixels at *larger spatial scales.*

![Algorithm summary]({{site.baseurl}}/images/2016-07-15/algorithm.png)

In the "shiftCorrection" step, the phase of each pixel is compared to the phase of a pixel at the same location from the next larger spatial scale. Multiples of 2π are added to the pixel's phase to unwrap it to the correct absolute phase. If the unwrapped phase and the phase from the larger spatial scale differ in an ambiguous way, the phase from the larger spatial scale is used instead. As this starts from the largest scale and runs up the pyramid, it is possible that a top level pixel will be using phase information from the broadest spatial scale. By doing this, 

In the "adjustPhase" step, consistency is insured between the interpolated phase and the phase of the reference frames (i.e., with α = 1, we should compute exactly the second reference frame.) This is done by adding a multiple of 2π to the original phase that most closely matches the corrected phase from the previous step.

In this way, the algorithm computes a consistent, unwrapped phase for each pixel. Now, we can simply interpolate phase and magnitude between the two frames, and reconstruct the image from the interpolated pyramid.

## The Julia implementation

Now, let's look at how to implement this algorithm in Julia. First, we will include the libraries we will need, define a new pyramid type that we will use to denote a pyramid containing image phase alone.

{% gist 14027cab9c57ef5286f7eda3794d1f8b setup.jl %}

Next, we must load the images that we will be interpolating between ("frame_0.jpg" and "frame_1.jpg"), extract just the luminance component by converting the image to [Lab color space](https://en.wikipedia.org/wiki/Lab_color_space) and generate a complex steerable pyramid using the ```ImagePyramid``` constructor. Note that unlike traditional complex steerable pyramids, we are using a scale factor > 0.5, which results in a significantly over complete basis. This has been shown to produce significantly higher quality results for this and similar algorithms.

{% gist 14027cab9c57ef5286f7eda3794d1f8b loading.jl %}

This accomplishes the step I have labeled "A" in the algorithm overview above.

### Computing the phase difference

The next significant step, labeled "B" simply requires computing the difference in phase between each pixel of two pyramids. This looks like the following:

{% gist 14027cab9c57ef5286f7eda3794d1f8b phase_difference.jl %}

This simply iterates through each level of the two input pyramids, and create a third pyramid (of type ```PhasePyramid```) which stores the difference in phase.

### Correcting the phase difference

The next step is labeled "C," and is the most significant part of the algorithm. Here, we will use phase information from larger spatial scales of the image in order to resolve phase ambiguities at higher levels. Let's take a look.

{% gist 14027cab9c57ef5286f7eda3794d1f8b shift_correction.jl %}

Notice that the phase of each level is scaled by the pyramid scale factor, as well as interpolated to match the number of pixels. Also note that anything that hints at ambiguity or inaccuracy (phase shifts too large or phase shifts that don't match larger spatial scales) results in falling back on the phase shift of the larger spatial scale.

### Adjusting the phase difference

The last significant step in the algorithm, "D," requires adjusting the corrected phase to ensure consistency with the original calculated phase delta. Analogous to how we unwrapped the phase in ```shift_correction```, we will add or subtract factors of 2π in order to produce a phase shift consistent with the original value but as close as possible to the corrected one.

{% gist 14027cab9c57ef5286f7eda3794d1f8b adjust_phase.jl %}

### Interpolating and blending pyramids

With the new, unwrapped phase difference computed, we are now able to compute the interpolated complex steerable pyramid. The pyramid amplitudes are interpolated linearly between the two pyramids, and the phase is of course the original phase + alpha * the unwrapped phase difference. To avoid ghosting, a single high frequency phase residual is used only.

{% gist 14027cab9c57ef5286f7eda3794d1f8b blend_and_interpolate.jl %}

### Rendering output

Finally, we produce our output image. Notice that only the luminance channel uses the phase based interpolation method -- simpler, significantly faster linear interpolation suffices for the chrominance channels, as our visual system is far less sensitive to issues like ghosting and sharpness loss in these channels.

{% gist 14027cab9c57ef5286f7eda3794d1f8b generate_output.jl %}

## Results

So, does this algorithm work? What do the results look like? To start, let's look at naive (linear) interpolation between two test frames:

![Linear interpolated test frame]({{site.baseurl}}/images/2016-07-15/naive_example.gif)

Notice the significant ghosting in the interpolated frame. Phase-based interpolation produces this result:

![Phase interpolated test frame]({{site.baseurl}}/images/2016-07-15/interpolated_example.gif)

A significant improvement! (Though notice that there are some low-frequency artifacts visible in the interpolated frame.)

Now, let's try a more complicated scene. Here's linear interpolation:

![Linear interpolated forest frame]({{site.baseurl}}/images/2016-07-15/tree_alpha_c_0.6.png)

And here's phase-based interpolation:

![Phase interpolated forest frame]({{site.baseurl}}/images/2016-07-15/tree_alpha_0.6.png)

Again, phase-based was much more successful at preserving structure and sharpness without ghosting. Notice especially the branches in the center-left and bottom-right.

However, also notice that the phase-based algorithm performs poorly in the bottom-left, where the movement of the branches was too large for adequate phase recovery. Still, even in this case, the blurring artifacts are arguably less severe than the ghosting visible in the linear implementation.

*n.b. This is a personal project, and all code is released for research purposes only. Contact The Disney Company for more information about licensing the IP contained in the linked CVPR paper.*