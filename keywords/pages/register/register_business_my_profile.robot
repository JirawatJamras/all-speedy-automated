*** Keywords ***
Click Edit Button
    Wait Until Element Is Visible    ${edit_btn}
    Click Element    ${edit_btn}

Edit Mobile No
    [Arguments]    ${Value}
    Wait Until Element Is Visible    ${mobile_no_txtbox}
    Clear Element Text    ${mobile_no_txtbox}
    Input Text    ${mobile_no_txtbox}    ${Value}

Click Save Button
    Wait Until Element Is Visible    ${save_btn}
    Clear Element Text    ${save_btn}
