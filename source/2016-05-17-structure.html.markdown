---
title: Structure
date: 2016-05-17 08:07 EDT
tags:
---
Navigation and structure are important parts of a software product.  They carry meaning and signal what about a product is prioritized.

Structure is especially important for web applications.  URLs still have meaning in my opinion.  You should be able to hit Back in a web app and actually navigate backwards from your current context.  I know this isn't popular with the react/javascript/one-page-web-application crowd but its the main reason I prefer to pepper in Javascript instead of going whole hog.

I'm currently refactoring [fans.fm](https://fans.fm) to support a new model of one subdomain per podcast.  It forced me to reconsider the whole structure of the application.  

The most important thing when utilizing subdomains is ensuring that all accessible urls on that subdomain make sense.  Every subdomain URL should have something to do with the subdomain context that defines it.  In my case a subdomain maps to a podcast so you shouldn't be able to access anything but episodes and listings of episodes on a given subdomain.  

If a subdomain defines a context that means the root domain must also have a clear role.  For instance, should you be able to access a sign-in page within the subdomain context?  My feeling is that shouldn't be possible.  Any session or user management actions should take place on the root domain.  This also goes for any action that can't be considered within the context of a single podcast.

Those rules while simple are important.  It's a lot of work to put them in place but its worth the effort.  Consistency in a product is paramount; right down to every URL the user may or may not even notice.
