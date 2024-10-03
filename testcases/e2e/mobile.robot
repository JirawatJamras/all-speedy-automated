*** Settings ***
Resource             ../../resourses/import.robot
Resource             ../../resourses/init_mobile.robot
Test Setup           Run Keywords    Open AllSpeedy Application On Android App
                     ...    AND   Set Folder Result with date
Test Teardown        Application Teardown

*** Test Cases ***