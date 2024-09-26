*** Settings ***
Resource             ../../resourses/import.robot
Resource             ../../resourses/init_mobile.robot
Test Setup           Open AllSpeedy Application On Android App
Test Teardown        Application Teardown

*** Test Cases ***

SPS_Login_001_01
    [Documentation]             [หน้า Login เข้าระบบหน้า Mobile Application] ไม่กรอก Username และ Password
    [Tags]    SPS_Login_001    UAT    Low    Regression
    sps_login_page.Click Login Button
