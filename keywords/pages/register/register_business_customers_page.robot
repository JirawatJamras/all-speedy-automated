*** Keywords ***
Verify Business Customers Tab Page
    [Arguments]    ${testcase}
    Verify Email Business TextBox    ${${testcase}.emailBusiness['expected']}
    Verify Password Business TextBox    ${${testcase}.passwordBusiness['expected']}
    Verify Login Button On Business Customers Tab Page    ${${testcase}.loginButton['expected']}
    Verify Forget Password On Business Customers Tab Page    ${${testcase}.forgetPassword['expected']}
    Verify Register Business Customers Button    ${${testcase}.registerBusinessCustomersButton['expected']}

Verify Email Business TextBox
    [Arguments]    ${text}
    Wait Until Element Is Visible    ${register_txt_email_business_customers_page}    timeout=10s
    Element Should Contain    ${register_txt_email_business_customers_page}    ${text}

Verify Password Business TextBox
    [Arguments]    ${text}
    Wait Until Element Is Visible    ${register_txt_password_business_customers_page}    timeout=10s
    Element Should Contain    ${register_txt_password_business_customers_page}    ${text}

Click Register Business Customers Button
    common.Click when ready    ${register_btn_register_business_customer_page}

Verify Login Button On Business Customers Tab Page
    [Arguments]    ${text}
    Wait Until Element Is Visible    ${register_btn_login_business_customers_page}    timeout=10s
    Element Should Contain    ${register_btn_login_business_customers_page}    ${text}

Verify Forget Password On Business Customers Tab Page
    [Arguments]    ${text}
    Wait Until Element Is Visible    ${register_btn_forgotpassword_business_customers_page}    timeout=10s
    Element Should Contain    ${register_btn_forgotpassword_business_customers_page}    ${text}

Verify Register Business Customers Button
    [Arguments]    ${text}
    Wait Until Element Is Visible    ${register_btn_register_business_customer_page}    timeout=10s
    Element Should Contain    ${register_btn_register_business_customer_page}    ${text}