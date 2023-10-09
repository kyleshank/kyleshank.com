---
layout: post
title: AWS Bedrock
date: 2023-10-09 12:00 -0700
---

AWS has just [launched a new service called Bedrock for running foundation and custom generative AI models](https://aws.amazon.com/bedrock/).  At first glance this looks like an extremely convenient way to deploy open source foundational models and customizations of them.  Additionally, it would allow businesses to utilize LLMs within their account and private VPCs without having to ship customer data in a zillion plaintext calls to 3rd parties like OpenAI.

The available models to start:
- [Anthropic Claude](https://aws.amazon.com/bedrock/claude/) (100K token context window!)
- [Cohere Command](https://aws.amazon.com/bedrock/cohere-command/)
- [AI21 Labs Jurassic](https://aws.amazon.com/bedrock/jurassic/)
- [Stable Diffusion XL](https://aws.amazon.com/bedrock/stable-diffusion/)

[Llama 2](https://aws.amazon.com/bedrock/llama-2/) support is coming soon.  I’m really interested in where the pricing lands on this.

The pricing between the models is a mix of per-token pricing or time based (hourly) pricing.  Unfortunately, it appears to be one or the other and some models are hourly only and just as expensive as everything else on SageMaker.  Throughput can be purchased in provisioned amounts.

Amazon now has multiple efforts with SageMaker and Bedrock for deploying AI services.  Bedrock looks like what I’ve been searching for as a developer but SageMaker may still be required for training and other tasks.