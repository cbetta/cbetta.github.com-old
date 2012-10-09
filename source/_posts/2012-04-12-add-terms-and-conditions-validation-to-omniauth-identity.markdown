---
layout: post
title: Add terms & conditions validation to Omniauth Identity
date: 2012-04-12 00:32
comments: true
categories: rails omniauth ruby
---


<div class="entry-content"><p><a href="https://github.com/intridea/omniauth-identity">Omniauth Identity</a> is a great identity provide that shipped with Omniauth 1.0 it can be a bit simple at times. I wanted to add a simple terms and conditions check on signup to my registration form and this is what I came up with.</p>

<p>For this example I assume you already have a Omniauth Identity setup much like explained in <a href="http://railscasts.com/episodes/304-omniauth-identity">this Railscast</a>.</p>

<h2>Step 1 - app/views/identities/new.html.erb</h2>

<p>Add a checkbox to your form.</p>

<div><script src='https://gist.github.com/2368233.js?file='></script>
<noscript><pre><code>&lt;div class=&quot;field&quot;&gt;
  &lt;%= label_tag :conditions %&gt;&lt;br&gt;
  &lt;%= check_box_tag :conditions %&gt;
&lt;/div&gt;</code></pre></noscript></div>

<!-- more -->

<h2>Step 2 - app/models/identity.rb</h2>

<p>Add a attribute to your identity model and check for it to be set.</p>

<div><script src="https://gist.github.com/3859506.js?file=gistfile1.rb"></script>
<noscript><pre><code>class Identity &lt; OmniAuth::Identity::Models::ActiveRecord

  ...

  validates :conditions, acceptance: true, allow_nil: false, on: :create
  attr_accessor :conditions

  ...

end</code></pre></noscript></div>


<p>You should really only check this on create, otherwise this validation will run every time the identity gets updated, unless of course you decide to store the <code>conditions</code> value in the database.</p>

<h2>Step 3 - config/initializers/omniauth.rb</h2>

<p>This is the one that took me the longest to figure out. You need to tell Omniauth Identity what fields to look for on signup.</p>

<div><script src="https://gist.github.com/3859517.js?file=gistfile1.rb"></script>
<noscript><pre><code>Rails.application.config.middleware.use OmniAuth::Builder do
  provider :identity, fields: [:email, :conditions]
end</code></pre></noscript></div>


<p>In the same way you can add a user&#8217;s name and other details, though I highly recommend you don&#8217;t store those on the <code>Identity</code> but on the <code>User</code> model.</p>
</div>
