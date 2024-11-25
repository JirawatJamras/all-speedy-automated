*** Keywords ***
Click Text
    [Arguments]    ${menu}
    ${selected_menu_text} =  Replace String   ${txt_menu_register}   {value}   ${menu}
    Wait Until Element Is Visible    ${selected_menu_text}    timeout=${DEFAULT_TIMEOUT}
    Click Element    ${selected_menu_text} 

Click Menu Register Business
    ${selected_menu_text} =  Replace String   ${txt_menu_register}   {value}   ${Register.Pre_register['text_menu_register']}
    common.Click when ready    ${selected_menu_text}

