wget -O /tmp/packer.zip https://releases.hashicorp.com/packer/1.1.1/packer_1.1.1_linux_amd64.zip?_ga=2.50621353.1804937557.1508818859-81110963.1508818859
wget -O /tmp/terraform.zip https://releases.hashicorp.com/terraform/0.10.8/terraform_0.10.8_linux_amd64.zip?_ga=2.67747729.1279888859.1509041397-106214977.1508818829
unzip /tmp/packer.zip -d ~/bin
unzip /tmp/terraform.zip -d ~/bin
packer validate deployments/template_do_prod.json && 
packer build deployments/template_do_prod.json
export TF_VAR_image_id=$(curl -H "Authorization: Bearer $DIGITALOCEAN_API_TOKEN" https://api.digitalocean.com/v2/images?private=true | jq ."images[] | select(.name == \"demo-$CIRCLE_BUILD_NUM\") | .id")
echo $TF_VAR_image_id
cd infra && terraform apply && cd .. &&
git add infra && git commit -m "Deployed $CIRCLE_BUILD_NUM [skip ci]" &&
git push origin master