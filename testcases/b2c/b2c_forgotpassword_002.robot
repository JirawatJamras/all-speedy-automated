*** Settings ***
Resource          ../../resourses/import.robot
Resource          ../../resourses/init_website.robot
Test Setup       Run Keywords    Open Chrome Browser    chrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result with date
Test Teardown    Close Browser

*** Test Cases ***
B2C_ForgotPassword_002_03
    [Documentation]    [ลืมรหัสผ่าน] กรอก E-mail ถูกต้อง กรอก E-mail เป็นภาษาอังกฤษ ตัวเลข อักขระพิเศษ ในรูปแบบอีเมล์
    [Tags]    B2C_ForgotPassword_002    UAT    Medium    Regression    In_Review
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Click Forgot Password Button
    b2c_forgot_password_page.Input Email    ${B2C_ForgotPassword_002_03.email['input']}
    b2c_forgot_password_page.Click Confirm Button
    b2c_forgot_password_page.Verify Recover Password Popup    ${B2C_ForgotPassword_002_03}
    common.Verify Capture Screenshot    B2C_ForgotPassword_002    Verify Recover Password Popup