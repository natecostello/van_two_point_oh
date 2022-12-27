---
type: post
section: blog
categories: 
 # one or more categories is permitted
 - tactical
navTitle: 
title: Web Page Dev Ops
author: Nate
date: 2021-06-29
tags:
 - meta
 - web development
 
metatags:
	# no metatags
cover: 
	# image file
 img: cover-dev-ops.jpeg
	# if attribution is needed
	# source: [vecteezy]
	# url: url
tldr: 'We are using Gatsby, a static site generator, for this website.  It uses a GitHub repository of markdown files for all the content, and turns that into HTML automatically.'
---
**TLDR: We are using Gatsby, a static site generator, for this website.  It uses a GitHub repository of markdown files for all the content, and turns that into HTML automatically.**

A primary goal was to make it so that when new content is pushed (uploaded) to the GitHub repository, the website is automatically rebuilt with the new content.  This post is about making that work.

Unlike a lot of GitHub/Gatsby based sites we separate our content repo from the website repo, which makes the above goal a bit more complicated to set up.

First, we have to set up a [GitHub Personal Access Token](https://docs.github.com/en/free-pro-team@latest/github/authenticating-to-github/creating-a-personal-access-token) with `repo` access.  We need to provide that token as a [secret](https://docs.github.com/en/actions/reference/encrypted-secrets#creating-encrypted-secrets-for-a-repository) to both the content-repo and the web-repo.

Next, we set up the content-repo to send a repository-dispatch to the web-repo whenever it has new stuff pushed to it.  We do this by creating a YAML file in the content-repo `.github/workflows/repository-dispatch-on-push.yml`.

In it, we have the following YAML:
```YAML
name: Dispatch On Push
# dispatch on push
on: push

jobs:
  dispatch:
    runs-on: ubuntu-latest
    steps:
      - name: Repository Dispatch
        uses: peter-evans/repository-dispatch@v1
        with:
          token: ${{ secrets.WEB_REPO_ACCESS }}
          repository: natecostello/agreenstello_site
          event-type: content-push
```
By doing this, when a push on this (the content-repo) occurs, a "repository dispatch" of type `content-push` (we just made that name up) is issued to the web-repo telling it the content-repo just got new stuff pushed to it.  This makes use of a [repository dispatch](https://github.com/marketplace/actions/repository-dispatch?version=v1.1.3) github action apparently created by peter-evans.  Thanks Peter.

Note that `secrets.WEB_REPO_ACCESS` is accessing that token we created and added to the content repo under the secret named `WEB_REPO_ACCESS`.

Lastly, we set up the web-repo to build the Gatsby site in and according to the web-repo.  We do this by creating a YAML file in the web-repo `.github/workflows/repository-dispatch-on-push.yml`.

In it, we have the following YAML:
```YAML
name: Gatsby Publish

on:
  repository_dispatch:
    types: [content-push] 

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v1
      - uses: enriikke/gatsby-gh-pages-action@v2
        with:
          access-token: ${{ secrets.ACCESS_TOKEN }}
          deploy-branch: master
          gatsby-args: --prefix-paths
```

When the web-rep gets a "repository dispatch" of type `content-push`, it uses two GitHub actions to check out the web-repo default branch (our develop branch) and build the site, and push the site files to the master branch, making the new version of the site go live (on GitHub pagers for now).  This makes use of the [Gatsby Publish](https://github.com/marketplace/actions/gatsby-publish) GitHub action by enriikee.  Thanks Enriikee.

Also note, `secrets.ACCESS_TOKEN` is a reference to our token mentioned before.  We named it `ACCESS_TOKEN` when we added it to the web-repo.

And if you were wondering how the web-repo gets the content-repo content, it does it by using a plugin, [gatsby-source-git](https://www.gatsbyjs.com/plugins/gatsby-source-git/), that lets Gatsby treat a repository like any other directory full of content files as it builds the site.

Update: After initially posting this, I found the code blocks looked a bit drab and unreadable.  I went ahead and installed a syntax highlighting Gatsby plugin](https://www.gatsbyjs.com/plugins/gatsby-remark-vscode/).  Much better.