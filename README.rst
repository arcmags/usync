=====
usync
=====

This is a basic rsync wrapper I wrote to be easily configured via
text file.  It works well for syncing various machines up with
my central storage server.

It's got colored output and its commands are kinda like git.
I can just type ``usync push`` to sync up with my rpi on the fly.
What more could you want?


Synopsis
========

``usync <COMMAND> [OPTIONS]``


Commands
========

``init``
    Create a new usync repo in current directory.

``push``
    Push changes to remote source.

``pull``
    Pull changes from remote source.


Options
=======

``-c, --config <FILE>``
    Read config from FILE instead of .usync default.

``-D, --dry-run``
    Perform trial run making no changes.

``-V, --verbose``
    Print rsync command.

``-H, --help``
    Display help and exit.


Files
=====

*.usync*
    The ``init`` command creates a file named *.usync* in the current
    directory.  This file has two sections.  The remote repo settings are
    defined via variables in the [remote] section, while the [exclude] section
    contains a list of patterns to exclude from syncing.

    ``[remote]``
        ``url=``
            Remote repo url.  It may be an ssh alias or even *localhost*.
            It cannot be unset.

        ``port=``
            Remote port to connect to.  If left blank, it will take on the
            default value of 22 or inherit any ssh alias settings.

        ``user=``
            User to connect to remote as.  If left blank, it will be
            the current user or inherit any ssh alias settings.

        ``dir=``
            Directory on remote to sync with.  The directory must be a
            full path.  It cannot be unset.

    ``[exclude]``
        This section is a list of patterns to exclude from rsync via the
        --exclude option.  Any pattern that starts with a ``/`` is anchored
        to the root usync folder, otherwise it is matched against the
        end of the pathname.  If the pattern ends with a ``/`` then it will
        only match a directory.  A ``*`` matches any non-slash path component.
        ``**`` matches everything, including slashes.

        Character classes may also me used in patterns.  See the
        INCLUDE/EXCLUDE PATTERN RULES section of the rsync manual for
        the complete documentation.


Notes
=====

The script I used for this kind of thing in the past was far more complicated.
It parsed a boat-load of command line flags/options, could define multiple
remotes in one config file, executed arbitrary commands on the remote, updated
usync repos recursively, whatever.  I realized I never really used all that
stuff though, and it just seemed like it was trying to do too much (do one
thing and do it well, ya know).  If you want to have multiple remotes or more
options, you can use multiple config files and script something yourself.  So
there!

I'm pretty sure usync will work fine with spaces, all kinds of spaces, spaces
everywhere if you gotta be *that* guy.  I put way too much time and effort into
figuring out how to accommodate you spaces-in-filenames weirdos; it would be a
damn shame if all that work was for nothing.


Credits
=======

:Author:
    Chris Magyar

:License:
    GPL 3.0
