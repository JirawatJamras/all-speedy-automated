*** Variables ***
${OS}    Windows

*** Keywords ***

Input Email
    [Arguments]    ${value}
    Input when ready    ${c2c_txtbox_email_login_seven_page}    ${value}

Input Password
    [Arguments]    ${value}
    Input when ready    ${c2c_txtbox_passwrd_login_seven_page}    ${value}

Click Log in Button
    Scroll Window To Vertical    150
    common.Click when ready    ${c2c_btn_logIn_login_seven_page}

