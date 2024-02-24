# usync

Usync is basic [rsync][rsync] wrapper controlled by a simple yaml file.

Usync searches the current and parent directories for a *.usync* file. This
file defines a remote url and directory as well as any rsync exclude patterns.

## Usage

    usync <COMMAND> [OPTIONS]

### Commands
`init`
: Create a new *.usync* file in current directory.

`push`
: Push changes to remote source.

`pull`
: Pull changes from remote source.

### Options
`-c, --config <FILE>`
: Read config from FILE instead of *.usync*.

`-D, --dry-run`
: Perform dry run making no changes.

`-V, --verbose`
: Show rsync command.

`-H, --help`
: Display help and exit.

## Config
*.usync* - yaml file defining usync repo, may contain the following keys:

*url*
: Remote repo url. May be an ssh alias. Required.

*dir*
: Remote directory. Must be a full path. Required.

*port*
: Remote port. If blank, inherit from ssh alias, or port 22.

*user*
: Remote user. If blank, inherit from ssh alias, or current user.

*exclude*
: List of patterns to exclude via rsync `--exclude` option. See
  [FILTER RULES][rules] section of rsync manual.

## Requirements
- rsync
- ssh
- yq

----
[Chris Magyar](https://mags.zone)\
[GPL v3](https://www.gnu.org/licenses/gpl-3.0)

[rsync]: https://github.com/WayneD/rsync
[rules]: https://man7.org/linux/man-pages/man1/rsync.1.html#FILTER_RULES

<!--metadata:
author: Chris Magyar <c.magyar.ec@gmail.com>
description: Automated rsync wrapper written in bash.
keywords: usync, rsync, bash
css: ../css/main.css
-->
