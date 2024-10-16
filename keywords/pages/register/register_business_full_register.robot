*** Keywords ***
Login Yopmail
    [Arguments]    ${Text}
    common.Input When Ready    ${register_txtbox_email_yopmail}   ${Text}
    common.Click when ready    ${register_button_next_yopmail} 


Verify Company information
    Wait Until Element Is Visible    ${Company_business_title}
    #Inprogress
