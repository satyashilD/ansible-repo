# ansible-repo
ec2.yml is main ansible play which creates given number of ec2 instances with a given userdata script.
vars.yml contains all required inputs for the ec2 instance
```
ansible-playbook ec2.yml -e @vars.yml -vv
```

# Fetching OS versions along with openssl package version
This playbook will generate and udpate os_version_details.csv with all host os release name and version along with openssl package version

```
ansible-playbook -i inventory os_facts.yml -vv
```
