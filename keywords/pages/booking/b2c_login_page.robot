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