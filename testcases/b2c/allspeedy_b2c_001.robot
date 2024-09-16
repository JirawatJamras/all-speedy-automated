*** Settings ***
Resource          ../../resourses/import.robot
Suite Setup       Run Keywords    Open Chrome Browser
                  ...    AND   Set Folder Result with date
Suite Teardown    Close Browser


*** Test Cases ***
AllSpeedy_B2C_001_ID_1
    [Documentation]                           [Login เข้าสู่ระบบ] Loginเข้าระบบประเภทลูกค้าธุรกิจ กรอกEmailไม่ถูกต้อง 
    [Tags]                                    AllSpeedy_B2C_001_ID_1
    common.Open URL                           ${B2C_UAT_URL}
    b2c_landing_page.Click Go Login Button
    b2c_login.Input Email                    ${b2c_login_user_01['username']}
    b2c_login.Input Password                 ${b2c_login_user_01['password']}
    b2c_login.Click Log On Button
    Verify Error Message     ${AllSpeedy_B2C_001_ID_1['expected_error_message']}
   common.Verify Capture Screenshot    AllSpeedy_B2C_001_ID_1    Login to the business customer system. Enter incorrect email

