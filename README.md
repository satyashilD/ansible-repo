# ansible-repo
ec2.yml is main ansible play which creates given number of ec2 instances with a given userdata script.
vars.yml contains all required inputs for the ec2 instance
```
ansible-playbook ec2.yml -e @vars.yml -vv
```
