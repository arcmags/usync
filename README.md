# usync

usync is an [rsync][rsync] wrapper configured by basic yaml file.

## Installation

usync is a single bash script (and optional manpage), so it's easy enough to
just copy manually to a *PATH* directory of your choice.

### make

A makefile is provided for easy installation:

`make install` as a non-root user will copy the usync script and manpage to the
user directories *~/.local/bin* and *~/.local/share/man*.

`make install` as root user will copy the usync script and manpage to the local
system directories */usr/local/bin* and */usr/local/man*.

`make uninstall` removes these files from their respective locations.

## Description

usync searches the current and parent directories for a file named *.usync*. The
directory containing *.usync* is the local base working directory while the
contents of .usync define a remote rsync host.

usync forms an rsync command to push/pull the contents of the base working
directory to/from the remote host using the rsync options: `-azz --delete
--protect-args`. Exclude patterns may be added in *.usync* or via command line
arguments.

## Usage

    usync <command> [option...]

### Commands
`init`
: Create a new *.usync* file in current directory.

`push`
: Push changes to remote rsync host.

`pull`
: Pull changes from remote rsync host.

### Options
`-c, --config <file>`
: Set config file basename. (default: *.usync*)

`-d, --dir <directory>`
: Set remote rsync directory.

`-e, --exclude <pattern>`
: Add to rsync exclude patterns.

`-p, --port <port>`
: Set remote rsync port.

`-r, --remote, --url <url>`
: Set remote rsync url. May be an ssh alias.

`-u, --user, <user>`
: Set remote rsync user.

`-D, --dryrun`
: Perform dry run making no changes.

`-Q, --quiet`
: Don't write anything to stdout.

`-V, --verbose`
: Print more verbose information.

`--nocolor`
: Disable colored output.

`-H, --help`
: Display help and exit.

## Config
*.usync* - yaml file containing the following keys:

`dir`
: Remote directory. Must be a full path. (required)

`remote` or `url`
: Remote repo url. May be an ssh alias. (required)

`port`
: Remote port.

`user`
: Remote user.

`exclude`
: List of patterns excluded via rsync `--exclude` option.

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
