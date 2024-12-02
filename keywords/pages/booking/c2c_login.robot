*** Keywords ***
Input Email
    [Arguments]                      ${value}
    common.Input When Ready    ${c2c_txtbox_email_login_page}    ${value} 

Input Password
    [Arguments]                      ${value}
    common.Input When Ready    ${c2c_txtbox_password_login_page}    ${value} 

Click Log On Button
    Scroll Window To Vertical    200
    ${c2c_btn_log_on_login_page}=    Replace String    ${c2c_btn_log_on_login_page}    {value}   ${Booking['text_login']}
    common.Click When Ready    ${c2c_btn_log_on_login_page}