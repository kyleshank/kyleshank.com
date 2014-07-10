---
title:  "FMProgressViewController"
date:   2014-07-09 14:14:00
---
![FMProgressViewController](/images/fmprogressviewcontroller.png)

[Formal Method](http://formalmethod.net) has released another open source project called [FMProgressViewController](https://github.com/formal-method/FMProgressViewController).

FMProgressViewController is an easy way to reflect progress within an iOS7 NavigationBar.  I extracted the code I used to reflect upload progress within Cloudgram.

The Messages app on iOS7 uses the NavigationBar in the same way to show that a message is being sent.  As far as I know there is no Apple API to do something similar so I created my own solution.

FMProgressViewController works on the iPhone/iPad and can handle changes in orientation.  The implementation is done as a UIViewController category that can easily be imported and added to any existing UIViewController.

Follow Formal Method on [Github](https://github.com/formal-method).