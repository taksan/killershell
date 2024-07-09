echo "Installing terraform"
wget https://releases.hashicorp.com/terraform/1.9.1/terraform_1.9.1_linux_amd64.zip
unzip terraform*zip
mv terraform /usr/bin/


echo "Installing awscli v2"
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
./aws/install -b /usr/bin

rm *zip LICENSE.txt

mkdir -p .aws
chmod 700 .aws

touch /tmp/setup-complete

docker run \
  --rm -d \
  -p 127.0.0.1:4566:4566 \
  -p 127.0.0.1:4510-4559:4510-4559 \
  -v /var/run/docker.sock:/var/run/docker.sock \
  localstack/localstack


touch /tmp/localstack-up
