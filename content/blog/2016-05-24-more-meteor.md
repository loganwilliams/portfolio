---
title: More meteor
---

I expanded my Photo display React component to display groups of photos, and provide a user interface for expanding and contracting them.

![Expanding/hiding duplicates]({{site.baseurl}}/images/2016-05-24 22_15_32.gif)

I also added a date widget, and got pagination, subscriptions, and routing figured out super easily with [FlowRouter](https://github.com/kadirahq/flow-router).

![Date widget]({{site.baseurl}}/images/timeline_tuesday.jpg)

Seriously, it was super easy. I can probably handle parsing and changing the dates in a slightly more elegant way though.

{% highlight javascript %}
FlowRouter.route('/timeline/:date', {
	name: 'timeline',
	subscriptions: function(params) {
		let startDate = new Date(params.date);
		let endDate = new Date(params.date);
		startDate = new Date(startDate.getTime() - 2*1000*60*60*24);
		endDate = new Date(endDate.getTime() + 3*1000*60*60*24);

    	this.register('photos', Meteor.subscribe('photos', startDate, endDate));
    },
	action: function(params) {
		mount(App, {date: moment(params.date)})
	}
});
{% endhighlight %}

---

Started preparing the garden for the cherry tomato plants today. I also began thinking about how the fire pit build is going to work. I think I need some rocks. Maybe some steel, if I can find any scrap?