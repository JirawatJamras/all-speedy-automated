*** Settings ***
Resource             ../../resourses/import.robot
Resource             ../../resourses/init_mobile.robot

Test Setup           Open AllSpeedy Application On Android App
Test Teardown        Application Teardown

*** Test Cases ***
AllSpeedy_SPS_001_ID_1
    [Documentation]             ทดสอบ Run Automate เปิด Andoid เฉยๆ
    [Tags]    AllSpeedy_SPS_001    UAT
    Sleep    5s
    Capture Page Screenshot
    Open POS Online Application On Android App
    Sleep    10s
