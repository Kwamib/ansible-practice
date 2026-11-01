# ansible-practice

Practice files for the Ansible track on [kwamib.dev](https://kwamib.dev/resources/ansible).

Three small Ubuntu servers, run by Vagrant on your own computer: `web1`, `web2`
and `db1`. Ansible manages them over SSH.

    vagrant up                          # start the three servers
    vagrant ssh-config > ssh_config     # tell SSH (and so Ansible) how to reach them
    ansible all -m ping                 # check Ansible can reach all three

When you're done for the day, `vagrant halt` stops them; `vagrant up` brings
them back. `vagrant destroy -f` deletes them, and the lessons rebuild them.

Each server uses 1 GB of memory while it's running.
