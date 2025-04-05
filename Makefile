all:
	ansible-playbook playbooks/base_setup.yml -e "timezone=Europe/Kyiv"
	ansible-playbook playbooks/docker.yml