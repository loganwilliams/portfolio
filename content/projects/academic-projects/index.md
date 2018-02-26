---
title: Miscellaneous academic projects
description: Recursive augmented reality, underwater gliders, and an autonomous robot.
tags:
 - tag: image processing
   link: #
 - tag: fpga
   link: https://github.com/loganwilliams/augmented-reality-on-fpga
 - tag: hardware
   link: #
year: 2013
date: 2013-04-20 
---

<h3><strong>Recursive Augmented Reality Image Processing System</strong></h3>
<em>6.111 (FPGA Laboratory) final project, with Jos&eacute; Cruz Serral&eacute;s.</em>
<dl>
	<dt>Abstract:</dt>
	<dd>We have implemented an augmented reality system that can overlay a digital image on a video stream of a real world environment. We read NTSC video data from a video camera and store it in external ZBT memory. A picture frame with colored markers on the corners is held in front of the camera. We then perform chroma-based object recognition to locate the coordinates of the corners. Using these coordinates, we apply a projective transformation to project an image onto the dimensions of the picture frame. From this, we generate a VGA output signal, display the original captured image, with the processed image overlayed on top of the picture frame. By using the previously displayed video frame as the image to be projected on the next frame, the system becomes "recursive."</dd>
	<dt><a href="images/6111FinalLoganJose.pdf">Read the paper</a>.
	<dt><a href="https://github.com/loganwilliams/augmented-reality-on-fpga">Source code on Github</a>.</dt>
</dl>

<div class="gallery">
{{% img name="**block_diagram*" %}}
</div>

<h3><strong>Trajectory Planning for Underwater Gliders</strong></h3>
<em>6.832 (Underactuated Robotics) final project</em>
<dl>
	<dt>Abstract:</dt>
	<dd>The "underwater glider" is a highly useful underactuated robotic system. In this project, we analyze a two dimensional "planar underwater glider," with just one degree of actuation. By using rapidly exploring random trees, we are able to find feasible trajectories from one physical lo- cation to another. We then apply non-linear optimization techniques to the feasible trajectory to find efficient, low-power routes through the sea.</dd>
	<dt><a href="images/trajectory_planning.pdf">Read the paper</a>.</dt>
</dl>

<a id="universalwaste"><h3><strong>Universal Waste: A Victorious MASLAB Robot</strong></h3></a>
	<dl>
		<dt>Part of the 2012 champion team, with <a href="http://muffinator.mit.edu/">Josh Gordonson</a>, <a href="http://mit.edu/dlaw/www">David Lawrence</a>, Martin Lozano, and <a href="http://mit.edu/jhurwitz/www/">Jacob Hurwitz</a></dt>
	</dl>

<div class="gallery">
{{% img name="**maslab*" %}}
</div>