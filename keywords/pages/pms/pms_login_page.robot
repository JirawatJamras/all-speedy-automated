*** Keywords ***
Input Email
    [Arguments]    ${email}
    common.Input When Ready    ${pms_txtbox_username}    ${email}

Input Password
    [Arguments]    ${password}
    common.Input When Ready    ${pms_txtbox_password}    ${password}

Click Log On Button
    common.Click When Ready    ${pms_btn_logon}
