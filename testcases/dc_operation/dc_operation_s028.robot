*** Settings ***
Resource          ../../resources/init_website.robot
Resource          ../../resources/import.robot
Test Setup        Run Keywords    Open Chrome Browser    headlesschrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result With Date
Test Teardown     Close Browser

*** Test Cases ***
DC_Operation_S028
    [Documentation]    การ Move Status แบบ Import file
    [Tags]    DC_Operation    Move Status    Regression
    skip