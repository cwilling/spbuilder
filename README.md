# spbuilder
**SlackBuilds** **Personal** **Builder**

The idea is to run SlackBuilds (from slackbuilds.org) in a minimal Slackware installation containing only the packages needed for a particular SlackBuild to succeed. Functionality is provided by the **spbuilder** script to which commands and possibly options are supplied.

We maintain base LXC containers for x86_64 & i686 architectures using the *create*, *update*, *login* or *clean* commands to **spbuilder** e.g.

        sudo spbuilder create
will create a container named spbuilder-SL14.2-x86_64 on an x86_64 machine. Similarly,

        sudo ARCH=i686 spbuilder create
will create a container named spbuilder-SL14.2-i686.

To build a package, we supply the *build* command to **spbuilder** along with the location of the of the SlackBuild to be processed with the -s (--source) option e.g.

        sudo spbuilder build -s misc/mosquitto

  
