*** Settings ***
Resource          ../../resourses/init_website.robot
Resource          ../../resourses/import.robot
Test Setup        Run Keywords    Open Chrome Browser    chrome    # Unable to run headless
                  ...    AND   Set Folder Result with date
Test Teardown     Close Browser

*** Test Cases ***
DC_Operation_S002
    [Tags]    DC_Operation    Dry_Approved_Request_Pickup_Schedule    UAT    Defect043    Defect144    Defect150    Defect192
    prerequisite.DC_Operation_S002