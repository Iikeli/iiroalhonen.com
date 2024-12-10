#  Creating a website using DocC

How to create a simple personal website using DocC.

## Overview

For a while I've been following the evolution of [the DocC framework](https://github.com/swiftlang/swift-docc) and have been interested in creating my own personal website using it. The potential simplicity it offers in creating a simple blog is very appealing to me. So in this blog post, I will be creating a simple personal blog using DocC, and I'll show how to publish it to GitHub Pages in a follow-up post.

The source code for this project can be found [here](https://github.com/Iikeli/iiroalhonen.com), and more specifically the PR for this post can be found [here](https://github.com/Iikeli/iiroalhonen.com/pull/1).

## Setup

Like most things in software, there is some setup involved, though in this case it's very minimal. First, you need to create a new Xcode project. For simplicity, create an empty `Package` project, by selecting `File` -> `New` -> `Package`, and then selecting `Empty` from the list of templates. This will create a project with a single file inside. From here we can build our website and understand what files are actually needed.

So far the `Package.swift` file should look something like this:
```swift
// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MyPackage"
)

```

Let's create a folder to hold all of our source code. As per general convention, we'll call this folder `Sources`. In that folder, we will create a `Documentation Catalog` by right clicking on the folder, selecting `New file from template...` -> `Documentation Catalog`. By default the `Documentation Catalog` will be called `Documentation`, as will the markdown file inside it. There is also a folder called `Resources` inside `Documentation` that we will ignore for the time being. Let's rename the folder `Documentation` to `Website` and the file inside it `main`, since in practice the `Documentation Catalog` will contain all the source for our website and the `main.md` file will be our landing page.

Next to the `Website` documentation catalog we will create an empty `Swift` file called `Website`. For clarity, I added a simple comment to the file, explaining that it's only there for the compiler.

Next is time to modify our `Package.swift` file to:
1. Make sense
2. Compile

So let's modify our `Package.swift` to look like this:
```swift
// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Iiro Alhonen Website",
    platforms: [.macOS(.v15)],
    products: [
        .library(
            name: "Website", targets: ["Website"]
        ),
    ],
    targets: [
        .target(name: "Website")
    ]
)
```

Now our project should compile and we can start writing our website. You can see what has been created by building the documentation from `Product` -> `Build Documentation` (shortcut being ⌃ ⇧ ⌘ D). Or by enabling the `Assistant` in split view ( ⌃ ⌥ ⌘ ⏎ ).

> The assistant with markdown is not perfect, so closes and restarts of the assistant are often needed. So remember that keyboard shortcut!

Oh no! Our `main.md` is not showing anything! That's because it is referencing `MyPackage`, and not `Website` (which we named our `Documentation Catalog`). Now, let's fix that and change our `main.md` to look like this:

```markdown
# ``Website``

Summary

## Overview

Text

## Topics

### Group

- ``Symbol``

```

Now our page is rendering as expected.
