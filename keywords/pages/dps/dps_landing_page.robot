**** Keywords ***
Click Go Login Button
    Wait Until Element Is Visible    ${dps_btn_go_login}
    Click Xpath By JavaScript        ${dps_btn_go_login}
    ${isvisible}    Run Keyword And Return Status    Wait Until Element Is Visible    ${dps_txtbox_username}    timeout=5
    Run Keyword IF  '${isvisible}' == 'False'   Reload Page    