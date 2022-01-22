*** Settings ***
Resource          resources.robot
Test Teardown   Close

*** Test Cases ***
Conectar no Kafka sem definir grupo
    Connect To Kafka	bootstrap_servers=${BOOTSTRAP_SERVERS}  client_id=${CLIENT_ID}

Conectar no Kafka definindo grupo
    Connect To Kafka	bootstrap_servers=${BOOTSTRAP_SERVERS}  client_id=${CLIENT_ID}  group_id=${GROUP_ID}

Conectar Consumer sem definir grupo 
    Connect Consumer	bootstrap_servers=${BOOTSTRAP_SERVERS}  client_id=Robot

Conectar Consumer definindo grupo
    Connect Consumer	bootstrap_servers=${BOOTSTRAP_SERVERS}  client_id=Robot  group_id=${GROUP_ID}

Conectar Producer
    Connect Producer	bootstrap_servers=${BOOTSTRAP_SERVERS}  client_id=Robot
