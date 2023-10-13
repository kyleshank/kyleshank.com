---
layout: post
title: New startups can’t acquire cloud resources
date: 2023-10-11 15:09 -0700
image: /assets/images/00049-495422607.png
---

This is more of a public service announcement than a post but its worth stating: new cloud accounts at AWS, Google and beyond have severe service quota limitations on resources.  Nearly all services have a service quota default of zero when the new account is created.  All services that require accelerated GPU resources will certainly start with a quota of zero.

There are many reasons to create a new cloud account.  The formation of a new entity, the formation of a new product, a merger, the need to separate data from code and access control are all valid reasons.  The problem: a new cloud account is effectively a clean slate without a payment history.  As a result cloud providers assume you can’t afford expensive resources or don’t need them yet.

Requests can be made to increase service quotas.  Sometimes they are given, other times you have to justify and often you may be denied especially if there is no payment history.

I recently setup a new AWS account and was stunned to find that I could launch any EC2 instance greater than 5 virtual CPUs period.  Any instance outside of the most basic web server would require a service quota request.  EC2 wasn’t the only problem either: service quotas across the board were extremely restrictive.  Requests for quota increases took weeks of back and forth and promises that this new entity could in fact afford the resources.  Frustrated by the lack of progress I checked out Google Cloud Platform and found the exact same situation with service quotas which were also all set to zero and also required complaining.

At the venture studio we are launching several startups a year and many projects require accelerated instances or services.  The lesson: create new cloud accounts for new entities early and make requests for services before you need them.  Do this across cloud providers to ensure you have the resources when its time to build even if they are not on your preferred cloud platform.

The problem appears to be specifically for new accounts.  I have a long running AWS account that I created in 2009 with a long and substantial payment history for several non-trivial services I still maintain. That account has no issues with service quotas with levels set to more than I would ever need.  In a time where GPUs are being fought over having a mature AWS account is actually meaningfully important.