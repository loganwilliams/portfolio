---
title: Squarecave
description: A DIY analog synthesizer with eight step sequencer.
tags:
 - tag: audio
   link: https://soundcloud.com/bahro
 - tag: synthesizers
   link: /projects/transdomain-feedback
 - tag: hardware
   link: https://github.com/loganwilliams/thermografree
date: 2009-05-05
year: 2009
---

<div>
	<p>In 2009, I built the Squarecave, an analog synthesizer and sequencer. It uses digital CMOS ICs to generate a sequence of oscillations of varying pitch and volume, and then pipes the result through analog filters (lo-pass, hi-pass, band-pass). If I built this again now, there are so many things that I would change, but I still think it sounds great &mdash; maybe someday, I'll build version 2. (It might even follow a conventional tuning system!)</p>

	<a href="images/case.jpg" title="The completed Squarecave."><img class="thumb" src="images/case_sm.jpg"></a>

	<h3>Oscillator Section Prototype</h3>
	<p>The oscillator section is based of 4000 series CMOS ICs. A 40106 forms a simple resistance controlled oscillator. From there, a 4040 binary counter/divider divides the oscillator by 2 thrice, creating three slower oscillations. Those three new waveforms are piped into the control channels for an 8 bit multiplexer, the 4051. Three 4051s sequence through a set of eight different potentiometers, adjusting the pitch and volume on another 40106.</p>
	<p>The digital prototype was one of the easier parts to create, as it was simple to start small (with just a single oscillator), and progress from there.</p>
	<a href="images/digital.jpg" title="The first successful breadboarded sequencer prototype."><img class="thumb" src="images/digital_sm.jpg"></a><br />
	<a href="images/digital_schem.jpg" title="The first hand-drawn schematic."><img style="border-top: none" class="thumb" src="images/digital_schem_sm.jpg"></a>

	<h3>Filter Prototype</h3>
	<p>The analog development was much more difficult. I had originally intended to use a very simple analog filter, but that did not produce the results I had desired. After trying many different things, and with the help of <a href="http://mysite.wanadoo-members.co.uk/tstinchcombe/index.html">Tim Stinchombe</a>, I eventually settled on the EDP wasp filter, as it was designed to run off of the +5/+0 voltage I was using. The schematics that I used for creating this are from <a href="http://www.elby-designs.com/pixie/pixie-about.htm">The Pixie</a>, and are slightly modified so as to use potentiometers rather then CV inputs.</p>
	
	<iframe src="https://player.vimeo.com/video/257320540?title=0&byline=0&portrait=0" width="640" height="483" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>

	<p>The EDP wasp filter provides a lowpass, highpass and midpass filter, and is 100% analog.</p>
	<h3>Designing the PCB</h3>
	<p>From a working analog prototype, the next logical step was to package it up in something nice. I bought a case from Hammond Manufacturing, and ordered a PCB to fit. After the PCB arrived, it took a couple of weeks to solder and assemble everything, and a frustrating few more to figure out why it still wasn't working.</p>
	<a href="images/board.jpg" title="The PCB"><img class="thumb" src="images/board_sm.jpg"></a>

	<h3>Finality</h3>
	<p>Here is a photo and a sample MP3 of the completed Squarecave. <em style="padding-left: 0px;">Note: the sample mp3 really isn't producing "the squarecave sound," for that, check out the video up above, of the breadboarded Squarecave.</em></p>
	<a href="images/case.jpg" title="The completed Squarecave."><img class="thumb" src="images/case_sm.jpg"></a><br />
	<a href="images/sample1.mp3">Audio sample: </a>
	<audio controls>
	  <source src="images/sample1.mp3" type="audio/mpeg">
	Your browser does not support the audio element.
	</audio>

	<h3>Schematic</h3>
	<p>The schematic for this synthesizer is in PNG form below. Information on the design of the digital and analog parts is available in the history. This is a revised version of the schematic; the built version photographed above is connected to the panel differently.</p>
	<a href="images/schem_f.png" title="The Squarecave schematic."><img class="thumb" src="images/schem_sm.png"></a>
	<h3>Panel Mount</h3>
	<p>This document shows how the panel of switches, LEDs and potentiometers connects to the circuit board. The panel mount does not have a board, and rather potentiometers are simply screwed down to the plastic and freewired to header housing. The panel is designed to be on an 8.66'' x 5.5'' <a href="http://www.hammondmfg.com/dwg6pslp.htm">case from Hammond Manufacturing</a>. The diagram below shows how the panel is wired, and how it connects to the main PCB. (Diagram made with the latest CAD techniques) It is rather hard to follow, but the important part is how the potentiometers are wired to ground, and how they are connected to jumpers. The left 8 pots are all 100K linear, the middle 8 are 100K log, the top right pot is 1M log, the next one down is 10K linear, then 100K log, 4x3 rotary switch, then two more 100K logs.</p>
	<a href="images/panel.jpg" title="Squarecave panel wiring"><img class="thumb" src="images/panel_sm.jpg"></a>
	<h3>Files</h3>
	<ul>
		<li><a href="images/squarecave_revised.sch">Revised schematic, as shown above (Eagle format)</a> <em>Note: untested.</em></li>
	</ul>
	<h3>Parts List</h3>
	<table id="list">
		<tr class="def">
			<th>Part Name</th>
			<th>Quantity</th>
			<th>Notes</th>
		</tr><tr>
			<td class="divider">Digital Oscillators/Sequencer</td>
			<td class="divider"></td>
			<td class="divider"></td>
		</tr><tr>
			<td>.2 &mu;F capacitor</td>
			<td>1</td>
			<td></td>
		</tr><tr class="alternate">
			<td>.1 &mu;F capactior</td>
			<td>1</td>
			<td></td>
		</tr><tr>
			<td>40106 hex inverting buffer</td>
			<td>1</td>
			<td></td>
		</tr><tr class="alternate">
			<td>7805 voltage reg.</td>
			<td>1</td>
			<td></td>
		</tr><tr>
			<td>4051 8 chan muxdemux</td>
			<td>4</td>
			<td></td>
		</tr><tr class="alternate">
			<td>4040 binary divider</td>
			<td>1</td>
			<td></td>
		</tr><tr>
			<td>2.2K<span style="text-transform: none">&Omega;</span> resistor</td>
			<td>1</td>
			<td></td>
		</tr><tr class="alternate">
			<td>150<span style="text-transform: none">&Omega;</span> resistor</td>
			<td>1</td>
			<td></td>
		</tr><tr>
			<td>1N4148 diode</td>
			<td>1</td>
			<td><em>More of these in the analog section</em></td>
		</tr><tr>
			<td class="divider">Analog Filters</td>
			<td class="divider"></td>
			<td class="divider"></td>
		</tr><tr>
			<td>220 nF capacitor</td>
			<td>2</td>
			<td></td>
		</tr><tr class="alternate">
			<td>.047 &mu;F capacitor</td>
			<td>1</td>
			<td></td>
		</tr><tr>
			<td>220 &mu;F electrolytic capacitor</td>
			<td>1</td>
			<td></td>
		</tr><tr class="alternate">
			<td>1 nF capacitor</td>
			<td>2</td>
			<td></td>
		</tr><tr>
			<td>68 pF capacitor</td>
			<td>1</td>
			<td></td>
		</tr><tr class="alternate">
			<td>1N4148 diode</td>
			<td>3</td>
			<td><em>One more in the digital section above</em></td>
		</tr><tr>
			<td>CA3080 OTA</td>
			<td>2</td>
			<td><em>Hard to find. A NTE 996 will also work</em></td>
		</tr><tr class="alternate">
			<td>4069 hex inverter</td>
			<td>1</td>
			<td></td>
		</tr><tr>
			<td>LM386 audio amplifier</td>
			<td>1</td>
			<td></td>
		</tr><tr class="alternate">
			<td>33K<span style="text-transform: none">&Omega;</span> resistor</td>
			<td>7</td>
			<td></td>
		</tr><tr>
			<td>100K<span style="text-transform: none">&Omega;</span> resistor</td>
			<td>4</td>
			<td></td>
		</tr><tr class="alternate">
			<td>1K<span style="text-transform: none">&Omega;</span> resistor</td>
			<td>5</td>
			<td></td>
		</tr><tr>
			<td>4.7K<span style="text-transform: none">&Omega;</span> resistor</td>
			<td>2</td>
			<td></td>
		</tr><tr class="alternate">
			<td>15K<span style="text-transform: none">&Omega;</span> resistor</td>
			<td>2</td>
			<td></td>
		</tr><tr>
			<td>330<span style="text-transform: none">&Omega;</span> resistor</td>
			<td>1</td>
			<td></td>
		</tr><tr class="alternate">
			<td>10<span style="text-transform: none">&Omega;</span> resistor</td>
			<td>1</td>
			<td></td>
		</tr><tr>
			<td class="divider">Connectors</td>
			<td class="divider"></td>
			<td class="divider"></td>
		</tr><tr>
			<td>1x8 90&deg; male .100'' header</td>
			<td>1</td>
			<td></td>
		</tr><tr class="alternate">
			<td>1x9 90&deg; male .100'' header</td>
			<td>1</td>
			<td></td>
		</tr><tr>
			<td>1x3 90&deg; male .100'' header</td>
			<td>2</td>
			<td></td>
		</tr><tr class="alternate">
			<td>1x2 90&deg; male .100'' header</td>
			<td>2</td>
			<td></td>
		</tr><tr>
			<td>1x6 90&deg; male .100'' header</td>
			<td>1</td>
			<td></td>
		</tr><tr class="alternate">
			<td>2x2 90&deg; male .100'' header</td>
			<td>1</td>
			<td></td>
		</tr><tr>
			<td>2x8 90&deg; male .100'' header</td>
			<td>1</td>
			<td></td>
		</tr><tr class="alternate">
			<td>1x8 female .100'' housing</td>
			<td>1</td>
			<td></td>
		</tr><tr>
			<td>1x9 female .100'' housing</td>
			<td>1</td>
			<td></td>
		</tr><tr class="alternate">
			<td>1x3 female .100'' housing</td>
			<td>2</td>
			<td></td>
		</tr><tr>
			<td>1x2 female .100'' housing</td>
			<td>2</td>
			<td></td>
		</tr><tr class="alternate">
			<td>1x6 female .100'' housing</td>
			<td>1</td>
			<td></td>
		</tr><tr>
			<td>2x2 female .100'' housing</td>
			<td>1</td>
			<td></td>
		</tr><tr class="alternate">
			<td>2x8 female .100'' housing</td>
			<td>1</td>
			<td></td>
		</tr><tr>
			<td class="divider">Case</td>
			<td class="divider"></td>
			<td class="divider"></td>
		</tr><tr>
			<td>Hammond Manufacturing 1599KSTLGYBAT</td>
			<td>1</td>
			<td><em><a href="http://www.hammondmfg.com/dwg6pslp.htm">Hammond Mfg</a></em></td>
		</tr><tr class="alternate">
			<td>Hammond Manufacturing BS61KIT</td>
			<td>1</td>
			<td><em><a href="http://www.hammondmfg.com/dwg6pslp.htm">Hammond Mfg</a></em></td>
		</tr><tr>
			<td class="divider">Panel</td>
			<td class="divider"></td>
			<td class="divider"></td>
		</tr><tr>
			<td>Alpha 100K<span style="text-transform: none">&Omega;</span> linear pot</td>
			<td>10</td>
			<td><em>24mm panel mount</td>
		</tr><tr class="alternate">
			<td>Alpha 100K<span style="text-transform: none">&Omega;</span> log pot</td>
			<td>9</td>
			<td></td>
		</tr><tr>
			<td>Alpha 4x3 rotary switch</td>
			<td>1</td>
			<td></td>
		</tr><tr class="alternate">
			<td>Alpha 10K linear pot</td>
			<td>1</td>
			<td></td>
		</tr><tr>
			<td>Toggle switch</td>
			<td>2</td>
			<td><em>any type</em></td>
		</tr><tr class="alternate">
			<td>3.5mm jack</td>
			<td>1</td>
			<td><em>any type, panel mount</em></td>
		</tr><tr>
			<td>Alpha 1M<span style="text-transform: none">&Omega;</span> log pot</td>
			<td>1</td>
			<td></td>
		</tr><tr class="alternate">
			<td>Panel mount LED</td>
			<td>8</td>
			<td><em><a href="http://www.jameco.com/webapp/wcs/stores/servlet/ProductDisplay?langId=-1&storeId=10001&catalogId=10001&productId=141111">Ex: Jameco product #141111</a></em></td>
		</tr>
	</table>
</div>

<div class="section">
<h2 style="margin-top:2em"><strong>Circuit Bending</strong></h2>

Some samples of assorted circuit bending projects:

<ul>
	<li>"Star Hate" (1): <audio controls> <source src="images/star3.mp3" type="audio/mpeg">Your browser does not support the audio element.</audio></li>
	<li>"Star Hate" (2): <audio controls> <source src="images/star4.mp3" type="audio/mpeg">Your browser does not support the audio element.</audio></li>
	<li>"Star Hate" (3): <audio controls> <source src="images/star2.mp3" type="audio/mpeg">Your browser does not support the audio element.</audio></li>
	<li>"The Bookstrip" (1):<audio controls> <source src="images/bookstrip1.mp3" type="audio/mpeg">Your browser does not support the audio element.</audio></li>
	<li>"The Bookstrip" (2):<audio controls> <source src="images/bookstrip2.mp3" type="audio/mpeg">Your browser does not support the audio element.</audio></li>
</ul>

</div>