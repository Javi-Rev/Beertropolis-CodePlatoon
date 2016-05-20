[![Build Status](https://secure.travis-ci.org/Javi-Rev/Beertropolis.png?branch=master)](http://travis-ci.org/Javi-Rev/Beertropolis)

[BEERTROPOLIS](http://beertropolis.com
======================================



# AWS


* Create an AWS Instance and generate keys. [Amazon Web Services](http://aws.amazon.com)

* In the same file you have your AWS keys, you will enter the following ssh command.

'''sh
ssh -i Beer.pem ec2-user@52.40.14.9  # Allows you to enter EC2.
'''

* Once in EC2, change directory to Beertropolis/ansible and run

'''sh
.  ~/ansible/hacking/env-setup # Sources the environment.

ansible-playbook -i 'localhost,' -c local playbook.yml  # Set ups playbook file and starts server.
'''

After the playbook has run, the server should be running. Change the directory to /tmp/beertropolis/
Run the following commands.

'''sh
git pull

rake db:migrate

bundle install
'''

* The following commands can start, restart and stop the puma server.

'''sh
rake start

rake restart

rake stop
'''
