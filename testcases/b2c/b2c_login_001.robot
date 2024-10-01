*** Settings ***
Resource          ../../resourses/import.robot
Resource          ../../resourses/init_website.robot
Test Setup       Run Keywords    Open Chrome Browser    chrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result with date
Test Teardown    Close Browser

*** Test Cases ***
B2C_Login_001_02
    [Documentation]    [Login เข้าสู่ระบบ] กรอก E-mail ไม่ถูกต้อง ไม่กรอก E-mail
    [Tags]    B2C_Login_001    UAT    Low    UAT    Regression    In_Review
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Password    ${B2C_Login_001_02.password['input']}
    b2c_login_page.Click Log On Button Only
    b2c_login_page.Verify Validation Required Input Email    ${B2C_Login_001_02.email.errormsg['expected']}
    common.Verify Capture Screenshot    B2C_Login_001_02    Verify Validation Required Input Email

B2C_Login_001_04
    [Documentation]    [Login เข้าสู่ระบบ] กรอกรหัสผ่าน ไม่ถูกต้อง ไม่กรอกรหัสผ่าน
    [Tags]    B2C_Login_001    UAT    Low    UAT    Regression    In_Review
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email    ${B2C_Login_001_04.email['input']}
    b2c_login_page.Click Log On Button Only
    b2c_login_page.Verify Validation Required Input Password    ${B2C_Login_001_04.password.errormsg['expected']}
    common.Verify Capture Screenshot    B2C_Login_001_04    Verify Validation Required Input Password

B2C_Login_001_05
    [Documentation]    [Login เข้าสู่ระบบ] กรอก E-mail และรหัสผ่าน ถูกต้อง
    [Tags]    B2C_Login_001    UAT    High    UAT    Regression    In_Review
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email    ${b2c_login_user_06['username']}
    b2c_login_page.Input Password    ${b2c_login_user_06['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Verify Login To Profile Page Correctly
    common.Verify Capture Screenshot    B2C_Login_001_05    Verify Login To Profile Page Correctly