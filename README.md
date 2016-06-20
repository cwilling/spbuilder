# spbuilder
###SlackBuilds Personal Builder

The idea is to run SlackBuilds from slackbuilds.org (SBo) in a minimal Slackware installation containing only the packages needed for a particular SlackBuild to succeed. We deal with a particular category of SlackBuilds with **spbuilder**, namely those extended to generate dependency information for use by package management systems such as [slapt-get](http://www.jaos.org). Since a normal SBo SlackBuild's .info file specifies packages required for building with the assumption of running on a fully installed Slackware system and because we run **spbuilder** in only a minimal installation, we extend .info files with an additional *PREREQS* field to specify the need for any stock Slackware packages not already available in the minimal system. It is convenient, although not essential, to keep these changes to SlackBuilds in a dedicated branch of the official SBo repository. An example is the [spbuilder branc here](https://github.com/cwilling/slackbuilds/tree/spbuilder).

Build functionality is provided by the command line utility **spbuilder**, to which commands and possibly options are supplied.

We maintain base LXC containers for x86_64 & i686 architectures using the *create*, *update*, *login* or *clean* commands to **spbuilder** e.g.

        sudo spbuilder create
will create a container named spbuilder-SL14.2-x86_64 on an x86_64 machine. Similarly,

        sudo ARCH=i686 spbuilder create
will create a container named spbuilder-SL14.2-i686.

To build a package, we give the *build* command to **spbuilder**, along with the location of the of the SlackBuild to be processed using the -s (--source) option. The location of the SlackBuild is specified by the category/name of the SlackBuild in the SBo repository file tree e.g.

        sudo spbuilder build -s misc/mosquitto
where misc/mosquitto indicates that the *mosquitto* SlackBuild is found in the *misc* directory of the SBo repo.

At build time, the base container is snapshot cloned and any additional packages needed for a particular build are installed into the clone where building then proceeds. On completion, the built package is stored in a directory available to the host system and the clone itself is destroyed. This leaves the base container in pristine condition ready for the next build. Since the base container is quite small and the cloning itself uses a snapshot mode (copy-on-write with *overlayfs*), it is more or less instantaneous and uses minimal additional file space. Multiple builds may be run simultaneously since each clone has a different name and mac address, so can independently perform any network activity required (downloading packages, tarballs, etc.). 
