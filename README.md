[![Build Status](https://secure.travis-ci.org/Javi-Rev/Beertropolis.png?branch=master)](http://travis-ci.org/Javi-Rev/Beertropolis)

# BEERTROPOLIS



# AWS


* Create an AWS Instance and generate keys. 

* In the same file you have your AWS keys, you will enter the following ssh command.

* ssh -i Beer.pem ec2-user@52.40.14.9  (Allows you to enter EC2.)

* Once in EC2, change directory to Beertropolis/ansible and run

* .  ~/ansible/hacking/env-setup (Sources the environment.)

*  ansible-playbook -i 'localhost,' -c local playbook.yml (Set ups playbook file and starts server.)

* git pull

* rake db:migrate

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
