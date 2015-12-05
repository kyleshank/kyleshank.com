---
title: Prevent UITableView From Scrolling During Updates
date: 2015-12-05 09:32 EST
tags:
---

Sometimes when you go to update a table view cell and you're not scrolled at the top (or bottom if you're inverted) of your table view you'll notice one of the follow behaviors:

- The UITableView scrolls to the top or bottom
- The UITableView looks hung over and flashses back and forth
- The UITableView jiggles just a bit but enough to notice

You feel lightheaded.  Dazed.  Confused.  You are just a developer who wants to trigger a refresh of a little table view cell.  The struggle is real.

The solution that worked for me was two-part:

- Do the best you can establishing estimated heights for all of your table cell types.  Even if heights are somewhat dynamic this helps the UITableView.
- Save your scroll position and after updating your tableView and making a call to `endUpdates()` reset the content offset

Here is the code required to maintain the scroll view's content offset and prevent unnecessary animations from starting.

```swift
let lastScrollOffset = tableView.contentOffset
tableView.beginUpdates()
...
tableView.endUpdates()
tableView.layer.removeAllAnimations()
tableView.setContentOffset(lastScrollOffset, animated: false)
```
