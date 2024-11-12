# usync

Usync is basic [rsync][rsync] wrapper controlled by a simple yaml file.

Usync searches the current and parent directories for a *.usync* file
that defines a remote rsync host.

## Usage

    usync <command> [option...]

### Commands
`init`
: Create a new *.usync* file in current directory.

`push`
: Push changes to remote source.

`pull`
: Pull changes from remote source.

### Options
`-c, --config <file>`
: Read config from *FILE* instead of *.usync*.

`-d, --dir <directory>`
: Set remote directory.

`-e, --exclude <pattern>`
: Add to exclude patterns.

`-p, --port <port>`
: Set remote port.

`-r, --remote, --url <url>`
: Set remote url.

`-u, --user, <user>`
: Set remote user.

`-D, --dryrun`
: Perform dry run making no changes.

`-Q, --quiet`
: Don't write anything to standard out.

`-V, --verbose`
: Print shell commands.

`--nocolor`
: Disable colored output.

`-H, --help`
: Display help and exit.

## Config
*.usync* - yaml file containing the following keys:

*dir*
: Remote directory. Must be a full path. (required)

*remote* or *url*
: Remote repo url. May be an ssh alias. (optional)

*port*
: Remote port. (optional)

*user*
: Remote user. (optional)

*exclude*
: List of patterns to exclude via rsync `--exclude` option. (optional)
  See [FILTER RULES][rules] section of rsync manual for details and syntax.

## Environment
Usync is affected by the following environment variables:

`NOCOLOR=1`
: Disable colored output.

`QUIET=1`
: Run silently.

`VERBOSE=1`
: Run verbosely.

## Requirements
- rsync
- ssh

----
[Chris Magyar](https://mags.zone)\
[GPL v3](https://www.gnu.org/licenses/gpl-3.0)

[rsync]: https://github.com/WayneD/rsync
[rules]: https://man7.org/linux/man-pages/man1/rsync.1.html#FILTER_RULES

<!--metadata:
author: Chris Magyar <c.magyar.ec@gmail.com>
description: Automated rsync wrapper written in bash.
keywords: usync, rsync, ssh, bash
-->
