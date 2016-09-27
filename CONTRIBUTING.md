# Contribute to dawnscannerscanner

We love pull requests from everyone. By participating in this project, you
agree to abide by the latest version of the [Contributor Covenant Code of
Conduct](http://contributor-covenant.org/version/1/4/).

Are you still interested in contributing to
[dawnscanner](https://dawnscanner.org) project? Great, here is some very basic
rules in order to make rocking pull requests.

First of all, I use the branching model described in [this
post](http://nvie.com/posts/a-successful-git-branching-model/). There are two
major branches:

* master: it contains in every moment the code for the latest dawnscanner
  released gem. You can't make branches from here unless you're working on a
  bugfix.
* development: it contains the unstable code that is going to be the next
  dawnscanner realease. You start from here. Pick a task on the Roadmap.md
  and create a separated branch to work on your feature to. When you're ready
  (remember to include also spec files), submit your pull request. If the code
  will be fine, it will be merged into the development tree ready to be include
  in upcoming gem version.

Create your own copy of the repository, by forking and cloning it with the
following command:

``` git clone git@github.com:your-username/dawnscanner.git ```

You can now work either on implementing a new feature, adding a security check or fixing a bug.

## Implementing a new feature

Go on the [Issue
pane](https://github.com/thesp0nge/dawnscanner/issues?q=is%3Aissue+is%3Aopen+label%3Aenhancement)
and filter for opened issue marked as enhancement.

Now, create a branch, from the **development** branch, named with the issue
you're working on (e.g.  issue_202_false_positive_of_protect_from_forgery).

Code, write the necessary tests and document the commit with the issue number
in the commit message and some description about you solved the enhancement.

Please don't forget to edit also Changelog file.

Then push to your fork and create [a pull
request](https://github.com/thesp0nge/dawnscanner/compare/).

## Adding a security check

If you want to add a new CVE bulletin or a new security check, than you have to
open [an issue](https://github.com/thesp0nge/dawnscanner/issues) describing the
check and assigning to your self.

Now, create a branch, from the **master** branch, named with the issue
you're working on (e.g.  issue_202_false_positive_of_protect_from_forgery).

You can create a generic security check with the command ```rake check[name]```
or you can create a new CVE bulletin with ```rake cve[name]```. Please note
that you will be guided in which files are created and which one you have to
modify, in order to include the check.

You will have to write your check and the relevant rspec file from scratch.
Than you must include the new class implementing the security check, in the
tool [knowledge
base](https://raw.githubusercontent.com/thesp0nge/dawnscanner/master/lib/dawn/knowledge_base.rb),
adding it also in the [knowledge base rspect
file](https://raw.githubusercontent.com/thesp0nge/dawnscanner/master/spec/lib/dawn/codesake_knowledgebase_spec.rb).

Please don't forget to edit also Changelog file.

Then push to your fork and create [a pull
request](https://github.com/thesp0nge/dawnscanner/compare/).

## Fixing a bug

Go on the [Issue
pane](https://github.com/thesp0nge/dawnscanner/issues?q=is%3Aissue+is%3Aopen+label%3Abug)
and filter for opened issue marked as bug.

Now, create a branch, from the **master** branch, named with the issue
you're working on (e.g.  issue_202_false_positive_of_protect_from_forgery).

Code, write the necessary tests and document the commit with the issue number
in the commit message and some description about you solved the enhancement.

Please don't forget to edit also Changelog file.

Then push to your fork and create [a pull
request](https://github.com/thesp0nge/dawnscanner/compare/).

Enjoy it!

Last update: _Tue Sep 27 22:44:01 CEST 2016_
