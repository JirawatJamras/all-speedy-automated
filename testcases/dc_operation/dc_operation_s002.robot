*** Settings ***
Resource          ../../resourses/init_website.robot
Resource          ../../resourses/import.robot
Test Setup        Run Keywords    Open Chrome Browser    headlesschrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result with date
                  ...    AND   Reset Cut Off Time
Test Teardown     Run Keywords    Reset Cut Off Time
                  ...    AND    Close Browser

*** Test Cases ***
DC_Operation_S002
    [Tags]    DC_Operation    UAT    Pass_With_Condition
    DC_Operation_S002