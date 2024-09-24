*** Settings ***
Resource          ../../resourses/import.robot
Suite Setup       Run Keywords    Open Chrome Browser    headlesschrome    #chrome    #headlesschrome
                  ...    AND   Set Folder Result with date
Suite Teardown    Close Browser

*** Test Cases ***
AllSpeedy_C2C_001_ID_1
    [Documentation]    [Login เข้าสู่ระบบ] Loginเข้าระบบประเภทลูกค้าทั่วไป เลือกลูกค้าทั่วไป
    [Tags]    AllSpeedy_C2C_001_ID1    UAT
    common.Open URL    ${C2C_UAT_URL}
    c2c_login.Input Email    ${c2c_login_user_01['username']}
    c2c_login.Input Password    ${c2c_login_user_01['password']}
    c2c_login.Click Log On Button
    Verify Error Message     ${AllSpeedy_C2C_001_ID_1['expected_error_message']}
    common.Verify Capture Screenshot    AllSpeedy_C2C_001_ID_1    Username entered incorrectly

AllSpeedy_C2C_001_ID_6
    [Documentation]    [รูปแบบการล็อกอินเข้าใช้งานระบบ SPEED-D] Login เว็บ SPEED-D(Impacted by The Solution Changes) กรณี เข้าสู่ระบบลูกค้าทั่วไปด้วย E-mail
    [Tags]    AllSpeedy_C2C_001    UAT
    common.Open URL    ${C2C_UAT_URL}
    c2c_login.Input Email    ${c2c_login_user_02['username']}
    Verify Customer Email Txtbox    ${c2c_login_user_02['username']}
    c2c_login.Input Password    ${c2c_login_user_02['password']}
    c2c_login.Click Log On Button
    Verify Login Customer Success
    common.Verify Capture Screenshot    AllSpeedy_C2C_001_ID_6    Login Success