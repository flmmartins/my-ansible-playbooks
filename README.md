My-ansible-playbooks
====================

Pretty self explanatory...

This tutorial will use the user deploy as default

# Installing and setuping up ansible to run

* INSTALL ANSIBLE in your local machine

* Add the following line in your visudo:
deploy ALL=(ALL)     NOPASSWD: ALL

* Add your SSH-Key to remote host

```bash

cat ~/.ssh/id_rsa.pub | ssh deploy@<remote-host> "mkdir ~/.ssh; cat >> ~/.ssh/authorized_keys; chmod 0700 ~/.ssh; chmod 0600 ~/.ssh/authorized_keys"

```



# Important Notes

* Some playbooks doesn't have host declaration cause they were included in specific project's playbooks.

* Also most of my remote_users are "deploy", you may want to change that as well

* I disable selinux in most of my playbooks

#Added & Tested:


###NTP Playbooks


### configure_ntp_for_brsao.yml

Configure ntp using BRT Standard time and enabling a ntpd service

You can run this:

```bash

ansible-playbook configure_ntp_for_brsao.yml  -i <your inventory file> -l <your host group> -u deploy

```

