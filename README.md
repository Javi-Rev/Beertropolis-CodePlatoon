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

* The following code needs to be enter in the Terminal.

* ssh -i Beer.pem ec2-user@52.40.14.9  (Allows you to enter EC2.)

* rake db:drop indb:create db:migrate db:seed (Migrate the database.)

* bundle install

* .  ~/ansible/hacking/env-setup (Sources the environment.)

* ansible-playbook -i 'localhost,' -c local playbook.yml (Set ups playbook file and starts server.)

* In a separate window open /tmp/beertroplois  In this window you can stop the EC2 server, restart and start.

* pumactl --config-file puma_config.rb start

* pumactl --config-file puma_config.rb restart

* pumactl --config-file puma_config.rb stop

