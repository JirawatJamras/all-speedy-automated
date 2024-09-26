*** Keywords ***
Click Login Button
    Click When Ready    ${sps_btn_login_login_page}

Click Logon Button
    Click When Ready    ${sps_btn_logon_login_page}

Input Username
    [Arguments]    ${Value}
    common.Input When Ready    ${sps_txtbox_username_login_page}    ${Value}

Input Password
    [Arguments]    ${Value}
    common.Input When Ready    ${sps_txtbox_password_login_page}    ${Value}

Verify Error Message When Input Wrong Username
    [Arguments]    ${Value}
    common.Verify text of element    ${sps_txt_errormsg_wrong_username_login_page}    ${Value} 

Verify CanNot Login When Input Wrong Username
    Wait Until Page Does Not Contain Element    ${sps_txt_loading_to_login_login_page}
    Wait Until Element Is Visible    ${sps_btn_logon_login_page}
    