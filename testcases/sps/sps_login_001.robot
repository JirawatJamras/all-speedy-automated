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
    sps_login_page.Click Login Button

SPS_Login_001_04
    [Documentation]             [หน้า Login เข้าระบบหน้า Mobile Application] กรอก Username ไม่ถูกต้อง
    [Tags]    SPS_Login_001    UAT    Low    Regression    B
    sps_login_page.Click Login Button
    sps_login_page.Input Username    ${SPS_Login_001_04['username']}
    sps_login_page.Input Password    ${SPS_Login_001_04['password']}
    sps_login_page.Click Logon Button
    sps_login_page.Verify Error Message When Input Wrong Username    ${SPS_Login_001_04['errormsg']}
    common.Verify Capture Screenshot    SPS_Login_001_04    Error Message Input Wrong Username

SPS_Login_001_05
    [Documentation]             [หน้า Login เข้าระบบหน้า Mobile Application] กรอก Password ไม่ถูกต้อง
    [Tags]    SPS_Login_001    UAT    Low    Regression    B
    sps_login_page.Click Login Button
    sps_login_page.Input Username    ${SPS_Login_001_05['username']}
    sps_login_page.Input Password    ${SPS_Login_001_05['password']}
    sps_login_page.Click Logon Button
    sps_login_page.Verify CanNot Login When Input Wrong Username
    common.Verify Capture Screenshot    SPS_Login_001_05    CanNot Login When Input Wrong Username