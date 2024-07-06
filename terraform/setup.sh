apt install wget curl -y

wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install -y terraform

mkdir -p .aws
chmod 700 .aws
cat <<EOF > .aws/credentials
[default]
aws_access_key_id = test
aws_secret_access_key = test
region = sa-east-1
EOF
