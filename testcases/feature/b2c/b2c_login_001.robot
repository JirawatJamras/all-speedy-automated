*** Settings ***
Resource          ../../resourses/init_website.robot
Resource          ../../resourses/import.robot
Test Setup       Run Keywords    Open Chrome Browser    chrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result with date
Test Teardown    Close Browser

*** Test Cases ***
B2C_Login_001_002
    [Documentation]    [Login เข้าสู่ระบบ] กรอก E-mail ไม่ถูกต้อง ไม่กรอก E-mail
    [Tags]    B2C_Login_001    UAT    Low    UAT    Regression    
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Password    ${B2C_Login_001_002.password['input']}
    b2c_login_page.Click Log On Button Only
    b2c_login_page.Verify Validation Required Input Email    ${B2C_Login_001_002.email.errormsg['expected']}
    common.Verify Capture Screenshot    B2C_Login_001_002    Verify Validation Required Input Email

B2C_Login_001_004
    [Documentation]    [Login เข้าสู่ระบบ] กรอกรหัสผ่าน ไม่ถูกต้อง ไม่กรอกรหัสผ่าน
    [Tags]    B2C_Login_001    UAT    Low    UAT    Regression    
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email    ${B2C_Login_001_004.email['input']}
    b2c_login_page.Click Log On Button Only
    b2c_login_page.Verify Validation Required Input Password    ${B2C_Login_001_004.password.errormsg['expected']}
    common.Verify Capture Screenshot    B2C_Login_001_004    Verify Validation Required Input Password

B2C_Login_001_005
    [Documentation]    [Login เข้าสู่ระบบ] กรอก E-mail และรหัสผ่าน ถูกต้อง
    [Tags]    B2C_Login_001    UAT    High    UAT    Regression    
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email    ${b2c_login_user_01['username']}
    b2c_login_page.Input Password    ${b2c_login_user_01['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Verify Login To Profile Page Correctly
    common.Verify Capture Screenshot    B2C_Login_001_005    Verify Login To Profile Page Correctly