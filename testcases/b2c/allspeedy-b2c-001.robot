*** Settings ***
Resource          ../../resourses/import.robot
Suite Setup       Open Browser And Go To Allspeedy B2C Website
Suite Teardown    Close Browser
Force Tags        AllSpeedy-B2C-001

*** Test Cases ***

AllSpeedy-B2C-001-ID-1
    [Documentation]                           [Login เข้าสู่ระบบ] Loginเข้าระบบประเภทลูกค้าธุรกิจ กรอก E-mail ไม่ถูกต้อง 
    [Tags]                                    AllSpeedy-B2C-001-ID-1
    common.Open URL                           ${B2C_UAT_URL}
    landing_page.Click Go Login B2C Button
    login_b2c.Input Email                    ${b2c_login_user_01['username']}
    login_b2c.Input Password                 ${b2c_login_user_01['password']}
    login_b2c.Click Log On Button

