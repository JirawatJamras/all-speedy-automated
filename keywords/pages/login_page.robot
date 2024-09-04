*** Keywords ***
Input Email
    [Arguments]    ${value}
    Wait Until Element Is Visible    //input[@id='login']
    Input Text    //input[@id='login']    ${value}

Input Password
    [Arguments]    ${value}
    Wait Until Element Is Visible    //input[@id='passwd']
    Input Text    //input[@id='passwd']    ${value}

Click Log On Button
    Wait Until Element Is Visible    ${btn_log_on}
    Click Element    ${btn_log_on}