*** Keywords ***
Input Email
    [Arguments]                      ${value}
    Wait Until Element Is Visible    ${b2c_txtbox_email}
    Input Text                       ${b2c_txtbox_email}    ${value}

Input Password
    [Arguments]                      ${value}
    Wait Until Element Is Visible    ${b2c_txtbox_password}
    Input Text                       ${b2ctxtbox_password}    ${value}

Click Log On Button
    common.Click when ready    ${b2c_btn_log_on}