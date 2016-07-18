from debian:jessie

run apt-get update
run apt-get -y upgrade
run apt-get -y install build-essential curl git libssl-dev libffi-dev python python-dev screen sudo systemd tmux vim

run curl -s https://bootstrap.pypa.io/get-pip.py > /tmp/get-pip.py
run python /tmp/get-pip.py
run pip install -U ansible

run useradd -ms /bin/bash lg
workdir /home/lg

add . /home/lg/ansible-role-lookingglass
workdir /home/lg/ansible-role-lookingglass
run ansible-playbook --connection=local --limit localhost development.yml; exit 0

add run.sh /home/lg/run.sh
run chmod +x /home/lg/run.sh
cmd ["/home/lg/run.sh"]

expose 80 9200 9292
