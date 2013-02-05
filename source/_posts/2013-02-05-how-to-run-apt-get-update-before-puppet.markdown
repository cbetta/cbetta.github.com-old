---
layout: post
title: "How to run apt-get update before Puppet"
date: 2013-02-05 14:56
comments: true
categories: ruby puppet
---

One of the problems I keep running into with Puppet is that the packages I'm trying to install are very new and I need to run `apt-get update` to update the repositories. Because Puppet does not run scripts it gets rather annoying to get the update to run before you install any packages.

I found a lot of solutions around the web but this one seems to work best for me.

<script src="https://gist.github.com/cbetta/4714469.js"></script>