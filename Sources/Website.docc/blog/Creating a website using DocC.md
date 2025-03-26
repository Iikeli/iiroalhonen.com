#  Creating a website using DocC

How to create a simple personal website using DocC.

@Metadata {
    @PageImage(purpose: thumbnail, source: "DocC-Header")
    /*@PageImage(purpose: icon, source: "DocC-Header") This is for the article top banner */
}

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

Now our page is rendering as expected, but has the title of "Website", which we of course do not want. Luckily we don't need to lose our reference to the `Website` documentation catalog, we can just add a `@Metadata` block to our `main.md` file, like so:

```markdown
@Metadata {
    @TitleHeading("Hi! I am")
    @DisplayName("Iiro Alhonen")
}

```

Great, things are looking better already.

## Adding the first blog post

Now let's add a skeleton for our first blog post, so we can start getting the structure together.

Let's create a folder inside the `Website` documentation catalog called `blog`. This will house our blog posts, so let's create the first one, a markdown file called `Creating a website using DocC`. Surprisingly, that's the exact post I am writing right now. It should look something like this:

```markdown
#  Creating a website using DocC

How to create a simple personal website using DocC.

## Overview

This is where we shall start.
```

Now we just need to link our blog post to our home page and we are ready with our *very* crude website with blog.

So let's change our `main.md` to look like this:

```markdown
# ``Website``

This is my website.

@Metadata {
    @TitleHeading("Hi! I am")
    @DisplayName("Iiro Alhonen")
}

@Options(scope: global) {
    @AutomaticSeeAlso(disabled)
    @AutomaticTitleHeading(enabled)
    @AutomaticArticleSubheading(enabled)
    @TopicsVisualStyle(list)
}

@Options(scope: local) {
    @TopicsVisualStyle(detailedGrid)
}

## Overview

Hi!

I'm Iiro. I write iOS applications for a living and sometimes write tutorials on consepts I learn.

## Topics

### Blog posts

- <doc:Creating-a-website-using-DocC>

```

Now I added a lot of `@Options` there, some with a global scope, and some with a local scope. In general the DocC documentation is pretty great, so if you want to learn more, you can read [more here](https://www.swift.org/documentation/docc/options).
The most important thing here is the `@TopicsVisualStyle()` that dictates how our list of blog posts will be shown.

## Publishing the site with GitHub Pages

During my time as a developer I've used multiple different website hosting platforms from servers to no-code platforms. All of the different approaches have their pros and cons, but as a developer, it's very hard to argue with the ease and simplicity that is GitHub Pages. I moved there a while ago and I don't think I will ever have the need to change to a different platform. But if you have no interest in using GitHub Pages, feel free to skip this portion and use whatever hosting solution you prefer.

Now the only thing you need to do for publishing your website in GitHub Pages is to go to your project, navigate to `Settings -> Pages` and under `Build and Development -> Branch` you can check your `main` (or any other branch you want to use) and hit save. This will run the default workflow for creating a website from your GitHub repository. [More info here.](https://docs.github.com/en/pages/getting-started-with-github-pages/configuring-a-publishing-source-for-your-github-pages-site#publishing-from-a-branch)

Now, of course this will not work as we want out of the box, as it will just work with our root folder and trying to run a Jekyll build workflow. Not what we want.

Since we are not working with Jekyll, we need a little help from GitHub Actions to get the site up and running like we want to.
