*** Keywords ***
Input Email
    [Arguments]    ${value}
    common.Input When Ready    ${b2c_txtbox_email_forgot_password_page}    ${value}

Click Confirm Button
    common.Click When Ready    ${b2c_btn_confirm_forgot_password_page}

Verify Recover Password Popup
    [Arguments]    ${data}
    Wait Until Element Is Visible    ${b2c_popup_recover_password_forgot_password_page}    timeout=${DEFAULT_TIMEOUT}
    Element Should Contain    ${b2c_popup_recover_password_forgot_password_page}    ${data.popupRecoverPassword.title['expected']}
    Element Should Contain    ${b2c_popup_recover_password_forgot_password_page}    ${data.popupRecoverPassword.message['expected1']}
    Element Should Contain    ${b2c_popup_recover_password_forgot_password_page}    ${data.popupRecoverPassword.message['expected2']}
    Wait Until Element Is Visible    ${b2c_btn_close_recover_password_forgot_password_page}    timeout=${DEFAULT_TIMEOUT}
    Wait Until Element Is Visible    ${b2c_btn_agree_recover_password_forgot_password_page}    timeout=${DEFAULT_TIMEOUT}