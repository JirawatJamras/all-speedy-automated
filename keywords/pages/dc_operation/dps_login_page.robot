*** Keywords ***
Input Email
    [Arguments]    ${value}
    common.Input When Ready    ${dps_txtbox_username}    ${value}

Input Password
    [Arguments]    ${value}
    common.Input When Ready    ${dps_txtbox_password}    ${value}

Verify Login Page
    Wait Until Element Is Visible    ${dps_txtbox_username}    timeout=${DEFAULT_TIMEOUT}
    Wait Until Element Is Visible    ${dps_txtbox_password}    timeout=${DEFAULT_TIMEOUT}

Click Log On Button
    common.Click when ready    ${dps_btn_log_on}