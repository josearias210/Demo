wget -O /tmp/packer.zip https://releases.hashicorp.com/packer/1.1.1/packer_1.1.1_linux_amd64.zip?_ga=2.50621353.1804937557.1508818859-81110963.1508818859
unizp /tmp/packer.zip -d ~/bin
packer validate deployments/template_do_prod.json
packer build deployments/template_do_prod.json