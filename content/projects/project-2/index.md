+++
title = "OpenMP Optimisations"
date = 2023-04-14

[taxonomies]
categories = ["software"]
tags = ["software", "C++", "HPC"]
+++

Who knew parallelisation would be so easy!

<!-- more -->

I recently worked on a project that involved extensive use of [OpenMP](https://www.openmp.org/). it might be restricted in its abilities but believe me when I say this, it is one of the easiest and the most beginner friendly frameworks to work with when it comes to concurrency and parallel programming. 

While the technical details are not important, it primarily works on compiler directives. Often times outperforming both `std::async` and `std::threads`, it definitely heavily optimises your code. The most obvious case where you'd benefit from parallel code is loops. It has the best support for loops. I was asked multiple times during my project why I preferred this over something native to C++ like `std::threads`. There are a multitude of reasons. 

1. `threads` is STL. As with all things, STL implementations suck when it comes to anything other than competetive programming (too bad Codeforces [does not](https://codeforces.com/blog/entry/7552) [support](https://codeforces.com/blog/entry/2496) these). 
2. `threads` asks you to write purely functional ... well everything. It becomes an unnecessary pain to even think about complicated algorithms that absolutely need a non constant data structure. Sure, functional programming is beautiful, and mastery over it is probably a complete command over programmable logic, but after a certain point everything just makes things hard.
3. It doesn't (more like cannot) inline usual functions. Functors, yes maybe, but why do you want me to wrap everything in a class of its own and add [more assembly overhead](https://godbolt.org/z/Gq49Pj3MW) just for the compiler to know what the function signature is!

These are just a few of the many issues with it. I haven't studied `async` in much detail, so I don't think I can comment on it. Some people may also recommend CUDA, it's just too low level for my job. All this being said, just because OpenMP is easy doesn't mean it doesn't come with its own sets of problems. To its credit though, the manual has a solution for pretty much everything you possibly have a query over. 

