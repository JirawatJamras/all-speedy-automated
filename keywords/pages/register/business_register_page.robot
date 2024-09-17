**** Keywords ***
Click Checkbox Partner Types Legal
    [Arguments]    ${Partner_Types}
    Wait Until Element Is Visible    //span[text()='${Partner_Types}']/../..//label[@class='ant-radio-wrapper ant-radio-wrapper-checked css-1x1kih3']
    Click Element    //span[text()='${Partner_Types}']/../..//label[@class='ant-radio-wrapper ant-radio-wrapper-checked css-1x1kih3']

Select Company Title Name   
    [Arguments]    ${Title}
    Wait Until Element Is Visible    ${register_dropdown_company_title_name_register_page}    timeout=10s 
    Click Element    ${register_dropdown_company_title_name_register_page}
    Wait Until Element Is Visible    //div[text()='${Title}'][@class='ant-select-item-option-content'] 
    Click Element    //div[text()='${Title}'][@class='ant-select-item-option-content']

Verify Company Title Name  
    [Arguments]    ${Title}
    Wait Until Element Is Visible    ${register_select_company_title_name_register_page}    timeout=10s
    Element Should Be Visible    ${register_select_company_title_name_register_page}    ${Title}

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

Verify Input Company Address  
    [Arguments]    ${Value}  
    Verify Input Text Box    ${register_textbox_company_address_register_page}    ${Value}     

Input Company Address Full
    [Arguments]    ${Value}  
    Input Text Register    ${register_textbox_company_address_full_register_page}     ${Value}  
    #Select one in result search 
    #Wait Until Element Is Visible    //div[text()='${AllSpeedy_Register_008_ID_18['select_company_address_full']}'][@class='ant-select-item-option-content'] 
    #Click Element    //div[text()='${AllSpeedy_Register_008_ID_18['select_company_address_full']}'][@class='ant-select-item-option-content']

Verify Input Company Address Full  
    [Arguments]    ${Value}  
    Verify Input Text Box    ${register_textbox_company_address_full_register_page}    ${Value}

Select Title Name  
    [Arguments]    ${Title}
    Wait Until Element Is Visible    ${register_dropdown_title_name_register_page}
    Click Element    ${register_dropdown_title_name_register_page}
    Wait Until Element Is Visible    //div[text()='${Title}'][@class='ant-select-item-option-content'] 
    Click Element    //div[text()='${Title}'][@class='ant-select-item-option-content']

Verify Title Name  
    [Arguments]    ${Title}
    Wait Until Element Is Visible    ${register_select_title_name_register_page}    timeout=10s
    Element Should Be Visible    ${register_select_title_name_register_page}    ${Title}

Input First Name
    [Arguments]    ${Value}  
    Input Text Register    ${register_textbox_first_name_register_page}     ${Value}

Verify Input First Name
    [Arguments]    ${Value}  
    Verify Input Text Box    ${register_textbox_first_name_register_page}    ${Value}

Input Last Name
    [Arguments]    ${Value}  
    Input Text Register    ${register_textbox_last_name_register_page}     ${Value}  

Verify Input Last Name
    [Arguments]    ${Value}  
    Verify Input Text Box    ${register_textbox_last_name_register_page}    ${Value}  

Input Email
    [Arguments]    ${Value}  
    Input Text Register    ${register_textbox_email_register_page}     ${Value}  

Verify Input Email
    [Arguments]    ${Value}  
    Verify Input Text Box    ${register_textbox_email_register_page}    ${Value}

Input Mobile No
    [Arguments]    ${Value}  
    Input Text Register    ${register_textbox_mobile_no_register_page}     ${Value}  

Verify Input Mobile No
    [Arguments]    ${Value}  
    Verify Input Text Box    ${register_textbox_mobile_no_register_page}    ${Value}

Input Mobile Ext
    [Arguments]    ${Value}  
    Input Text Register    ${register_textbox_mobile_ext_register_page}     ${Value}

Verify Input Mobile Ext
    [Arguments]    ${Value}  
    Verify Input Text Box    ${register_textbox_mobile_ext_register_page}    ${Value}