*** Keywords ***
Input Email
    [Arguments]                      ${value}
    Wait Until Element Is Visible    ${dps_txtbox_username}
    Input Text                       ${dps_txtbox_username}    ${value}

Input Password
    [Arguments]                      ${value}
    Wait Until Element Is Visible    ${dps_txtbox_password}
    Input Text                       ${dps_txtbox_password}    ${value}

Click Log On Button
    Wait Until Element Is Visible    ${dps_btn_log_on}
    Click Element                    ${dps_btn_log_on}
