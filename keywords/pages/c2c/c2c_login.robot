*** Keywords ***
Input Email
    [Arguments]                      ${value}
    Wait Until Element Is Visible    ${c2c_txtbox_email}
    Input Text                       ${c2c_txtbox_email}     ${value}

Input Password
    [Arguments]                      ${value}
    Wait Until Element Is Visible    ${c2c_txtbox_password}
    Input Text                       ${c2ctxtbox_password}    ${value}

Click Log On Button
    Wait Until Element Is Visible    ${c2c_btn_log_on}
    Click Element                    ${c2c_btn_log_on}