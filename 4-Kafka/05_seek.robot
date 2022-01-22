*** Settings ***
Resource          resources.robot
Test Setup        Connect to Local Kafka
Test Teardown     Run Keyword And Ignore Error    Close

*** Test Cases ***
Seek Verification
    ${TopicPartition}    Create Partition    ${topic}
    Log to console  ${TopicPartition}
    ${position1}    Get Position    ${TopicPartition}
    Log to console  Position1:${position1}
    Send Text Message    ${topic}    message
    ${no}    Get Number Of Messages In Topicpartition    ${TopicPartition}
    Log to console  Numero de mensagens no tópico:${no}
    Seek To End    ${TopicPartition}
    ${position2}    Get Position    ${TopicPartition}
    Log to console  Position2:${position2}
    Should Be Equal As Integers    ${position2}    ${no}

    ${compare}    Evaluate    ${position1}<${position2}
    Run Keyword Unless    ${compare}    Fail    msg=Wrong

    Seek To Beginning    ${TopicPartition}
    ${position3}    Get Position    ${TopicPartition}
    Should Be Equal As Integers    ${position3}    0
    Run Keyword And Continue On Failure    Seek    ${1}    ${TopicPartition}
