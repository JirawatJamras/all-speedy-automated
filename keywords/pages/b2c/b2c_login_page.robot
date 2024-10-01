*** Keywords ***
Input Email
    [Arguments]    ${value}
    Wait Until Element Is Visible    ${b2c_txtbox_email}
    Input Text    ${b2c_txtbox_email}    ${value}

Input Password
    [Arguments]    ${value}
    Wait Until Element Is Visible    ${b2c_txtbox_password}
    Input Text    ${b2c_txtbox_password}    ${value}

Click Log On Button
    Wait Until Element Is Visible    ${b2c_btn_log_on}
    Click Element    ${b2c_btn_log_on}
    Wait Until Profile Page Loaded
    
Verify EmailBusiness ErrorMessage
    [Arguments]    ${error_txt}
    Wait Until Element Is Visible    ${b2c_error_message_emailbusiness}    timeout=10s
    Element Should Be Visible    ${b2c_error_message_emailbusiness}    ${error_txt}

Verify PasswordBusiness ErrorMessage
    [Arguments]    ${error_txt}
    Wait Until Element Is Visible    ${b2c_error_message_passwordbusiness}    timeout=10s
    Element Should Be Visible    ${b2c_error_message_passwordbusiness}    ${error_txt}

Verify Error Message B2C_001_ID_1
    Verify EmailBusiness ErrorMessage     ${AllSpeedy_B2C_001_ID_1['expected_error_message_email']}
    Verify PasswordBusiness ErrorMessage     ${AllSpeedy_B2C_001_ID_1['expected_error_message_password']}

Clear Email and Password Textbox
    Clear Element Text    ${b2c_txtbox_email}
    Clear Element Text    ${b2c_txtbox_password}

Verify Error Message B2C_001_ID_2
    [Arguments]    ${expected_error}
    Wait Until Element Is Visible    ${b2c_error_message}    timeout=10s
    Element Should Contain    ${b2c_error_message}    ${expected_error}

Verify Error Message B2C_001_ID_3
    [Arguments]    ${expected_error}
    Wait Until Element Is Visible    ${b2c_error_message}    timeout=10s
    Element Should Contain    ${b2c_error_message}    ${expected_error}

Verify Error Message B2C_001_ID_4
    [Arguments]    ${expected_error}
    Wait Until Element Is Visible    ${b2c_error_message}    timeout=10s
    Element Should Contain    ${b2c_error_message}    ${expected_error}

Verify Error Message B2C_001_ID_5
    [Arguments]    ${expected_error}
    Wait Until Element Is Visible    ${b2c_error_message}    timeout=10s
    Element Should Contain    ${b2c_error_message}    ${expected_error}