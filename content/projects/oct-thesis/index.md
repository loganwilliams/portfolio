---
title: Optical Coherence Tomography
description: My master's thesis on three dimensional imaging inside the mammilian cochlea.
tags:
 - tag: thesis
   link: https://dspace.mit.edu/handle/1721.1/92090
 - tag: photography
   link: https://github.com/loganwilliams/thermografree
 - tag: hardware
   link: http://exclav.es/2016/10/26/talkin-ir/
 - tag: python
   link: https://github.com
date: 2014-05-20
year: 2014
---

<p>For its importance to human sensation, there is surprisingly little known about the mechanics of motion within the ear. Part of the reason for this is the extremely tiny magnitude of motions within the ear &mdash; a sound at the threshold of human hearing creates a vibration on the eardrum the size of a hydrogen atom. From October 2012 until June 2014, I worked with <a href="http://www.rle.mit.edu/people/directory/dennis-freeman/">Professor Denny Freeman</a> and his laboratory at RLE on a new fiber optic apparatus for imaging this motion within the ear.</p>

<p>This apparatus used a technique known as optical coherence tomography, which takes advantage of the random nature of "white" light to image within biological tissues. It is possible to imagine this imaging modality as essentially sending a small pulse of light into a sample and sensing each reflection, which will contain information about the density of the tissue at a depth proportional to the time delay of that reflection. This produces images that can show slices into biological samples, such as the guinea pig cochlea below:
</p>
<p>
<img src="images/oct_reflectivity.png">
</p>
<p>This technique was then extended to allow the motion within a sample to be measured as well. Light that reflects from an object in motion will have a shift in its wavelength proportional to the velocity of the object. Using acousto-optical modulators, it is possible to move this wavelength shift into a range in which it can be measured electrically. From these measurements, the amplitude and phase of the motion could be extracted as a function of spatial position.</p>
<p>
<img src="images/oct.png">
</p>
<p>This instrument had a noise floor of just 1 pm/&radic;Hz, allowing the atomic-scale vibrations of interest to the Micromechanics group to be measured. For more information about this project, my final thesis is available <a href="https://dspace.mit.edu/handle/1721.1/92090">here</a>, and the abstract is reprinted below.</p>
<p><strong>Design and Implementation of a Fiber Optic Doppler Optical Coherence Microscopy System for Cochlear Imaging</strong></p>
<p>In this thesis, the design and implementation of a fiber optic Doppler optical coherence microscopy (FO-DOCM) system for cochlear imaging applications is presented. The use of a fiber optic design significantly reduces system size and complexity and the construction of a novel alignment and micropositioning apparatus increases ease of use for the researcher performing the imaging. To enable precise measurements of tissue motion, a time domain DOCM approach is used, utilizing an acousto-optic modulator (AOM) based optical heterodyne system to generate a stationary interference carrier frequency. By referencing this interference signal against the AOM drive signals, measurements of motions with magnitude on the order of 10 pm are shown to be possible. In addition to interferometrically measuring small amplitude motion, the FO-DOCM system is shown to be capable of imaging with a volumetric resolution of 10 x 9 x 9 &mu;m. Demonstrative results of imaging cochlear tissue are presented by using the FO-DOCM system to image and measure motion in a guinea pig cochlea <em>in vitro</em>.</p>

<p>
<img src="images/block_diagram.png" />
</p>