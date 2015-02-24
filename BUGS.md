# Dawnscanner - BUGS

In this file you will find bugs I (thesp0nge) will find during development
tests. This is a memo file for [github
issues](https://github.com/thesp0nge/dawnscanner/issues) opened by myself, I
can use when I'm offline.

| ID | Description            | Status |
|----|------------------------|--------|
| B1 | when reviewing a Rails app, Source checks are not wired up. We must understand how to enable source checks in engines: source_check.rb:77:in `is_this_precondition_met?': undefined method `deep_each' for nil:NilClass | open |
| B2 | when reviewing a Sinatra app, we've got this error: engine.rb:42:in `[]': no implicit conversion of Symbol into Integer (TypeError) | open |
|----|------------------------|--------|

_last updated: Tue Jan 13 17:19:05 CET 2015_
