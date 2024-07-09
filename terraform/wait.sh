set +x

# Instalando terraform e aws cli
while [ ! -f /tmp/setup-complete ]; do sleep 1; done

# Iniciando o localstack
date
while [ ! -f /tmp/localstack-up ]; do sleep 1; done
date
# Preparação concluída
