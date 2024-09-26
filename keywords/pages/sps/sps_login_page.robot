*** Keywords ***
Click Log On Button
    Click When Ready    ${sps_btn_logon_login_page}

Verify Error Message You Need To Enter Login Name
    [Arguments]    ${value}
    Verify Text Of Element    ${sps_txt_errormsg_need_enter_login_name_login_page}    ${value}

Input Username
    [Arguments]    ${value}
    Input When Ready    ${sps_txtbox_username_login_page}    ${value}

Input Password
    [Arguments]   ${value}
    Input When Ready    ${sps_txtbox_password_login_page}    ${value}

Verify Error Message You Need To Enter A Password
    [Arguments]    ${value}
    Verify Text Of Element    ${sps_txt_errormsg_need_enter_login_name_login_page}    ${value}