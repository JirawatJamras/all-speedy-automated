*** Keywords ***
Input Email
    [Arguments]                      ${value}
    Wait Until Element Is Visible    //input[@title='อีเมล']
    Input Text                       //input[@title='อีเมล']    ${value}

Input Password
    [Arguments]                      ${value}
    Wait Until Element Is Visible    ${b2c_txtbox_password}
    Input Text                       ${b2ctxtbox_password}    ${value}

Click Log On Button
    Wait Until Element Is Visible    ${b2c_btn_log_on}
    Click Element                    ${b2c_btn_log_on}