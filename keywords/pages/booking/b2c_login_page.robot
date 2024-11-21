*** Keywords ***
Input Email
    [Arguments]    ${value}
    Wait Until Element Is Visible    ${b2c_txtbox_email}    timeout=${DEFAULT_TIMEOUT}
    Input Text    ${b2c_txtbox_email}    ${value}

Input Password
    [Arguments]    ${value}
    Wait Until Element Is Visible    ${b2c_txtbox_password}
    Input Text    ${b2c_txtbox_password}    ${value}

Click Log On Button
    ${b2c_btn_log_on}=    Replace String    ${b2c_btn_log_on}    {value}    ${Booking['text_login']}
    Wait Until Element Is Visible    ${b2c_btn_log_on}    timeout=${DEFAULT_TIMEOUT}
    Wait Until Element Is Enabled    ${b2c_btn_log_on}    timeout=${DEFAULT_TIMEOUT}
    Click Element    ${b2c_btn_log_on}
    Wait Until Profile Page Loaded

Click Log On Button Only
    Wait Until Element Is Visible    ${b2c_btn_log_on}
    Click Element    ${b2c_btn_log_on}

Clear Inputbox Email
    common.Clear Value Input Text    ${b2c_txtbox_email}

Verify Validation Required Input Email
    [Arguments]    ${text}
    Wait Until Element Is Visible    ${b2c_error_message_emailbusiness}
    Element Should Contain    ${b2c_error_message_emailbusiness}    ${text}

Verify Validation Required Input Password
    [Arguments]    ${text}
    Wait Until Element Is Visible    ${b2c_error_message_passwordbusiness}
    Element Should Contain    ${b2c_error_message_passwordbusiness}    ${text}

Click Forgot Password Button
    common.Click When Ready    ${b2c_btn_forgot_password_login_page}