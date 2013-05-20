# Meta::First Steps

Set Up your working branch:

<pre># Clone the project wiki repository
$ git clone git@github.com:axsh/wakame-vdc.wiki.git

# Change to directory
$ cd wakame-vdc.wiki

# Change to staging branch
$ git checkout staging

# Please work in your branch from staging
$ git checkout -b yourName
</pre>


Do some work ....
(if you are in a new subdirectory, 
  move up to a previously existing one.)
<pre>
# Merge your work to Staging
$ git checkout staging
$ git merge yourName
$ git push origin staging</pre>

<pre>
# Merge Staging to Master
$ git checkout master
$ git merge staging
$ git push origin master</pre>

Handy Commands:

# Check that you are in your branch
<pre>
$ git status
# On branch shaun
nothing to commit (working directory clean)</pre>


<pre>
# Check what other current branches are created
$ git branch
  master
* shaun
  staging
</pre>
