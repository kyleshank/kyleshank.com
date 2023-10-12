---
layout: post
title: Open Source LLMs
date: 2023-10-03 14:59 -0700
---

![blocks](/assets/images/00054-2179160345.png)

I am currently working on an AI project and have been paying very close attention to the developments in open source LLMs since March of this year when [Meta's LLM "Llama"](https://ai.meta.com/llama/) was [leaked](https://github.com/facebookresearch/llama/pull/73#issuecomment-1456338060).  I was able to get the small 7B model to run locally on my PC on an RTX 3080 10GB video card.  While the 7B model leaves a lot to be desired I had something that felt like ChatGPT running locally.  Incredible.

Meta has since formally released a second version of the Llama model along with a code generating model and a lot more ceremony and documentation.  It's a smart strategy.  Meta is looking to influence the majority of the LLM market through a bold open source strategy.  Everyone is using Llama as a foundation to build and train their models.  Meta stands to benefit not only from the outsourced development but also from its position as a resourceful leader in the space.

Things have cooled off a bit since the summer but it is still extremely hard to find instances that can run the largest Llama 2 70B model.  I was able to get access to an instance large enough on AWS SageMaker this week luckily to do some evaluations.  Across the cloud services it can cost between $5k-$15k per month for an instance large enough to run the Llama 2 70B model.  Microsoft Azure currently has the most competitive value in terms of pricing along with Google.  Locking in reserved instances for 1 year can bring down the cost to $4k/month.

AWS and Google tend to have service quota limits set at zero for all GPU related services. If you just setup a new cloud account for a startup you will not have access to any GPU resources and will need to explicitly ask for service quota increases.  This can be really frustrating and there is a chance your increase request will not be honored.

I'll have a lot more to say about these open source LLMs in the near future as I attempt to use them in production.
