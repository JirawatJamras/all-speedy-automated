*** Keywords ***
Login Yopmail
    [Arguments]    ${Text}
    common.Open URL    https://yopmail.com/
    common.Input When Ready    ${register_txtbox_email_yopmail}   ${Text}
    common.Click when ready    ${register_button_next_yopmail} 

Login mail
    [Arguments]    ${Email}    ${Password}
    common.Open URL    https://mail.google.com/
    common.Input When Ready    ${register_txtbox_email_gmail}   ${Email}
    common.Click when ready    ${register_button_next_gmail}
    common.Input When Ready    ${register_txtbox_password_gmail}   ${Password}
    common.Click when ready    ${register_button_next_gmail}

   
Get Link On Email
    #Wait Until Element Is Visible    //div[@id='mobmailctn']    10s
    # Execute JavaScript    document.getElementById('mobmailctn').removeAttribute('state');
    # Wait Until Element Is Visible    ${register_txt_link_full_register}    ${DEFAULT_TIMEOUT}
    # ${link_full_register}=    Get Text    ${register_txt_link_full_register}
    #${link_full_register}=   Set Variable    https://www-uat.allspeedy.co.th/business-register/fullRegister/998885286936791213
    common.Click when ready    ${register_button_inbox_gmail} 
    ${Select_link}=    Replace String    ${register_txt_link_register_gmail}     {value}    ${Register.Full_register['txt_link_register']}
    ${link_full_register}=    Get Text    ${Select_link}
    Set Global Variable    ${link_full_register}

Verify Company information
    [Arguments]    ${partner_types}    ${title_name}    ${first_name}    ${last_name}    ${id_number}    
    ...    ${email}    ${individual_address}    ${select_individual_address_full}    ${mobile_no}    ${mobile_ext}
    Wait Until Element Is Visible    ${Company_business_title}
    #Inprogress
