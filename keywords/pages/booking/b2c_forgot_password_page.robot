*** Keywords ***
Input Email
    [Arguments]    ${value}
    common.Input When Ready    ${b2c_txtbox_email_forgot_password_page}    ${value}