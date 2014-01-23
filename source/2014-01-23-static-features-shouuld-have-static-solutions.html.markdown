---
layout: post
title:  "Static features should have static solutions"
date:   2014-01-23 13:56:00
---

I rolled out a few new FANS.FM features and detailed them in [this podcast](http://fans.fm/listen/7):

<iframe width="100%" height="96" src="http://embed.fans.fm/7.html" frameborder="0"></iframe>

[FANS.FM](http://fans.fm) is getting closer to being ready for launch but there's no rush.  I want to get it right.

What is cool about the embed above is that its statically generated into an S3 bucket.  That means it won't slow down your website when you embed the player and it doesn't add any load to my Rails app.  

The podcast file itself is hosted through Amazon Cloudfront so the whole experience of the embed is running out of Amazon's reliable services.  Stats on listeners are tracked by harvesting Cloudfront log files periodically instead of making dynamic calls back to Rails.  The podcast feeds are also hosted out of S3 for the same reason.

Static features should have static solutions.  The reason is reliability; not performance.