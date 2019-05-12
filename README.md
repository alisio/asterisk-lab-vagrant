# asterisk-lab-vagrant
Vagrant for creating an Asterisk VirtualBox VM provisioned with puppet manifest.

The server uses centos 7 with asterisk packages installed from tucney rpo. 
The asterisk is configured with extensions 1000 and 2000 ready to use (password is the same as extension). 
The following tools are also installed:
- net-tool
- ngrep
- sngrep

Prerequisites:
- Vagrant

Install:

```sh
git clone https://github.com/alisio/asterisk-lab-vagrant.git
cd asterisk-lab-vagrant
vagrant up
```sh
