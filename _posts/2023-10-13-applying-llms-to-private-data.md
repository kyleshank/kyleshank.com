---
layout: post
title: Applying LLMs to private data
date: 2023-10-13 08:51 -0700
---

![code chains](/assets/images/00015-2670550850.png)

Over the past year I have been focused on how to apply LLMs to private data.  At first I thought training on top of an existing LLM would make sense based on my previous machine learning experience.  Quickly it became clear that wouldn’t deliver the results one would expect.  Prompt engineering with clever and long context windows establishing a basis for an eventual question was the way to go.  [LlamaIndex](https://www.llamaindex.ai/) is a framework that does just that.

LlamaIndex is a simple, flexible data framework for connecting custom data sources to large language models.  The framework provides the ability to connect to a variety of data sources, the ability to index that data and query/chat engines to interface with the data.

My goal was to create a natural language search prototype over a synthetic data set.  I used ChatGPT to generate the synthetic data set as an SQLite database that ran in memory.  I configured Llama index to use that database and set an OpenAI API key to utilize ChatGPT 3.5 as the executing LLM.  That was it.

I was able to ask complex questions and get text answers that were relevant to the data set.  Complex questions appeared to work as long as they followed the naming found within the SQL schema.  Not every question worked but most did out of the box.  It became clear if I cleaned up some of the naming found in the schema that the LLM would make less mistakes.

Performance wasn’t great.  Simpler questions yielded faster response times.  Broader questions that had to consider the entire data set too much longer to execute.  At its fastest it was a second or so to respond and at its slowest it was 30 seconds or more.  Some very broad queries failed to execute.

Context window size matters.  When I increased the context window to 16K for the ChatGPT 3.5 LLM model the answers improved.  GPT4 was much slower but the responses were better than GPT3.5.

So how does LlamaIndex actually achieve this?  After turning on verbose debugging and examining the sparse code base it was clear: LlamaIndex was asking ChatGPT to do just about everything.  Every database query was written by ChatGPT and all logic was handled by ChatGPT.  LlamaIndex was just there to ask, execute the query ChatGPT told it to and then supply the response back.  

The query engine process worked in the following way for every natural language search question:

- LlamaIndex: Prompt ChatGPT with context window containing entire database, include the question asked and then request an SQL query as part of the response.
- ChatGPT: Responds with the SQL query to execute.
- LlamaIndex: Executes SQL query on database and provides results as response to ChatGPT and asks for synthesis.
- ChatGPT: Repeats the steps above if there is another query it would like to execute. Otherwise synthesizes all of the data gathered in a text summary response.

It was illuminating to see what it was like to hand the keys over to an LLM.  From writing every query and synthesizing the response to the weird and simple mistakes that were made.  Ambiguous language and synonymous terms not being interpolated were major issues.  I had to add 50+ specific prompt directives to get it to do what I wanted for most queries.  In many ways it was like working with a junior developer.