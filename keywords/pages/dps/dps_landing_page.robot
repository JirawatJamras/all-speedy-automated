**** Keywords ***
Click Go Login Button
    ${login_button}=    Replace String    ${dps_btn_go_login}    {value}    ${landing_page['text_button_login']}
    Wait Until Element Is Visible    ${login_button}
    Click Xpath By JavaScript        ${login_button}
    ${isvisible}    Run Keyword And Return Status    Wait Until Element Is Visible    ${dps_txtbox_username}    timeout=5
    Run Keyword IF  '${isvisible}' == 'False'   Reload Page    

