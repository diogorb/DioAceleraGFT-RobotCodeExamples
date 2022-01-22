***Settings
Documentation   Primeiro Script Robot
#Libs
Library         SeleniumLibrary

***Test Cases
Abrir site do google
    Open Browser    https://google.com      chrome
    Title Should Be     Google
    Close Browser