---
title: Remember the cat?
---

I woke up this morning to find that the freshly planted patch in the back of 1611's back yard had been completely dug up, and around the edges, suspiciously sized footprints.

Remember the cat? Now enemy number one.

By putting a combination of hardware cloth, chicken wire, and old shelves found in the basement down, I constructed a (so far) effective cat barrier.

![Cat barrier]({{site.baseurl}}/images/IMG_4671.JPG)

---

In technical updates, I learned how to use a bit of jQuery today, and built a little logarithmic timeline display for some of Bilal's photos, including comparing syntactic image fingerprints in javascript and automatically hiding duplicate images (but allowing them to be revealed with a little animation.)

The result was okay, but a few things are clear:

* It would be great to adjust the clustering of events "on the fly" and be able to see what impact that has.

* It will be important to render multiple events side by side.

* Loading a big JSON file isn't quite practical.

So, I figured out how to process the images directly into a MongoDB database, and I will experiment further with using Meteor to flexibly render these timelines. However, first I need to determine how best to store a bunch of image assets with Meteor. Perhaps in the Mongo database directly?