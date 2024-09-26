*** Settings ***
Resource             ../../resourses/import.robot
Resource             ../../resourses/init_mobile.robot
Test Setup           Run Keywords    Open AllSpeedy Application On Android App
                     ...    AND   Set Folder Result with date
Test Teardown        Application Teardown

*** Test Cases ***

SPS_Login_001_01
    [Documentation]             [หน้า Login เข้าระบบหน้า Mobile Application] ไม่กรอก Username และ Password
    [Tags]    SPS_Login_001    UAT    Low    Regression
    sps_landing_page.Click Login Button
    sps_login_page.Click Log On Button
    sps_login_page.Verify Error Message You Need To Enter Login Name    ${SPS_Login_001_01.errormesg['expected']}
    common.Verify Capture Screenshot    SPS_Login_001_01    Verify Error Message You Need To Enter Login Name

SPS_Login_001_02
    [Documentation]             [หน้า Login เข้าระบบหน้า Mobile Application] ไม่กรอก Username
    [Tags]    SPS_Login_001    UAT    Low    Regression
    sps_landing_page.Click Login Button
    sps_login_page.Input Password    ${SPS_Login_001_02['password']}
    sps_login_page.Click Log On Button
    sps_login_page.Verify Error Message You Need To Enter Login Name    ${SPS_Login_001_02.errormesg['expected']}
    common.Verify Capture Screenshot    SPS_Login_001_02    Verify Error Message You Need To Enter Login Name

SPS_Login_001_03
    [Documentation]             [หน้า Login เข้าระบบหน้า Mobile Application] ไม่กรอก Password
    [Tags]    SPS_Login_001    UAT    Low    Regression
    sps_landing_page.Click Login Button
    sps_login_page.Input Username    ${SPS_Login_001_03['username']}
    sps_login_page.Click Log On Button
    sps_login_page.Verify Error Message You Need To Enter A Password    ${SPS_Login_001_03.errormesg['expected']}
    common.Verify Capture Screenshot    SPS_Login_001_03    Verify Error Message You Need To Enter A Password