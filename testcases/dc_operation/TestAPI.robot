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
    dps_home_page.Click Dropdown For Select role
    dps_home_page.Select Role    ${dc_operation.role['admin']}

    Set Today
    ${tracking_i}=    Set Variable    SPBD241100022410
    ${pouch_number}=    Set Variable    P112462447

    Set Global Variable    ${tracking_i}
    Set Global Variable    ${pouch_number}

    prerequisite.DC_Operation_S010

    
