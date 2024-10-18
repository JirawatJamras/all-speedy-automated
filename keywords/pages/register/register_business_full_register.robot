*** Keywords ***
Login mail
    [Arguments]    ${Email}    ${Password}
    common.Open URL    https://mail.google.com/
    common.Input When Ready    ${register_txtbox_email_gmail}   ${Email}
    common.Click when ready    ${register_btn_next_gmail}
    common.Input When Ready    ${register_txtbox_password_gmail}   ${Password}
    common.Click when ready    ${register_btn_next_gmail}

Get Link On Email
    ${Select_link}=    Replace String    ${register_link_register_gmail}     {value}    ${rm_link_full_register}
    Wait Until Element Is Visible    ${Select_link}   ${DEFAULT_TIMEOUT}
    ${link_full_register}=    Get Text    ${Select_link}
    Set Suite Variable    ${link_full_register}

Verify Company information Legal Entity
    [Arguments]    ${partner_types}    ${company_title_name}    ${company_name}    ${id_number}    
    ...    ${company_address}    ${select_company_address_full}    ${title_name}
    ...    ${first_name}    ${last_name}    ${email}    ${mobile_no}    ${mobile_ext}
    #หัวข้อข้อมูลบริษัท
    ${txt_title}=    Replace String    ${register_txt_title_full_register}    {value}    ${Register.Full_register['txt_title_company_information']}
    ${txt_header}=    Replace String    ${register_txt_header_full_register}    {value}    ${Register.Full_register['txt_header_company_information']}
    ${txt_partner_types}=    Get Value    ${register_btn_partner_types_full_register}
    ${txt_company_title_name}=    Get Text    ${register_dropdown_company_title_name_legal_entity_full_register} 
    ${txt_company_name}=    Get Value    ${register_txtbox_company_name_legal_entity_full_register}
    ${txt_id_number}=    Get Value    ${register_txtbox_juristic_identification_number_legal_entity_full_register} 
    ${txt_company_address}=    Get Value    ${register_txtbox_company_address_legal_entity_full_register}
    ${txt_select_company_address_full}=    Get Text    ${register_dropdown_company_address_full_legal_entity_full_register}
    ${txt_mobile_company}=     Get Value    ${register_txtbox_mobile_company_legal_entity_full_register}
    ${txt_mobile_company_ext}=     Get Value    ${register_txtbox_mobile_company_ext_legal_entity_full_register}
    ${txt_title_name}=    Get Text    ${register_dropdown_title_name_legal_entity_full_register}
    ${txt_first_name}=    Get Value    ${register_txtbox_first_name_legal_entity_full_register}
    ${txt_last_name}=    Get Value    ${register_txtbox_last_name_legal_entity_full_register}
    ${txt_email}=    Get Value    ${register_txtbox_email_legal_entity_full_register}
    ${txt_mobile_no}=    Get Value    ${register_txtbox_mobile_no_legal_entity_full_register}
    ${txt_mobile_ext}=    Get Value    ${register_txtbox_mobile_ext_legal_entity_full_register}
    
    Page Should Contain Element    ${txt_title}   ${DEFAULT_TIMEOUT}
    Wait Until Element Is Visible    ${txt_header}   ${DEFAULT_TIMEOUT}

    Should Be Equal As Strings    ${txt_partner_types}     ${partner_types}
    Should Be Equal As Strings    ${txt_company_title_name}     ${company_title_name}
    Should Be Equal As Strings    ${txt_company_name}     ${company_name}
    Should Be Equal As Strings    ${txt_id_number}     ${id_number}
    Should Be Equal As Strings    ${txt_company_address}     ${company_address}
    Should Be Equal As Strings    ${txt_select_company_address_full}     ${select_company_address_full}
    Should Be Empty    ${txt_mobile_company}
    Should Be Empty    ${txt_mobile_company_ext}
    Should Be Equal As Strings    ${txt_title_name}     ${title_name}
    Should Be Equal As Strings    ${txt_first_name}     ${first_name}
    Should Be Equal As Strings    ${txt_last_name}     ${last_name}
    Should Be Equal As Strings    ${txt_email}     ${email}
    Should Be Equal As Strings    ${txt_mobile_no}     ${mobile_no}
    Should Be Equal As Strings    ${txt_mobile_ext}     ${mobile_ext}

Verify Email That Have Received Link
    common.Click when ready    ${register_btn_inbox_gmail} 
    ${Select_link}=    Replace String    ${register_txt_link_register_gmail}     {value}    ${Register.Full_register['txt_link_register']}
    ${Select_link}=    Replace String    ${Select_link}     {link}    ${rm_link_full_register}
    Scroll Into View By Xpath    ${Select_link}    true
    
Input Mobile Company Legal Entity
    [Arguments]    ${Value}  
    common.Input When Ready    ${register_txtbox_mobile_company_legal_entity_full_register}     ${Value}  

Input Mobile Company Ext Legal Entity
    [Arguments]    ${Value}  
    common.Input When Ready    ${register_txtbox_mobile_company_ext_legal_entity_full_register}     ${Value}

Click Next 
    ${Click_next}=    Replace String    ${register_btn_next_full_register}     {value}    ${Register.Full_register['btn_next']}
    common.Click when ready    ${Click_next}
    
Click Cancel
    ${Click_cancel}=    Replace String    ${register_btn_cancel_full_register}     {value}    ${Register.Full_register['btn_cancel']}
    common.Click when ready    ${Click_cancel}

Click Save
    ${Click save}=    Replace String    ${register_btn_save_full_register}     {value}    ${Register.Full_register['btn_save']}
    common.Click when ready    ${Click save}

Verify Cancel Popup
    [Arguments]    ${Header}    ${Body}
    ${Header_cancel_popup}=    Replace String    ${register_txt_header_cancel_popup_full_register}     {value}    ${Header}
    Element Should Be Visible    ${Header_cancel_popup}
    ${Body_cancel_popup}=    Replace String    ${register_txt_body_cancel_popup_full_register}     {value}    ${Body}
    Element Should Be Visible    ${Body_cancel_popup} 

Click Button Confirm Cancel Popup
    ${Click_button}=    Replace String    ${register_btn_cancel_popup_full_register}     {value}    ${Register.Full_register['confirm_cancel_popup']}
    common.Click when ready    ${Click_button}       

Click Confirm
    ${Click_confirm}=    Replace String    ${register_btn_confirm_full_register}     {value}    ${Register.Full_register['btn_confirm']}
    common.Click when ready    ${Click_confirm}
    
