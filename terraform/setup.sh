#!/usr/bin/env bash

set -euo pipefail

cd "$(mktemp)"
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
./aws/install -b /usr/bin

wget https://releases.hashicorp.com/terraform/1.9.1/terraform_1.9.1_linux_amd64.zip
unzip terraform*zip
mv terraform /usr/bin/
cd -

mkdir -p "$HOME/.aws"
chmod 700 "$HOME/.aws"

cat > "$HOME/.aws/config" <<EOF
[profile default]
region = us-east-1
output = json
endpoint_url = http://localhost:4566
EOF
chmod 600 "$HOME/.aws/config"

cat > "$HOME/.aws/credentials" <<EOF
[default]
aws_access_key_id = test
aws_secret_access_key = test
EOF
chmod 600 "$HOME/.aws/credentials"

docker run -d \
  -p "4566:4566" -p "4510-4559:4510-4559" \
  -v "./localstack-volume:/var/lib/localstack" \
  -v "/var/run/docker.sock:/var/run/docker.sock" \
  localstack/localstack

waitTries=0
until aws sts get-caller-identity; do
  sleep 1
  waitTries=$(( waitTries+1 ))
  if [ "$waitTries" -gt 30 ]; then
    echo "Failed to setup localstack!" >&2
  fi
done

touch /tmp/setup-complete
