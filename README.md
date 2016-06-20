# spbuilder
###SlackBuilds Personal Builder

The idea is to run SlackBuilds from slackbuilds.org (SBo) in a minimal Slackware installation containing only the packages needed for a particular SlackBuild to succeed. Functionality is provided by the command line utility **spbuilder**, to which commands and possibly options are supplied.

We maintain base LXC containers for x86_64 & i686 architectures using the *create*, *update*, *login* or *clean* commands to **spbuilder** e.g.

        sudo spbuilder create
will create a container named spbuilder-SL14.2-x86_64 on an x86_64 machine. Similarly,

        sudo ARCH=i686 spbuilder create
will create a container named spbuilder-SL14.2-i686.

To build a package, we give the *build* command to **spbuilder**, along with the location of the of the SlackBuild to be processed using the -s (--source) option. The location of the SlackBuild is specified by the category/name of the SlackBuild in the SBo repository file tree e.g.

        sudo spbuilder build -s misc/mosquitto
where misc/mosquitto indicates that the *mosquitto* SlackBuild is found in the *misc* directory of the SBo repo.

At build time, the base container is cloned and any additional packages needed for a particular build are installed into the clone where building then proceeds. On completion, the built package is stored in a directory available to the host system and the clone itself is destroyed. The procedure leaves the base container in pristine condition ready for the next build.
