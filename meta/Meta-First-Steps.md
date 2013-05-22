Meta::First Steps

Set Up your working branch:

```bash
# Clone the project wiki repository
$ git clone git@github.com:axsh/wakame-vdc.wiki.git

# Change to directory
$ cd wakame-vdc.wiki

# Change to staging branch
$ git checkout staging

# Please work in your branch from staging
$ git checkout -b yourName
```


Do some work ....
(if you are in a new subdirectory, 
  move up to a previously existing one.)

```bash
# Merge your work to Staging
$ git checkout staging
$ git merge yourName
$ git status
$ git push origin staging
```

```bash
# Merge Staging to Master
$ git checkout master
$ git merge staging
$ git status
$ git push origin master
```

Handy Commands:

```bash
# Check that you are in your branch
$ git status
# On branch shaun
nothing to commit (working directory clean)
```


```bash
# Check what other current branches are created
$ git branch
  master
* shaun
  staging
```
