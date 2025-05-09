---
title: Linear lens arrays
description: From the "lightfield" collected by a smartphone in a moving vehicle, we can synthesize a mile-wide aperture.
tags:
 - tag: image processing
   link: /projects/computational-photography/
 - tag: photography
   link: /projects/isometric-spacelapse/
 - tag: python
   link: https://github.com/loganwilliams/linear-lens-array
date: 2013-08-20
year: 2013
---

<p><em>N.B.</em> This project was inspired by, extends, and makes use of some Javascript written by my friend, <a href="http://joshuahhh.com">Joshua Horowitz</a>.</p>

<p>A conventional camera focuses all light rays emitted from an object to the same point in the image. In contrast, a lightfield image contains both the location <em>and angle</em> of incident light rays. Much has been written about light field imaging, but to introduce this project, it suffices to explain that it is conventionally accomplished by capturing many images from different perspecives. Typically, this is by use of a microlens array, as in the <a href="http://lytro.com">Lytro</a> camera, or a larger array of cameras themselves, as in the older <a href="http://graphics.stanford.edu/projects/array/">Stanford Multi-camera Arrray</a>.</p>

<p>However, this compound image can be captured in other ways. For example, consider a camera recording video from a moving vehicle, as below:</p>

{{% video name="**unprocessed*" %}}

<p>This video is essentially a series of images captured with displacement along a single axis, and therefore, can be interpreted as a kind of lightfield array! (Ignoring the effects of time, bends in the road, and the suspension of the bus, of course.) However, because our "array" is one dimensional, this will be a 3D lightfield, rather than the more useful 4D lightfields. Still, we are capable of using our lightfield to synthesize an image of the entire road simultaneously, taken from any angle within the field of view of the camera.</p>

{{% video name="**280*" width="95%" %}}

<p>Notice especially the way the perspective changes on the road sign!</p>

<p>From this lightfield, we can also synthesize an aperture one mile wide (in one dimesion, at least). This ultra wide aperture enables a synthetic depth of field that is extremely shallow.</p>

{{% video name="**refocus*" %}}

<p>By finding the image that is most "in focus" for each (x,y) coordinate, it is simple to create a simple click-to-focus prototype. To identify the sharpest focus regions, a simple high-pass filter and rectifier can be used to measure the high frequency energy in each region. A 1-D filter is sufficient, as the sharpness is only variable along a single axis.</p>

<p>You can play with the result <a href="/projects-static/linear-lens-array">here</a>!</p>

<p>If you'd like to take a deeper dive into the (extremely simple) computation that makes this possible, the source code for this project can be found on my <a href="https://github.com/loganwilliams/linear-lens-array">GitHub</a>.</p>