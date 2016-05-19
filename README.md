[![Build Status](https://secure.travis-ci.org/Javi-Rev/Beertropolis.png?branch=master)](http://travis-ci.org/Javi-Rev/Beertropolis)

BEERTROPOLIS
============

* Ruby 2.3.0
* You will need to install Phantom.js
* Ask a team member for environment variables
* Rake DB setup
* Rake to run test suite (tests use  RSpec)
* Third-party APIs: twitter Oauth, Google maps
* Other technologies used: Google charts

Please feel free to use a different markup language if you do not plan to run
<tt>rake doc:app</tt>.

AWS
===

* In the same file you have your AWS keys, you will enter the following ssh command.

* ssh -i Beer.pem ec2-user@52.40.14.9  (Allows you to enter EC2.)

* Once in EC2, change directory to Beertropolis/

* git pull

* rake migrate

* bundle install

* Change directory to beertropolis/ansible/

* If this is your first time, enter the following commands.

* rake env

* rake playbook

* You server should be running.

* Change directory to /tmp/beertropolis/

* The following commands can start, restart and stop the puma server.

* rake start

* rake restart

* rake stop
