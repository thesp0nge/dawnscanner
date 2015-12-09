# The Knowledge Base

For future releases, the dawnscanner knowledge base must be improved. Now, each
new test is included in the whole binary gem, requiring the user to manually
upgrade his bundle to reflect the support of newest vulnerabilities.

This has some major drawbacks:

* people must manually check if a new dawnscanner gem is available
* upgrading a bundle, sometimes must not be possible due to dependencies
* new vulnerabilities will require KB to be upgraded very quickly. People must
  upgrade daily, as their anti virus tool, but dawnscanner core should not be
  forced to go at the same speed.
* upgrade must be automatic on tool startup, to avoid people being exposed to
  vulnerabilities.

For such a reason, security checks must be separated from the tool core. They
must be a set of independent archives, deployed on the Internet in a digitally
encrypted and signed format.

They must have an information about dawnscanner API version it has been able to
consume it. In example, we can introduce a new option in DepedencyCheck in
dawnscanner version 1.10. Each check will contain a required version, so to be
excluded when old dawnscanner would try consuming those archives.

## Format

Now, security checks are standard ruby classes. This could have an impact in
terms of memory utilization. At the time, no benchmarks are available.
An option can be, translating check's initialize methods in YAML format,
letting the generic class DepdencyCheck, PatternMatchingCheck and friends, to
answer to the vuln? method (like today).

This can have the benefit of having 4 classes, reading YAML files, instead of
having tons of superclasses instanciating those magic 4. The core rules,
understanding if a vulnerability is present, is already in the base API. It's
just a matter of translating initialiation in YAML file and creating a method
reading the YAML file populating internal data.

Instead of YAML we can think also to sqlite db or JSON files. Latter option can
be a good idea since it's web and API friendly.

## Archives

Checks organization will be different upon the format to be chosen. In case of
YAML files, a standard directory hierachy is enough:

  vulnerabilities/
    kb.txt <-- where info about the archive, like version, it must be stored
    third\_party\_gems/
      CVE\_2013\_2103.yaml
      CVE\_2013\_2104.yaml
    ruby_interpreter/
      CVE\_1023\_4302.yaml
    misc/
      CVE\_9999\_1211.yaml

In case of JSON, we can gather together vulnerabilities in files:

  vulnerabilities/
    third\_party\_gems_20151116_01.json
    ruby\_interpreter_20151116_01.json

SQL approach would be eventually, really close to JSON one, with tables instead
of files.

## Info

Using either CVE or OSVDB identifiers as vulnerability keys is a poor choice.
This lead of duplicated vulns in knowledge base and a lot of effort in checking
if a vuln is present.

## Benchmark

Those solutions must be benchmarked


_last update: Mon Nov 16 17:38:45 CET 2015_
