set +x

echo Instalando terraform e aws cli

while [ ! -f /tmp/setup-complete ]; do sleep 1; done

echo "Iniciando o localstack"

while [ ! -f /tmp/localstack-up ]; do sleep 1; done

echo Preparação concluída
