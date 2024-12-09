*** Keywords ***
Click Checkbox Partner Types Legal
    [Arguments]    ${partner_Types}
    ${checkbox_Partner_Types}=    Replace String    ${register_btn_partner_types}    {value}    ${partner_Types}
    common.Click when ready     ${checkbox_Partner_Types}

#################### Legal entity ####################

Select Company Title Name Legal Entity
    [Arguments]    ${title}
    common.Click when ready    ${register_cbo_company_title_name_legal_entity}
    ${selected_company_title_name}=    Replace String    ${register_cbo_choice_title_name}    {value}    ${title}
    Wait Until Keyword Succeeds    5x    2s    common.Click when ready    ${selected_company_title_name}

Input Company Name Legal Entity
    [Arguments]    ${text}  
    common.Input When Ready    ${register_txtbox_company_name_legal_entity}    ${text} 

Input Juristic Identification Number Legal Entity 
    [Arguments]    ${value}  
    common.Input When Ready    ${register_txtbox_juristic_identification_number_legal_entity}     ${value}
    Set Suite Variable    ${JuristicID}    ${value} 

Input Company Address Legal Entity
    [Arguments]    ${value}  
    common.Input When Ready    ${register_txtbox_company_address_legal_entity}    ${value}  

Input Company Address Full Legal Entity
    [Arguments]    ${value}    ${select}
    common.Input When Ready    ${register_cbo_company_address_full_legal_entity}     ${value}  
    ${selected_company_address_full}=    Replace String    ${register_cbo_choice_company_address_full_legal_entity}    {value}    ${select}
    Wait Until Page Contains Element    ${selected_company_address_full}
    FOR    ${i}    IN RANGE    0    5
        ${can_click}=    Run Keyword And Return Status    common.Click Xpath By JavaScript    ${selected_company_address_full}
        Exit For Loop If    ${can_click} == True
    END

Select Title Name Legal Entity
    [Arguments]    ${title}
    common.Click when ready    ${register_cbo_title_name_legal_entity}
    ${selected_title_name}=    Replace String    ${register_cbo_choice_title_name}    {value}    ${title}
    Wait Until Keyword Succeeds    5x    2s    common.Click when ready    ${selected_title_name}

Input First Name Legal Entity
    [Arguments]    ${value}  
    common.Input When Ready    ${register_txtbox_first_name_legal_entity}     ${value}

Input Last Name Legal Entity
    [Arguments]    ${value}  
    common.Input When Ready    ${register_txtbox_last_name_legal_entity}     ${value}  

Input Email Legal Entity
    [Arguments]    ${value}  
    common.Input When Ready    ${register_txtbox_email_legal_entity}     ${value}

Input Mobile No Legal Entity
    [Arguments]    ${value}  
    common.Input When Ready    ${register_txtbox_mobile_no_legal_entity}     ${value}  

Input Mobile Ext Legal Entity
    [Arguments]    ${value}  
    common.Input When Ready    ${register_txtbox_mobile_ext_legal_entity}     ${value}

#################### Individual ####################

Select Title Name Individual
    [Arguments]    ${title}
    common.Click when ready    ${register_cbo_title_name_individual}
    ${selected_title_name}=    Replace String    ${register_cbo_choice_title_name}    {value}    ${title}
    Wait Until Keyword Succeeds    5x    2s    common.Click when ready    ${selected_title_name}

Input First Name Individual
    [Arguments]    ${value}  
    common.Input When Ready    ${register_txtbox_first_name_individual}     ${value}

Input Last Name Individual
    [Arguments]    ${value}  
    common.Input When Ready    ${register_txtbox_last_name_individual}     ${value}

Input National ID Individual
    [Arguments]    ${value}  
    common.Input When Ready    ${register_txtbox_national_id_individual}    ${value}
    Set Suite Variable    ${NationalID}    ${value} 

Input Email Individual
    [Arguments]    ${value}  
    common.Input When Ready    ${register_txtbox_email_individual}     ${value}

Input Address Individual
    [Arguments]    ${value}  
    common.Input When Ready    ${register_txtbox_address_individual}    ${value}  

Input Address Full Individual
    [Arguments]    ${value}    ${select}
    common.Input When Ready    ${register_cbo_address_full_individual}     ${value}  
    ${selected_company_address_full}=    Replace String    ${register_cbo_choice_address_full_individual}    {value}    ${select}
    Wait Until Page Contains Element    ${selected_company_address_full}    timeout=${DEFAULT_TIMEOUT}
    FOR    ${i}    IN RANGE    0    5
        ${can_click}=    Run Keyword And Return Status    common.Click Xpath By JavaScript    ${selected_company_address_full}
        Exit For Loop If    ${can_click} == True
    END

Input Mobile No Individual
    [Arguments]    ${value}  
    common.Input When Ready    ${register_txtbox_mobile_no_individual}     ${value}  

Input Mobile Ext Individual
    [Arguments]    ${value}  
    common.Input When Ready    ${register_txtbox_mobile_ext_individual}     ${value}

#################### both ####################
Click Confirm 
    ${click_confirm}=    Replace String    ${register_btn_confirm}     {value}    ${Register.Pre_register['btn_confirm']}
    common.Click when ready    ${click_confirm}
     
Click Cancel
    ${click_cancel}=    Replace String    ${register_btn_cancel}     {value}    ${Register.Pre_register['btn_cancel']}
    common.Click when ready    ${click_cancel}

Verify Confirm Page
    [Arguments]    ${text}
    ${register_success_text}=    Replace String    ${register_txt_success}     {value}    ${text}
    Wait Until Element Is Visible    ${register_success_text}    timeout=${DEFAULT_TIMEOUT}
    Page Should Contain Element    ${register_success_text}

Verify Cancel Popup
    [Arguments]    ${header}    ${body}
    ${header_cancel_popup}=    Replace String    ${register_txt_header_cancel_popup}     {value}    ${header}
    Element Should Be Visible    ${header_cancel_popup}
    ${body_cancel_popup}=    Replace String    ${register_txt_body_cancel_popup}     {value}    ${body}
    Element Should Be Visible    ${body_cancel_popup}

Click Button Confirm Cancel Popup
    ${click_button}=    Replace String    ${register_btn_cancel_popup}     {value}    ${Register.Pre_register['confirm_cancel_popup']}
    common.Click when ready    ${click_button}

Click Button Cancel Cancel Popup
    ${click_button}=    Replace String    ${register_btn_cancel_popup}     {value}    ${Register.Pre_register['cancel_cancel_popup']}
    common.Click when ready    ${click_button}
