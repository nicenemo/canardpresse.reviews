# Usage

* Canard Presse reviews is powerd by the [Hugo blogging platform](https://gohugo.io/)
* Hugo generates static sites. Therefore there is no CMS.
* The source texts are written in markdown and managed using the git version control system.
* The sources are stored at the default develop branch in a [Github repository canardpresse.reviews on nicenemo's account](https://github.com/nicenemo/canardpresse.reviews)
* The generated website is also stored in Github but then in the [Master branchi of canardpresse.reviews on nicenemo´s account](https://github.com/nicenemo/canardpresse.reviews/tree/master)
* The `canardpresse.reviews` iGithub repository has been configured in such a way that it serves the website via [https://canardpresse.reviews](canardpresse.reviews).
* An automated job on [Travis-CI](https://travis-ci.org/) has been configured in such a way that adding or changing a post will automatically regenerate the website.
* For now the default theme has been used.

## Creating posts

A new blog post can be added in more than two  ways:

1. Easy, via the github web interface add a new markdown file under [https://github.com/nicenemo/canardpresse.reviews/tree/develop/content/posts](https://github.com/nicenemo/canardpresse.reviews/tree/develop/content/posts).
   Ensure that it has the right meta data. See the other posts for an example. You can edit via the github web interface. Posts marked with `draft: true` in the meta data will not be published. But changes in draft posts will still trigger a build.
2. Use the Hugo blogging tool locally. More on this in the next paragraph.


## Use Hugo on windows

1. Install git
2. Install Hugo
3. Install a good markdown editor, e.g. Visual studio code.

All three tools can be installed via chocolatey.


## Get the source repo

Clone the source repository using the git commmand line tool


```bash
git clone git@github.com:nicenemo/canardpresse.reviews.git
```

You should have a public/private keypair configured in Github to do this without having to type in your credentials again and again.


## Reinitialze the repository

Some git magic is used to refer to both a theme repository as wel as the `master` branch for publishing. This last branch is mapped to the public directory. This directory is also used by hugo to generate the site.
To prepare a local build. run the script using a bash shell, e.g. the git command prompt in Windows.

```bash
./reconfigure.sh
```

This will reset the repository and reconfigure all git *submodules*. You can also run this script if you messed up everything.
After this script was run your theme is ready and also the public directory is already populated.


## Adding your first post

From within the `Canardpresse.reviewsi` repository do  the following

```bash
hugo new myNewBlogPost.md
```

This will generate a new empty blogpost under `content/posts/myNewBlogPost.md`.
it is allready populated with a title, the current date and a flag marking it as draft. You can change this and even add more flags, e.g. author, or other theme specific flags.

Under the meta-data between three hyphens `---` You can write your post using normal markdown.

A  preview can be obtained by running hugo as server locally with: 

```bash
hugo server
```

This will run a server on [http://localhost:1313](http://localhost:1313). You can still make changes to your markdown and press save or add even more posts. The changes will be automatically reflected in the local site.
 

When you are happy with your post and want it to be published you first remove the `draft` setting, either by removing the line from the meta-data or setting the propery to false.


you can commit the changes in your content directory with:

```bash
git add content
git commit -m "Look my first post"
git push
```


**Never ever commit changes to the public folder**. This may break the autmatic build mechanism. So never do a `git add .` or `git add public`.


