echo "Downloading terraform"

wget https://releases.hashicorp.com/terraform/1.9.1/terraform_1.9.1_linux_amd64.zip

echo "unzipping"
unzip terraform*zip

echo "installing"
mv terraform /usr/bin/

echo "configuring aws credentials"

mkdir -p .aws
chmod 700 .aws
cat <<EOF > .aws/credentials
[default]
aws_access_key_id = test
aws_secret_access_key = test
region = sa-east-1
EOF

echo done
