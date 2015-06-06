Udacity Nanodegree: Full Stack Web Developer Project 2

This program uses PSQL database to track players and matches in a tournament using Swiss system for pairing.

How to run
1. Make sure VirtualBox(https://www.virtualbox.org/) and Vagrant(https://www.vagrantup.com/) are both installed. 
2. Launch the Vagrant VM. In console, type the following two lines.
$ vagrant up
$ vagrant ssh
3. Setup PSQL database.
$ cd /vagrant/tournament
$ psql
vagrant=> create database tournament;
vagrant => \i tournament.sql
tournament=> \q

Done!
4. (Optional) In console, run $python tournament_test.py for testing.
