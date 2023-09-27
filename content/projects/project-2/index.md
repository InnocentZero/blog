+++
title = "OpenMP Optimisations"
date = 2023-04-14

[taxonomies]
categories = ["software"]
tags = ["software", "C++", "HPC"]
+++

Who knew parallelisation would be so easy!

<!-- more -->

I recently worked on a project that involved extensive use of [OpenMP](https://www.openmp.org/). It might be restricted in its abilities but believe me when I say this, it is one of the easiest and the most beginner friendly frameworks to work with when it comes to concurrency and parallel programming.

While the technical details are not important, it primarily works on compiler directives. Often times outperforming both `std::async` and `std::threads`, it definitely heavily optimises your code. The most obvious case where you'd benefit from parallel code is loops. It has the best support for loops. I was asked multiple times during my project why I preferred this over something native to C++ like `std::threads`. There are a multitude of reasons. 

1. `threads` is STL. As with all things, STL implementations suck when it comes to anything other than competitive programming (too bad Codeforces [does not](https://codeforces.com/blog/entry/7552) [support](https://codeforces.com/blog/entry/2496) these). 
2. `threads` asks you to write purely functional ... well everything. It becomes an unnecessary pain to even think about complicated algorithms that absolutely need a non constant data structure. Sure, functional programming is beautiful, and mastery over it is probably a complete command over programmable logic, but after a certain point everything just makes things hard.
3. It does not (more like cannot) inline usual functions. Functors, yes maybe, but why do you want me to wrap everything in a class of its own and add [more assembly overhead](https://godbolt.org/z/Gq49Pj3MW) just for the compiler to know what the function signature is!

These are just a few of the many issues with it. I haven't studied `async` in much detail, so I don't think I can comment on it. Some people may also recommend CUDA, it's just too low level for my job. All this being said, just because OpenMP is easy doesn't mean it doesn't come with its own sets of problems. To its credit though, the manual has a solution for pretty much everything you possibly have a query over. 
## Problems I faced during the project

### Implementation of a thread safe queue

My original plan was to have a heap allocated array with push pointer and a pop pointer. What I required for BFS was a queue with multiple producers and a single consumer. Since my implementation was never going to have the problems of an empty queue when there isn't one, I had the great option of making it lock-free. 

> Lock free structures are much easier and really very efficient in terms of usage. A lock just slows things down.

There was a simple solution I came up with. Make the push operation atomic. OpenMP by default locks the structure in which atomic operations are done, but since the operations are extremely efficient (atomic operations are really just simple writes, increments and other simple binary operations) the locks had little to no overhead on the program. 

My initial push was something along these lines:

```cpp
struct TSQueue {
    uint64_t push_pointer = 0;
    uint64_t pop_pointer = 0;
    static constexpr uint64_t capacity = 1 << 15;
    uint16_t *ts_queue = new uint16_t[capacity];
    TSQueue() {}
    ~TSQueue() { delete[] ts_queue; }
    void push(uint16_t node) {
        #pragma omp atomic write
        this->ts_queue[push_pointer] = node;
        #pragma omp atomic update //by default it is update
        push_pointer++;
    }
    uint16_t pop() {
        uint16_t var = this->ts_queue[pop_pointer];
        pop_pointer++;
        return var;
    }
};
```
 There is one very obvious problem here, and that is a data race. Suppose we have 2 threads _A_ and _B_ who are about to push the Node into the queue. _A_ sees the value of `push_pointer` to be some value, say 5. At the same time, _B_ also sees the value of `push_pointer` to be 5. *A* writes to the queue at index 5, then *B* does the same. This is an issue, since we are missing a node in the process. Now an arguably worse thing happens. Both of them increment `push_pointer`, thereby resulting in a garbage value at `ts_queue[6]`. This screws up the entire process.
 
One fix for that is do go deep into the compiler and change the `pragma` (or redefine it) to have the lock the OpenMP places, to stay till I increment the pointer as well (we technically don't need the `atomic` since OpenMP guarantees that anything outside the parallel region will be in shared memory, but the race still stays).

Another fix for that was to have the push inlined and pushes happening in a for loop that pushed according to the thread number being used. Then the iteration over the number of vertices can be blocked into chunks of the size of number of threads.

As with all things, however, it wasn't that easy. It came with its own set of problems. It is not necessary that each thread may insert a value into the queue. Hence we need it to have a known garbage value we can check for. This adds an `O(n)` extra loop (that can be parallelized) but it doesn't change the complexity of the code.

I went with the second approach. Now that demands (as I learned later after hours of debugging), due to the way the loops are structured and nested, that the first _t*n<sup>2</sup>_ values in the pointer `ts_queue` to have a known garbage value. This changes the complexity for the _APSP_ problem from `O(n<sup>3</sup>)` to `O(n<sup>4</sup>)`. The first one was bad enough for a time complexity already. The second one is very obviously much worse.

So I did what no sane person prefers to do apparently. Use [static table generation](https://en.wikipedia.org/wiki/Template_metaprogramming#Static_Table_Generation) and fill the entirety of `ts_queue` with a compile time value of **-1**.

This was a really good exercise for me in general and made me think in ways programmers usually don't think in. So definitely there was a lot to learn from here.

