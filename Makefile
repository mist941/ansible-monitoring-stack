all:
	ansible-playbook playbooks/deploy_docker.yml
	ansible-playbook playbooks/deploy_node_exporter.yml
	ansible-playbook playbooks/deploy_prometheus.yml
	ansible-playbook playbooks/deploy_loki.yml
	ansible-playbook playbooks/deploy_promtail.yml
	ansible-playbook playbooks/deploy_grafana.yml