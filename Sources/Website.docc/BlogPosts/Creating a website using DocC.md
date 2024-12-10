#  Creating a website using DocC

How to create a simple personal website using DocC.

## Overview

For a while I've been following the evolution of [the DocC framework](https://github.com/swiftlang/swift-docc) and have been interested in creating my own personal website using it. The potential simplicity it offers in creating a simple blog is very appealing to me. So in this blog post, I will be creating a simple personal blog using DocC, and I'll show how to publish it to GitHub Pages in a follow-up post.

The source code for this project can be found [here](https://github.com/Iikeli/iiroalhonen.com), and more specifically the PR for this post can be found [here]().

## Setup

Like most things in software, there is some setup involved, though in this case it's very minimal. First, you need to create a new Xcode project. For simplicity, create an empty `Package` project, by selecting `File` -> `New` -> `Package`, and then selecting `Empty` from the list of templates. This will create a project with a single file inside. From here we can build our website and understand what files are actually needed.
