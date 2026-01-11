---
title = 'Scaling Agentic Ai'
date = 2026-01-11T10:13:26+02:00
draft = true
---

# Scaling the use of agentic AI in software development

This blog post is a collection of my thoughts and ideas before starting a project driving more wide-spread adoption for AI tools in my company. I will try to write another blog post (or several) later to reflect on our learnings.

## Where we are coming from

I work in a company that used to be known primarily for it's HVAC design services [Granlund Oy](https://www.granlund.fi/). We have also embraced the digitalization and we have used our expertise to create a real estate management solution [Granlund Manager](https://www.granlundgroup.com/granlund-manager/). We have a software department consisting of approximately 70 people of which 35 are dev and ops people developing said SaaS solution.

We are currently building a new generation product platform but our SaaS software in production still runs mostly in very traditional server deployments. Building the new platform (and actual product features for that new platform) gives us the option to test out ideas in a greenfield initiative without having adverse impact on our actual customer-facing services.

We have no certified geniuses on board. To my knowledge we have no PhDs, no one has written super-popular open source libraries or been featured in newspapers for being wunderkinds (this very much includes me). What we do have is an experienced crew of smart, dedicated and experienced people who know our subject matter very well. I think that this is relatable for 90% of other companies who have created succesfull SaaS offerings of which almost no one has ever heard but still get 10,000+ active users month after month.

## Why do I think that we should invest in AI development

I have been experimenting with AI offering since the big launch of ChatGPT but I had very little knowledge of LLM's beforehand. I would definitely never have believed that LLM's would be close to this type of breakthrough and even after ChatGPT was released I had no idea what to expect in the future. I am not very good at predicting the future but to me it seems that development of the core LLM models has plateaued somewhat so that we are seeing only incremental gains. What we are currently seeing is using the "agentic" self-improving model being applied to a wide set of tools all around.

I am not actively involved in development and so I'm not a very prolific coder any more. I would like to think that I still have pretty good understanding of the principles involved, though, and can recognize a good solution when I see one. Remembering back to the initial days of ChatGPT launch and GPT 3.5 it was very easy to see that the tool could be helpful but was nowhere near producing production grade code. Now in the latest test I used claude code to write me a RAG-assisted chat that scraped content from multiple sources (atlassian + files + online faq + support tickets) and provided a chat interface (cli or web) to query those sources. It literally took me one and a half days of development time to get a "prototype" going including azure infrastructure deployment/destruction scripts **and** I had time to clear my email backlog while Claude was chugging away at tokens. And this was a project level one-shot starting from an empty repository and azure subscription without any preparation at all. I am certain that it would have taken me at least a week of development to get this prototype ready for presentation otherwise. This is crazy, this is maybe even [party](https://www.youtube.com/watch?v=NtOlguB6lg0).

I think we have crossed the threshold where this phenomenon can be ignored by anyone in the software development space. I am close to 100% certain that AI assisted development - or even AI drived development - is going to be the future. I obviously  cannot predict the exact details but my current guess is that at least for the next three years the most effective strategy for most companies is going to be developers sheperding and instructing agents very closely with a bunch of manual coding in-between. But in a few years I think that we will see development workflows that revolve around specifications/tickets (which hopefully will evolve to be something better than the current JIRA issues with a million confusing meta fields for "agile") and a bunch of CI + preplanned manual intervention steps. Obviously this is more suited for feature factory -type businesses (which probably write like 90% of the code being written?) than semi-deep technology companies making webscale things and orbs that let you chat with Sauron.

