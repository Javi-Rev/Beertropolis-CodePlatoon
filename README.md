[![Build Status](https://secure.travis-ci.org/Javi-Rev/Beertropolis.png?branch=master)](http://travis-ci.org/Javi-Rev/Beertropolis)

# BEERTROPOLIS

![alt beer](https://github.com/Javi-Rev/Beertropolis/blob/master/app/public/images/Beertropolis.png)

[Beertropolis](http://beertropolis.com)

*  Beertropolis is for craft beer lovers like ourselves. We have created a site for everyone with our common interest to list prices, reviews and find where their favorite beers are located!
*  Beertropolis is a web application aggregating user generated data to provide transparency around craft beer prices and transactions in the secondary market.
*  Beertropolis leverages geolocation data to also provide review locations. 


## AWS

* Create a AWS Instance and generate keys. [Amazon Web Services](http://aws.amazon.com)

* Go to Ansible for in dept deployment information. [Ansible](https://www.ansible.com/)

* In the same file you have your AWS keys, you will enter the following ssh command.

```sh
ssh -i Beer.pem ec2-user@52.40.14.9  # Allows you to enter EC2.
```
* Once in EC2, change directory to Beertropolis/ansible and run

```sh
.  ~/ansible/hacking/env-setup # Sources the environment.

ansible-playbook -i 'localhost,' -c local playbook.yml  # Sets up playbook file and starts server.
```

After the playbook has run, the server should be running. Change the directory to /tmp/beertropolis/
Run the following commands.

```sh
git pull

rake db:migrate

bundle install
```

* The following commands can start, restart and stop the puma server.

```sh
rake start

rake restart

rake stop
```
