*** Settings ***
Resource          ../../resourses/init_website.robot
Resource          ../../resourses/import.robot
Test Setup        Run Keywords    Open Chrome Browser    chrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result with date
Test Teardown     Close Browser
Force Tags        UAT

*** Test Cases ***

Test
    common.Open URL    ${DPS_UAT_URL}
    dps_landing_page.Click Go Login Button
    dps_login_page.Input Email    ${dps_login_user_04['username']}
    dps_login_page.Input Password    ${dps_login_user_04['password']}
    dps_login_page.Click Log On Button
    Sleep    5s

    Set Today
    ${tracking_c}=    Set Variable    SPBD241100023608
    ${pouch_number}=    Set Variable    P112490114

    Set Global Variable    ${tracking_c}
    Set Global Variable    ${pouch_number}

        Log    S004
    prerequisite.DC_Operation_S004

    
