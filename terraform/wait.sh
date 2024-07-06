echo Aguardando a preparação do ambiente
while [ ! -f /tmp/background0 ]; do sleep 1; done

echo "Iniciando o localstack"
docker run \
  --rm -d \
  -p 127.0.0.1:4566:4566 \
  -p 127.0.0.1:4510-4559:4510-4559 \
  -v /var/run/docker.sock:/var/run/docker.sock \
  localstack/localstack

echo Preparação concluída
