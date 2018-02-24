---
title: Rendering multiple axes in D3.js
---

Last week, I needed to add many axes to a single D3 svg. I had a set of sets of data points, and I wanted each of these sets of data to be rendered with its own x and y axes.

To do this, I wrote the following:

~~~
  var locationArea = bar.append("g")
      .attr("transform", function(d) { return "translate(200," + 24*(+d.length) + ")"; })
      .attr("class", function(d, i) { return "locations n_".concat(i) });

  var locationXAxes = locationArea
    .each(function (d, i) {

      var lat_scale = d3.scale.linear()
                      .range([-50, 50])
                      .domain([d3.min(d.locations, function(d) { return d[0]; }),
                               d3.max(d.locations, function(d) { return d[0]; })]);

      var axis = d3.svg.axis()
        .scale(lat_scale)
        .orient("bottom")
        .ticks(3);

      d3.selectAll(".n_".concat(i)).append("g")
        .attr("class", "x axis")
        .attr("transform", "translate(0, 60)")
        .call(axis);
    });
~~~
 
 For each set of data points, a new D3 scale is created, and a new axis is created from that scale. Then, the group created previously is selected and the axis is appended to that specific group.

 There's probably a better way to do this, but this worked.