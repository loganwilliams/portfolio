---
title: Selected useful Mongodb queries
---

Group by date:

```
db.getCollection('images').aggregate(
    [
        {
            $group: { 
                _id : { month: { $month: "$datetime.utc_timestamp" }, day: { $dayOfMonth: "$datetime.utc_timestamp" }, year: { $year: "$datetime.utc_timestamp" } },
                count: { $sum: 1 },
                latitude: { $avg: "$latitude"},
                longitude: { $avg: "$longitude"},
            }
        }
    ]
)
```

Creating a 2-D geospatial index on an Earth-spheroid.

```
db.images.createIndex({"location": "2dsphere"})
```

Finding documents near a point:

```
db.images.find({
    "location": {
        $near: {
            $geometry: {
                type: "Point",
                coordinates: [-122.1624, 37.201836]
            },
            $maxDistance: 100
        }
    }
})
```

Aggregating documents near a point with the computed distance:

```
db.images.aggregate([
   {
     $geoNear: {
        near: { type: "Point", coordinates:  [-122.1624, 37.201836] },
        distanceField: "distance",
        maxDistance: 2000,
        includeLocs: "location",
        num: 5,
        spherical: true
     }
   }
])
```

The five images closest to a given point (within 200km) that were taken on distinct days.

```
db.images.aggregate([
   {
     $geoNear: {
        near: { type: "Point", coordinates:  [-122.1624, 37.201836] },
        distanceField: "distance",
        maxDistance: 200000,
        includeLocs: "location",
        spherical: true
     }
   },
   {
       $group: { 
            _id : { month: { $month: "$datetime.utc_timestamp" }, day: { $dayOfMonth: "$datetime.utc_timestamp" }, year: { $year: "$datetime.utc_timestamp" } },
            distance: {$min: "$distance"},
            image: {$first: "$$CURRENT"}
        }
   },
   {
       $sort: {"distance": 1}
   },
   {
       $limit: 5
   }
])
```

Find the images that look most similar to a given image fingerprint:

```
db.images.mapReduce(
    function() {
        var fingerprint_difference = 0;
        var comparison_fingerprint = [0.468555122613907,
            -0.353169769048691,
            0.14241087436676,
            -0.0821656882762909,
            -0.0524195097386837,
            -0.00935091450810432,
            0.184520080685616,
            0.164618194103241,
            -0.0220650248229504,
            0.0105008510872722,
            -0.423288017511368,
            0.207316115498543,
            0.0272494424134493,
            0.0,
            -0.157153755426407,
            0.149594604969025,
            0.0,
            0.0,
            0.0,
            0.0,
            -0.0281856469810009,
            -0.0578242465853691,
            0.0,
            0.0,
            0.0,
            -0.106666743755341,
            -0.285874038934708,
            0.0,
            0.00936079490929842,
            0.229413896799088,
            0.0659909546375275,
            0.0145512670278549,
            0.0,
            0.0,
            0.0,
            0.0,
            0.0268315020948648,
            -0.0364695005118847,
            0.0,
            0.0,
            0.030316386371851,
            -0.26200807094574,
            0.103866763412952,
            0.03290805965662,
            0.0,
            -0.0890728309750557,
            0.0108723239973187,
            0.0231005717068911,
            0.0,
            0.0,
            0.0,
            0.0,
            -0.0207184460014105,
            0.0387163199484348,
            0.0,
            0.0,
            0.0147460391744971,
            0.191929057240486,
            -0.0658795014023781,
            -0.0100948391482234,
            0.0,
            -0.0628153160214424,
            0.0,
            0.0132519574835896
        ];
        
        for (var i = 0; i < this.syntactic_fingerprint.length; i++) {
            fingerprint_difference += Math.pow(this.syntactic_fingerprint[i] - comparison_fingerprint[i],2);
        }
        
        if (!(isNaN(fingerprint_difference))) {
            emit(this._id, Math.sqrt(fingerprint_difference)); 
        }
    },
    function(key, values) {
        return values;    
    },
    {
        query: {},
        out: 'image_similarity'
    }
);
    
db.image_similarity.find({}).sort({'value': 1}).skip(1).limit(5);
```