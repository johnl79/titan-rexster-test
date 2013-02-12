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
* From the top level of the repository hit `./run.sh`
