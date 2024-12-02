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

Select Customer Tab
    Wait Until Element Is Visible    ${c2c_tab_customer_login_page}
    Click Element                    ${c2c_tab_customer_login_page}

Click Show Password
    Wait Until Element Is Visible    ${c2c_icon_show_password_login_page}
    Click Element    ${c2c_icon_show_password_login_page}

Click Hide Password
    Scroll Window To Vertical    0
    Wait Until Element Is Visible    ${c2c_icon_hide_password_login_page}
    Click Element    ${c2c_icon_hide_password_login_page}

Verify Customer Email Txtbox
    [Arguments]    ${email}
    Wait Until Element Is Visible    ${c2c_expected_email_txtbox_login_page}
    Element Should Be Visible    ${c2c_expected_email_txtbox_login_page}    ${email}

Verify Email Error Message
    [Arguments]    ${error_msg}
    Wait Until Element Is Visible    ${c2c_errormsg_email_login_page}    
    Element Should Contain    ${c2c_errormsg_email_login_page}    ${error_msg}

Verify Password Error Message
    [Arguments]    ${error_msg}
    Wait Until Element Is Visible    ${c2c_errormsg_password_login_page}   
    Element Should Contain    ${c2c_errormsg_password_login_page}    ${error_msg}

Verify Show Password
    Wait Until Element Is Visible    ${c2c_show_password_login_page}

Verify Hide Password
    Wait Until Element Is Visible    ${c2c_hide_password_login_page}