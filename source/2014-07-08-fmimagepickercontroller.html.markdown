---
title:  "FMImagePickerController"
date:   2014-07-08 15:04:00
---
![FMImagePickerController](/images/fmimagepickercontroller.jpg)

[Formal Method](http://formalmethod.net) has released it's first open source project called [FMImagePickerController](https://github.com/formal-method/FMImagePickerController).

FMImagePickerController is an asset picker for iOS that allows for multiple selection, supports both photos and videos and features a navbar dropdown for switching albums.  I extracted it from the [Cloudgram](https://cloudgram.com) codebase.

I created FMImagePickerController because the Apple provided UIImagePickerController doesn't allow for multiple selection and doesn't differentiate between photos and videos.  Additionally, there is no built-in mechanism to support switching between albums which is something you will inevitably want to do.

FMImagePickerController is built from scratch and based on Collection views.  The thumbnail sizes were design to mimic the default picker on iOS.  Thumbnails on the iPad use a higher resolution version of the image than what is proved by the the thumbnail on an ALAsset.

Formal Method will be open sourcing a lot code.  Follow us on [Github](https://github.com/formal-method).