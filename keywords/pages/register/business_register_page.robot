**** Keywords ***
Click Checkbox Partner Types Legal
    [Arguments]    ${Partner_Types}
    Wait Until Element Is Visible    //span[text()='${Partner_Types}']/../..//label[@class='ant-radio-wrapper ant-radio-wrapper-checked css-1x1kih3']
    Click Element    //span[text()='${Partner_Types}']/../..//label[@class='ant-radio-wrapper ant-radio-wrapper-checked css-1x1kih3']

Select Company registration prefix   
    [Arguments]    ${Prefix}
    Wait Until Element Is Visible    ${register_dropdown_company_registration_prefix_register_page} 
    Click Element    ${register_dropdown_company_registration_prefix_register_page}
    Wait Until Element Is Visible    //div[text()='${Prefix}'][@class='ant-select-item-option-content'] 
    Click Element    //div[text()='${Prefix}'][@class='ant-select-item-option-content']

Verify Company registration prefix 
    [Arguments]    ${Prefix}
    Wait Until Element Is Visible    ${register_select_company_registration_prefix_register_page}    timeout=10s
    Element Should Be Visible    ${register_select_company_registration_prefix_register_page}    ${Prefix}

Input Text Register
    [Arguments]    ${TextBox}    ${Value}
    Wait Until Element Is Visible    ${TextBox}
    Input Text                       ${TextBox}    ${Value}   

Verify Input Text Box
    [Arguments]    ${TextBox}    ${Value}
    Wait Until Element Is Visible    ${TextBox}    
    Element Should Be Visible    ${TextBox}    ${Value}

Input Company Name 
    [Arguments]    ${Value}  
    Input Text Register    ${register_textbox_company_name_register_page}     ${Value}

Verify Input Company Name
    [Arguments]    ${Value}  
    Verify Input Text Box    ${register_textbox_company_name_register_page}    ${Value}

Input Id Number 
    [Arguments]    ${Value}  
    Input Text Register    ${register_textbox_id_number_register_page}    ${Value}  

Verify Input Id Number 
    [Arguments]    ${Value}  
    Verify Input Text Box    ${register_textbox_id_number_register_page}    ${Value}   

Input Company Address 
    [Arguments]    ${Value}  
    Input Text Register    ${register_textbox_company_address_register_page}    ${Value}  
    #Select 
Verify Input Company Address  
    [Arguments]    ${Value}  
    Verify Input Text Box    ${register_textbox_company_address_register_page}    ${Value}     

     