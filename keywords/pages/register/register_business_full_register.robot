*** Keywords ***
Login Yopmail
    [Arguments]    ${Text}
    common.Input When Ready    ${register_txtbox_email_yopmail}   ${Text}
    common.Click when ready    ${register_button_next_yopmail} 


Verify Company information
    [Arguments]    ${partner_types}    ${title_name}    ${first_name}    ${last_name}    ${id_number}    
    ...    ${email}    ${individual_address}    ${select_individual_address_full}    ${mobile_no}    ${mobile_ext}
    Wait Until Element Is Visible    ${Company_business_title}
    #Inprogress
