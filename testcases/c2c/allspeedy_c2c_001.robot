*** Settings ***
Resource          ../../resourses/import.robot
Suite Setup       Run Keywords    Open Chrome Browser    chrome    #chrome    #headlesschrome
                  ...    AND   Set Folder Result with date
Suite Teardown    Close Browser

*** Test Cases ***
AllSpeedy_C2C_001_ID_1
    [Documentation]    [รูปแบบการล็อกอินเข้าใช้งานระบบ SPEED-D] Login เว็บ SPEED-D(Impacted by The Solution Changes) กรณี ไม่กรอก E-mail และรหัสผ่าน
    [Tags]    AllSpeedy_C2C_001    UAT    Medium    Regression
    common.Open URL    ${C2C_UAT_URL}
    c2c_login.Select Customer Tab
    c2c_login.Click Log On Button
    c2c_login.Verify Email Error Message     ${AllSpeedy_C2C_001_ID_1['expected_email_errormsg']}
    c2c_login.Verify Password Error Message     ${AllSpeedy_C2C_001_ID_1['expected_password_errormsg']}
    common.Verify Capture Screenshot    AllSpeedy_C2C_001_ID_1    Username and password were not entered.

AllSpeedy_C2C_001_ID_2
    [Documentation]    [รูปแบบการล็อกอินเข้าใช้งานระบบ SPEED-D] Login เว็บ SPEED-D(Impacted by The Solution Changes) กรณี กรอก E-mail ไม่ถูกต้อง 
    [Tags]    AllSpeedy_C2C_001    UAT    Medium    Regression
    common.Open URL    ${C2C_UAT_URL}
    c2c_login.Select Customer Tab
    c2c_login.Input Email    ${AllSpeedy_C2C_001_ID_2['Username_1']}
    c2c_login.Input Password    ${AllSpeedy_C2C_001_ID_2['Password']}
    c2c_login.Click Log On Button
    ### wrong wording when input incorrect email

AllSpeedy_C2C_001_ID_3
    [Documentation]    [รูปแบบการล็อกอินเข้าใช้งานระบบ SPEED-D] Login เว็บ SPEED-D(Impacted by The Solution Changes) กรณี กรอกรหัสผ่าน ไม่ถูกต้อง
    [Tags]    AllSpeedy_C2C_001    UAT    Medium    Regression
    common.Open URL    ${C2C_UAT_URL}
    c2c_login.Select Customer Tab
    c2c_login.Input Email    ${AllSpeedy_C2C_001_ID_3['Username']}
    c2c_login.Input Password    ${AllSpeedy_C2C_001_ID_3['Password']}
    c2c_login.Click Show Password
    c2c_login.Verify Show Password
    common.Verify Capture Screenshot    AllSpeedy_C2C_001_ID_3    Show Password
    c2c_login.Click Hide Password
    c2c_login.Verify Hide Password
    common.Verify Capture Screenshot    AllSpeedy_C2C_001_ID_3    Hide Password
    c2c_login.Click Log On Button
    ### wrong wording when input incorrect password

AllSpeedy_C2C_001_ID_5
    [Documentation]    [รูปแบบการล็อกอินเข้าใช้งานระบบ SPEED-D] Login เว็บ SPEED-D(Impacted by The Solution Changes) กรณี เข้าสู่ระบบลูกค้าทั่วไปด้วย E-mail
    [Tags]    AllSpeedy_C2C_001_ID5    UAT    Medium    Regression
    common.Open URL    ${C2C_UAT_URL}
    c2c_login.Select Customer Tab
    c2c_login.Input Email    ${c2c_login_user_02['username']}
    c2c_login.Verify Customer Email Txtbox    ${c2c_login_user_02['username']}
    c2c_login.Input Password    ${c2c_login_user_02['password']}
    c2c_login.Click Log On Button
    Verify Login Customer Success
    common.Verify Capture Screenshot    AllSpeedy_C2C_001_ID_5    Login Success