echo "Installing terraform"
wget https://releases.hashicorp.com/terraform/1.9.1/terraform_1.9.1_linux_amd64.zip
unzip terraform*zip
mv terraform /usr/bin/


echo "Installing awscli v2"
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
./aws/install -b /usr/bin

rm *zip


echo "Configuring aws credentials"

mkdir -p .aws
chmod 700 .aws
cat <<EOF > .aws/credentials
[default]
aws_access_key_id = test
aws_secret_access_key = test
EOF

cat <<EOF > .aws/config
[profile default]
region=us-east-1
output=json
endpoint_url=http://localhost:4566
EOF

chmod -R 600 .aws

echo done

touch /tmp/setup-complete
