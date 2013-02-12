titan-rexster-test
==================

This is a quick test to investigate rexster's hanging after a certian number of API requests. The test is designed to be run on a smartos (solaris), however, it should run on anything running bash and java. the following instructions will take you through getting this up and running on a Joyent Public Cloud smartos machine.

Bootstrap environment:
* Sign (in to / up for) a JPC account at https://my.joyentcloud.com/
* Provision a base64 image. I used the Medium 4G size.
* SSH into the newly provisioned machine
* Execute `pkgin in scmgit` to install git
* Clone this repository
* run `./install_deps.sh`

Run the test:
* From the top level of the repository execute `./run.sh`

The `run.sh` script will 
* Unzip the included distfiles for rexster and titan
* Copy the appropriate dependencies out of titan into rexster
* Instantiate a berkleydb backed titan database with the graph of the gods data
* Startup a rexster server
* Loop requests onto rexster with curl

The curl loop will eventually hang when all this is run on smartos. This behavior is not consistent with what happens when I run this same stuff on OSX.