We are in a precarious situation because the economics of this new and glorious AI world are still up in the air. Market leaders (OpenAI, Google, Anthropic) must see that they are not that far ahead of the Chinese open source models (and Mistral) and they are probably doing everything they can not to become glorified token factories that can become outdated if a new model reaches parity. All three seem to have a different edge (OpenAI's partnerships, Anthropic's tooling and Google's massive scale and hardware). If they are able to close their ecosystems (provide massive benefits for companies to lock in to their ecosystems) we are heading for a very expensive future. If, however, solutions like [OpenCode](https://opencode.ai/) can make it possible to avoid vendor lock-in, we might be headed for a very exciting future!

I will not touch on the subject of GAI, that is definitely above my pay grade.

## When is AI a better fit?

We already have some studies that give us some initial ideas of when we can utilize LLM's for software development. I'll dig up the sources if I can be bothered. The biggest obstacles are data protection and security, LLM's not being a good fit for your codebase or your codebase not being a good fit for LLM's.

### Security

The biggest obstacles are probably related to data governance, IP protection or other regulations. If you are working with something sensitive enough that your development environment is not connected to the internet that is a good sign that using AI might be very difficult. Running LLM's requires special hardware (GPUs) and the best ones are still proprietary so you can't deploy them yourself.

In some heavily regulated industries you might be required to prove that the tools you are using are not going to introduce new risks (or that they mitigate more risks than they introduce) which might be very hard to do.

Generally you also want to keep your customer data way separated from any public AI providers' services (which means that no production access for you coding agent!) unless your customers have already signed off on that. Maybe anyways.

### Badly adjusted LLM's

Agentic AI use can actually slow you down unless you either can a) process such big tasks at once that you are still getting benefits even if you have to do multiple run-throughs on your tasks or b) you are able to one-shot most of the tasks that you do. If you use languages, frameworks or libraries that the LLM's do not know by heart you run a risk of having to provide a lot of context for the model to understand what you are trying to achieve. 

Popular technologies are definitely better suited for AI assisted development and LLM's do not have that sort of "general understanding" of software development that they could easily write languages that were not included in their training materials *as well* as they can write say Typescript, C# or Java.

In the same vein I theorize that if your architecture and code style choices are in alignment with publicly available codebases you will have more success with your AI assisted development.

### Problematic workspace

Sometimes we cannot fault the LLM's for not understanding your codebase, though. If you have a huge codebase with criss-crossing dependencies it might be very hard for the agent to get all required information in it's context. Legacy technologies are not necessarily a big problem (there is a lot of training materials sometimes available for technologies like webforms) but unorganized code and haphazard architecture definitely is.

Theorizing more: LLM's might be better able to operate in a monorepo where related libraries are immediately available as long as we can instruct where the feature/code for the actual task resides. My personal experience also is that LLM's operate better when we can provide them a reasonably sized input. If I try to just cram all of the available information into the context it doesn't result in better outcomes - and it uses more tokens and takes more time as well.

### What to do?

So how can we make sure that we can use LLM's well in the future?

**Well defined architecture**: Have an architecture that you can actually type out without having to write a novel. Define how the different types of components in your solution should interface and interact.

**Organize your code**: Make it possible for the model to operate on smaller portions of code at a time.

**Snug instructions**: Write your AGENTS.md and other contextual information (like skills) as tightly as you can. 

I still try to avoid over-fitting our technology choices - I don't think we should all be writing Typescript from now on - but we definitely have a new reason to [Choose Boring Technology](https://boringtechnology.club/).

## Minding the gap


    

- How to balance the workflows
    - Velocity factor        
        - When development velocity stops being an issue, other issues are likely to pop up
        - In the coming years we will have to choose where we decide to invest: Where will we get the best gains
        - Let's be honest: Velocity is primarily why we are here and what we expect to get out of this.
    - Fun factor
        - Doing the work should be interesting, motivating and (hopefully) even fun.
        - This is the real black horse. How will this affect our developers' morale? It might make things insanely fun but also weird, uncomfortable or downright demotivating
    - Cost factor
        - At some point it will be cheaper to do things without AI than trying to just throw tokens at problems
        - Ideas like "let's throw all of our tickets at claude and see what happens" might be economically unviable for normal companies that actually have to make money
    - Quality
        - Quality is the big boogeyman. Will using agentic AI lower our code quality?
        - To be frank, code quality hasn't been that great in many places this far either. However, GIGO (see Kieran Gill's blog post) is a real driver for quality.
- What we have to figure out?
  - Selecting the tools and finding the balance between letting people choose their tools and getting a common configuration working
  - What models we can use? How can we avoid being locked to a certain providers models (there is a term for this)



## Our plan



## Ideas

### Sources

- Claude Code creator Boris Cherny's [X-thread](https://xcancel.com/bcherny/status/2007179832300581177)
- Kieran Gill's blog post [Scaling LLMs to large codebases](https://blog.kierangill.xyz/oversight-and-guidance#:~:text=The%20environment%20is%20your%20context)