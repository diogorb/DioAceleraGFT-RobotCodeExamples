*** Settings ***
Resource           resources.robot
Suite Setup        Connect to Local Kafka
Suite Teardown     Run Keyword And Ignore Error    Close

*** Test Cases ***
Send Message Verification
    [tags]      criaTopicoVerificaMensage
    ${test_topic}=  Topic name with random sufix  ${topic}
    log to console          ${test_topic}
    ${TopicPartition}=  Create Partition  ${test_topic}
    log to console          passou do create partition
    ${topics}    Get Kafka Topics
    List Should Contain Value    ${topics}    ${test_topic}
    ${no1}    Get Number Of Messages In Topics    ${test_topic}
    Send Text Message    ${test_topic}    message
    ${no2}    Verify no of message    ${test_topic}    ${no1}

    Send Text Message    ${test_topic}    message2
    ${no3}    Verify no of message    ${test_topic}    ${no2}
    log to console      número de mensagens enviadas: ${no3}  
    ${no4}    Get Number Of Messages In Topicpartition    ${TopicPartition}
    log to console      número de mensagens no tópico: ${no4}
    Should Be Equal As Integers    ${no3}    ${no4}
