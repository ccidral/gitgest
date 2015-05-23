# Gitgest

A bash script that emails git commit digests in HTML format.

It scans one or more directories for git repositories, builds a list with the most recent commits and then sends it to one or more email addresses. It remembers the last commit by storing the commit's hash in the repository's configuration file.

Tested on Ubuntu 14.10 and OSX Mavericks.

## Dependencies

 * Bash
 * Git
 * Saxon
 * Sendmail

Saxon is used here to transform XML into HTML. Sadly I couldn't use `xsltproc` because it does not support XLST 2.0.

## Getting Started

```bash
mkdir /etc/gitgest

cp $GITGEST_SRC/conf/* /etc/gitgest
cp $GITGEST_SRC/gitgest /usr/local/bin

# Edit the configuration file according to your needs:
vim /etc/gitgest/gitgest.conf
```

The configuration file should look like this:

```bash
sender_address:    git@yourdomain.com
email_subject:     Git: latest commits

# Specify one or more repository root paths
repositories:      /path/to/repositories
repositories:      /another/repositories/location

# Specify one or more destination email address
recipient:         some@address.com
recipient:         another@address.com
```
In the example above, `gitgest` should recursively scan `/path/to/repositories` and `/another/repositories/location` for git repositories (ie. directory names that end with `.git`).

## License
Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at

  http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.
