*** Settings ***
Resource          ../../resourses/import.robot
Suite Setup       Run Keywords    Open Browser And Go To Allspeedy C2C Website
                  ...    AND   Set Folder Result with date
Suite Teardown    Close Browser


*** Test Cases ***
AllSpeedy_C2C_001_ID_1
    [Documentation]                           [Login เข้าสู่ระบบ] Loginเข้าระบบประเภทลูกค้าทั่วไป เลือกลูกค้าทั่วไป
    [Tags]                                    AllSpeedy_C2C_001_ID_1
    common.Open URL                           ${C2C_UAT_URL}
    c2c_landing_page.Click Go Login Button
    c2c_login.Input Email                    ${c2c_login_user_01['username']}
    c2c_login.Input Password                 ${c2c_login_user_01['password']}
    c2c_login.Click Log On Button
    Verify Error Message     ${AllSpeedy_C2C_001_ID_1['expected_error_message']}
    Verify Capture Screenshot    AllSpeedy_C2C_001_ID_1    Username entered incorrectly

