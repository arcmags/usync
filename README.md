# usync

usync is an [rsync][rsync] wrapper configured by a basic yaml file.

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
directory containing *.usync* is taken as the base working directory while the
contents of .usync define a remote rsync host.

usync forms an rsync command to push/pull the contents of the base working
directory to/from the remote host: `rsync -aRzz [--delete] [--exclude
<pattern>]... <source>... <destination>`.

Command line options override config file options.

## Usage

    usync <command> [option...]

### Commands
`init`
: Create a new *.usync* file in current directory.

`pull`
: Pull changes from remote rsync host.

`push`
: Push changes to remote rsync host.

### Options
`-c, --config <file>`
: Set config file basename. (default: *.usync*)

`-d, --dir <directory>`
: Set remote rsync directory.

`-e, --exclude <pattern>`
: Add exclude pattern. Clear patterns if blank.

`-p, --port <port>`
: Set remote rsync port.

`-r, --remote <url>`
: Set remote rsync url. May be an ssh alias.

`-u, --user <user>`
: Set remote rsync user.

`-D, --dryrun`
: Perform dry run making no changes.

`-M, --nocolor`
: Disable colored output.

`-Q, --quiet`
: Don't write anything to stdout.

`-V, --verbose`
: Print more verbose information.

`-H, -h, --help`
: Print help text.

## Config
*.usync*
: yaml file containing the following keys:

`delete`
: Use rsync `--delete` option. (default: true)

`exclude`
: List of patterns excluded via rsync `--exclude` option. (default: unset)

`port`
: Remote port. (default: unset)

`remote`
: Remote repo url. May be an ssh alias. (required)

`remote_dir`
: Remote directory. Must be a full path. (required)

`user`
: Remote user. (default: unset)

## Requirements
- rsync
- ssh

[GPLv3](https://www.gnu.org/licenses/gpl-3.0) | [mags](https://mags.zone)

[rsync]: https://github.com/WayneD/rsync

<!--metadata:
author: Chris Magyar <c.magyar.ec@gmail.com>
description: Automated rsync wrapper written in bash.
keywords: usync, rsync, ssh, bash
-->
