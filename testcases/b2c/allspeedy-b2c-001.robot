*** Settings ***
Resource          ../../resourses/import.robot
Suite Setup       Run Keywords    Open Browser And Go To Allspeedy DPS Website
                  ...    AND   Set Folder Result with date
Suite Teardown    Close Browser


*** Test Cases ***
AllSpeedy-B2C-001-ID-1
    [Documentation]                           [Login เข้าสู่ระบบ] Loginเข้าระบบประเภทลูกค้าธุรกิจ กรอก E-mail ไม่ถูกต้อง 
    [Tags]                                    AllSpeedy-B2C-001-ID-1
    common.Open URL                           https://speed-d.allspeedy.co.th/login
    # common.Open URL                           ${B2C_UAT_URL}
    # b2c_landing_page.Click Go Login Button
    b2c_login.Input Email                    ${b2c_login_user_01['username']}
    b2c_login.Input Password                 ${b2c_login_user_01['password']}
    b2c_login.Click Log On Button
    Verify Error Message     ${b2c_errormessage_01['expected_error_01']}
    
