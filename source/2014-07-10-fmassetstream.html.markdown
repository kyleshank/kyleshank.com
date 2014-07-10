---
title:  "FMAssetStream"
date:   2014-07-10 14:14:00
---
![FMAssetStream](/images/fmassetstream.jpg)

[Formal Method](http://formalmethod.net) has released [FMAssetStream](https://github.com/formal-method/FMAssetStream).

FMAssetStream is an easy way to do streaming, memory efficient uploads of potentially large photos and videos on iOS.  Instead of loading the entire photo or video into memory, FMAssetStream will 

FMAssetStream adds a `setAsset` method to NSMutableURLRequest so you can easily associate an ALAsset with an upload request.

FMAssetStream also offers the `FMAssetInputStream` class that you can generally use to get an NSInputStream interface for an ALAsset.

The example project in this repository demonstrates how to use FMAssetStream, uses the [FMProgressViewController](https://github.com/formal-method/FMProgressViewController) to reflect upload progress and even will upload a real test file to S3.

The code was extracted from [Cloudgram](https://cloudgram.com).

Follow Formal Method on [Github](https://github.com/formal-method).