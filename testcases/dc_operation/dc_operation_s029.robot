*** Settings ***
Resource          ../../resources/init_website.robot
Resource          ../../resources/import.robot
Test Setup        Run Keywords    Open Chrome Browser    headlesschrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result With Date 
Test Teardown     Close Browser

*** Test Cases ***
DC_Operation_S029
    [Documentation]    การ Change Courier
    [Tags]    DC_Operation    Change Courier    Regression
    skip