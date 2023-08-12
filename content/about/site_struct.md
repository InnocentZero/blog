+++
title = "Site Structure"
render = true

[taxonomies]
categories = ["software"]
tags = ["SSGs", "webpages"]
+++

This site is built using [Zola](https://www.getzola.org/) which works on the [Tera template engine](https://tera.netlify.app/). The theme used for the website is [Papaya](https://www.getzola.org/themes/papaya/). I use git for version control and the web page is hosted on github-pages.

Unlike the standard method of using themes in zola, I cloned the entire theme to the base of the repository and then added and removed content according to my own will. This gave me finer control over the details[^1]. I prefer markdown to asciidoc because of its simplicity and ease of use. It also doesn't bind me to one toolchain and leaves me free to choose from the many options of frameworks that are out there to choose. Markdown also has a very low learning curve due to its simple syntax[^2]. 

The framework is fully [free and open source](https://www.howtogeek.com/129967/htg-explains-what-is-open-source-software-and-why-you-should-care/).

I have plans to include a singular web page with the entire site map displayed in a grpahical format. It will probably take some time. Suggestions for the same are most welcome.

---

[^1] [Power users and finer control](https://usabilitygeek.com/problem-with-power-users/) is very arguably a bad thing for a software. Not catering to them leads to the loss of your biggest technical critiques. Catering to them easily creates an overengineered mess of a software. A software that manages to give users control without sacrificing upon its generality is the best kind.

[^2] [Relevant AskUbuntu question](https://askubuntu.com/questions/342624/what-advantages-does-markdown-have-over-asciidoc)
