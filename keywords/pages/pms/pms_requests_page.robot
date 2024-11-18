*** Keywords ***
Click Tab Pre-Register
    ${pms_tab_in_request_page}=    Replace String    ${pms_tab_in_request_page}    {value}    ${rm['text_pre_register']}
    common.Click When Ready    ${pms_tab_in_request_page}

Click Tab Full-Register
    ${pms_tab_in_request_page}=    Replace String    ${pms_tab_in_request_page}    {value}    ${rm['text_full_register']}
    common.Click When Ready    ${pms_tab_in_request_page}

Click Tab Company Admin
    ${pms_tab_in_request_page}=    Replace String    ${pms_tab_in_request_page}    {value}    ${rm['text_company_admin']}
    common.Click When Ready    ${pms_tab_in_request_page}

Click Tab Edit Company Information
    ${pms_tab_in_request_page}=    Replace String    ${pms_tab_in_request_page}    {value}    ${rm['text_edit_company_information']}
    common.Click When Ready    ${pms_tab_in_request_page}

Select Pending Tab
    ${pending}=  Replace String   ${pms_subtab_in_request_page}   {value}   ${rm['text_pending']}
    common.Click When Ready    ${pending}
    @{legal_req_list}=    Create List
    Set Suite Variable    @{legal_req_list}
    @{individual_req_list}=    Create List
    Set Suite Variable    @{individual_req_list}
    Sleep    2s

Click Add New Customer
    ${pms_btn_add_new_customer}=    Replace String    ${pms_btn_add_new_customer}    {value}    เพิ่มลูกค้าใหม่
    common.Click When Ready    ${pms_btn_add_new_customer}

Click Assign RM Button
    ${btn_assign_rm}=    Replace String    ${pms_btn_assign_rm_multi_tnx}    {value}    ${rm['text_assign_rm']}
    common.Click When Ready    ${btn_assign_rm}

Verify Assign RM Popup
    ${label_all_rm}=    Replace String    ${pms_txt_all_rm_name}    {value}    ${rm['text_list_of_all_rm']}
    ${title_assign_rm}=    Replace String    ${pms_txt_tile_assign_rm}    {value}    ${rm['text_assign_rm']}
    ${req_number}=    Replace String    ${pms_txt_req_number_popup}    {value}    ${rm['text_selected_list']}
    Wait Until Element Is Visible    ${title_assign_rm}    timeout=${DEFAULT_TIMEOUT}
    Wait Until Element Is Visible    ${label_all_rm}    timeout=${DEFAULT_TIMEOUT}
    Wait Until Element Is Visible    ${pms_txtbox_rm_name}    timeout=${DEFAULT_TIMEOUT}
    FOR    ${i}    IN    @{legal_req_list}
        ${req_num}=    Replace String    ${req_number}    {req}    ${i}
        Wait Until Element Is Visible    ${req_num}    timeout=${DEFAULT_TIMEOUT}
    END
    FOR    ${i}    IN    @{individual_req_list}
        ${req_num}=    Replace String    ${req_number}    {req}    ${i}
        Wait Until Element Is Visible    ${req_num}    timeout=${DEFAULT_TIMEOUT}
    END

Click Button To Assign RM 
    [Arguments]    ${rm_name}
    ${btn_assign_to_rm}=    Replace String    ${pms_btn_to_assign_rm}    {value}    ${rm_name}
    Scroll Element Into View    ${btn_assign_to_rm}
    common.Click When Ready    ${btn_assign_to_rm}

Verify Already Assign To RM Popup
    [Arguments]    ${rm_name}
    ${rm_table}=    Replace String    ${pms_txt_already_assign_to_rm_popup}    {rmname}    ${rm_name}
    FOR    ${i}    IN    @{legal_req_list}
        ${rm_table_complete}=    Replace String    ${rm_table}    {req}    ${i}
        Wait Until Element Is Visible    ${rm_table_complete}    timeout=${DEFAULT_TIMEOUT}
    END
    FOR    ${i}    IN    @{individual_req_list}
        ${rm_table_complete}=    Replace String    ${rm_table}    {req}    ${i}
        Wait Until Element Is Visible    ${rm_table_complete}    timeout=${DEFAULT_TIMEOUT}
    END

Click Save Button
    ${btn_save}=    Replace String    ${pms_btn_save_popup}    {value}    ${rm['text_save']}
    ${title_assign_rm}=    Replace String    ${pms_txt_tile_assign_rm}    {value}    ${rm['text_assign_rm']}
    Scroll Element Into View    ${btn_save}
    Click When Ready    ${btn_save}
    Wait Until Element Is Not Visible    ${title_assign_rm}    timeout=${DEFAULT_TIMEOUT}

Select Request
    [Arguments]    ${partner_types}    ${company_name}    ${contact_first_name}    ${contact_last_name}
    ...    ${mobile_no}    ${mobile_ext}    ${rm_name}    ${status}    ${req_no}
    ${pms_btn_assigned_list_in_request_page}=    Replace String    ${pms_btn_assigned_list_in_request_page}    {req_no}    ${req_no}
    ${pms_btn_assigned_list_in_request_page}=    Replace String    ${pms_btn_assigned_list_in_request_page}    {types}    ${partner_types}
    ${pms_btn_assigned_list_in_request_page}=    Replace String    ${pms_btn_assigned_list_in_request_page}   {company}    ${company_name}
    ${pms_btn_assigned_list_in_request_page}=    Replace String    ${pms_btn_assigned_list_in_request_page}    {name}    ${contact_first_name} ${contact_last_name}
    ${pms_btn_assigned_list_in_request_page}=    Replace String    ${pms_btn_assigned_list_in_request_page}    {tel}    ${mobile_no}
    ${pms_btn_assigned_list_in_request_page}=    Replace String    ${pms_btn_assigned_list_in_request_page}    {ext}    ${mobile_ext}
    ${pms_btn_assigned_list_in_request_page}=    Replace String    ${pms_btn_assigned_list_in_request_page}    {status}    ${status}
    ${pms_btn_assigned_list_in_request_page}=    Replace String    ${pms_btn_assigned_list_in_request_page}    {rm}    ${rm_name}
    Wait Until Element Is Visible    ${pms_btn_assigned_list_in_request_page}    timeout=${DEFAULT_TIMEOUT}
    Scroll Element Into View    ${pms_btn_assigned_list_in_request_page}
    common.Click When Ready    ${pms_btn_assigned_list_in_request_page}
    Wait Until Element Is Visible    ${pms_txtbox_customer_type}    timeout=${DEFAULT_TIMEOUT}

## legal entity
Select Checkbox Request [legal entity]
    [Arguments]    ${partner_types}    ${company_name}    ${first_name}    ${last_name}
    ...    ${mobile_no}    ${mobile_ext}
    ${value}=    Replace String    ${pms_btn_checkbox_request_request_page}    {types}    ${partner_types}
    ${value2}=    Replace String    ${value}    {company}    ${company_name}
    ${value3}=    Replace String    ${value2}    {name}    ${first_name} ${last_name}
    ${value4}=    Replace String    ${value3}    {tel}    ${mobile_no}
    ${value5}=    Replace String    ${value4}    {ext}    ${mobile_ext}
    ${checkbox_list_in_request_page}=    Replace String    ${value5}    {status}    ${rm.text_status['waiting_assign']}
    Wait Until Element Is Visible    ${checkbox_list_in_request_page}${pms_txt_request_num}    timeout=${DEFAULT_TIMEOUT}
    ${request_no}=    Get Text    ${checkbox_list_in_request_page}${pms_txt_request_num}
    Append To List    ${legal_req_list}    ${request_no}
    common.Click When Ready    ${checkbox_list_in_request_page}

Select Request With Waiting For Assign Status [legal entity]
    [Arguments]    ${partner_types}    ${company_name}    ${first_name}    ${last_name}
    ...    ${mobile_no}    ${mobile_ext}
    ${value}=    Replace String    ${pms_btn_list_in_request_page}    {types}    ${partner_types}
    ${value2}=    Replace String    ${value}    {company}    ${company_name}
    ${value3}=    Replace String    ${value2}    {name}    ${first_name} ${last_name}
    ${value4}=    Replace String    ${value3}    {tel}    ${mobile_no}
    ${value5}=    Replace String    ${value4}    {ext}    ${mobile_ext}
    ${btn_list_in_request_page}=    Replace String    ${value5}    {status}    ${rm.text_status['waiting_assign']}
    Wait Until Element Is Visible    ${btn_list_in_request_page}${pms_txt_request_num}    timeout=${DEFAULT_TIMEOUT}
    ${get_request_no}=    Get Text    ${btn_list_in_request_page}${pms_txt_request_num}
    ${get_request_date}=    Get Text    ${btn_list_in_request_page}${pms_txt_request_date}
    Append To List    ${legal_req_list}    ${get_request_no}
    Set Suite Variable    ${get_request_no}
    Set Suite Variable    ${get_request_date}
    common.Click When Ready    ${btn_list_in_request_page}

    ${btn_assign_rm}=    Replace String    ${pms_btn_assign_rm}    {value}    ${rm['text_assign_rm']}
    Wait Until Element Is Visible    ${btn_assign_rm}

Select Request With Considering Status [legal entity]
    [Arguments]    ${partner_types}    ${company_name}    ${contact_first_name}    ${contact_last_name}
    ...    ${mobile_no}    ${mobile_ext}    ${rm_name}
    Select Request    ${partner_types}    ${company_name}    ${contact_first_name}    ${contact_last_name}    ${mobile_no}
    ...    ${mobile_ext}    ${rm_name}    ${rm.text_status['under_consideration']}    ${legal_req_list}[0]

Select Request With Confirm Sent Link Status [legal entity]
    [Arguments]    ${partner_types}    ${company_name}    ${contact_first_name}    ${contact_last_name}
    ...    ${mobile_no}    ${mobile_ext}    ${rm_name}
    Select Request    ${partner_types}    ${company_name}    ${contact_first_name}    ${contact_last_name}    ${mobile_no}
    ...    ${mobile_ext}    ${rm_name}    ${rm.text_status['confirm_link']}    ${legal_req_list}[0]

Select Request With Rejected Status [legal entity]  
    [Arguments]    ${partner_types}    ${company_name}    ${contact_first_name}    ${contact_last_name}
    ...    ${mobile_no}    ${mobile_ext}    ${rm_name}
    Select Request    ${partner_types}    ${company_name}    ${contact_first_name}    ${contact_last_name}    ${mobile_no}
    ...    ${mobile_ext}    ${rm_name}    ${rm.text_status['reject']}    ${legal_req_list}[0]

Verify Save Assign To RM Success [legal entity] 
    [Arguments]    ${partner_types}    ${company_name}    ${contact_first_name}    ${contact_last_name}
    ...    ${mobile_no}    ${mobile_ext}    ${rm_name}
    ${txt_list}=    Replace String    ${pms_txt_assigned_list_in_request_page}    {types}    ${partner_types}
    ${txt_list}=    Replace String    ${txt_list}   {company}    ${company_name}
    ${txt_list}=    Replace String    ${txt_list}    {name}    ${contact_first_name} ${contact_last_name}
    ${txt_list}=    Replace String    ${txt_list}    {tel}    ${mobile_no}
    ${txt_list}=    Replace String    ${txt_list}    {ext}    ${mobile_ext}
    ${txt_list}=    Replace String    ${txt_list}    {status}    ${rm.text_status['under_consideration']}
    ${txt_list}=    Replace String    ${txt_list}    {rm}    ${rm_name}

    Register Keyword To Run On Failure    NOTHING
    ${status}=    Set Variable    FAIL
    ${status_2}=    Set Variable    False

    Scroll Window To Vertical    0
    FOR    ${i}    IN    @{legal_req_list}
        ${txt_list_complete}=    Replace String    ${txt_list}    {request_no}    ${i}
        ${status}    ${element}=    Run Keyword And Ignore Error    Wait Until Element Is Visible    ${txt_list_complete}
        Run Keyword And Ignore Error    Scroll Element Into View    ${txt_list_complete}
        Log    ${txt_list_complete}
        Log To Console    ${element}
        Exit For Loop If    '${status}' == 'Pass'
    END
    Register Keyword To Run On Failure    Capture Page Screenshot

## Individual
Select Checkbox Request [Individual]
    [Arguments]    ${partner_types}    ${first_name}    ${last_name}    ${mobile_no}    ${mobile_ext}
    ${value}=    Replace String    ${pms_btn_checkbox_request_request_page}    {types}    ${partner_types}
    ${value2}=    Replace String    ${value}    {company}    ${first_name} ${last_name}
    ${value3}=    Replace String    ${value2}    {name}    ${first_name} ${last_name}
    ${value4}=    Replace String    ${value3}    {tel}    ${mobile_no}
    ${value5}=    Replace String    ${value4}    {ext}    ${mobile_ext}
    ${checkbox_list_in_request_page}=    Replace String    ${value5}    {status}    ${rm.text_status['waiting_assign']}
    Wait Until Element Is Visible    ${checkbox_list_in_request_page}${pms_txt_request_num}    timeout=${DEFAULT_TIMEOUT}
    ${request_no}=    Get Text    ${checkbox_list_in_request_page}${pms_txt_request_num}
    Append To List    ${individual_req_list}    ${request_no}
    common.Click When Ready    ${checkbox_list_in_request_page}

Select Request With Waiting For Assign Status [Individual]
    [Arguments]    ${partner_types}    ${first_name}    ${last_name}    ${mobile_no}    ${mobile_ext}
    ${value}=    Replace String    ${pms_btn_list_in_request_page}    {types}    ${partner_types}
    ${value2}=    Replace String    ${value}    {company}    ${first_name} ${last_name}
    ${value3}=    Replace String    ${value2}    {name}    ${first_name} ${last_name}
    ${value4}=    Replace String    ${value3}    {tel}    ${mobile_no}
    ${value5}=    Replace String    ${value4}    {ext}    ${mobile_ext}
    ${btn_list_in_request_page}=    Replace String    ${value5}    {status}    ${rm.text_status['waiting_assign']}
    Wait Until Element Is Visible    ${btn_list_in_request_page}${pms_txt_request_num}    timeout=${DEFAULT_TIMEOUT}
    ${get_request_no}=    Get Text    ${btn_list_in_request_page}${pms_txt_request_num}
    ${get_request_date}=    Get Text    ${btn_list_in_request_page}${pms_txt_request_date}
    Append To List    ${individual_req_list}    ${get_request_no}
    Set Suite Variable    ${get_request_no}
    Set Suite Variable    ${get_request_date}
    common.Click When Ready    ${btn_list_in_request_page}

    ${btn_assign_rm}=    Replace String    ${pms_btn_assign_rm}    {value}    ${rm['text_assign_rm']}
    Wait Until Element Is Visible    ${btn_assign_rm}

Select Request With Considering Status [Individual]
    [Arguments]    ${partner_types}    ${contact_first_name}    ${contact_last_name}    ${mobile_no}    ${mobile_ext}    ${rm_name}
    ${company_name}=    Set Variable    ${contact_first_name} ${contact_last_name}
    Select Request    ${partner_types}    ${company_name}    ${contact_first_name}    ${contact_last_name}    ${mobile_no}
    ...    ${mobile_ext}    ${rm_name}    ${rm.text_status['under_consideration']}    ${individual_req_list}[0]

Select Request With Confirm Sent Link Status [Individual]
    [Arguments]    ${partner_types}    ${contact_first_name}    ${contact_last_name}    ${mobile_no}    ${mobile_ext}    ${rm_name}
    ${company_name}=    Set Variable    ${contact_first_name} ${contact_last_name}
    Select Request    ${partner_types}    ${company_name}    ${contact_first_name}    ${contact_last_name}    ${mobile_no}
    ...    ${mobile_ext}    ${rm_name}    ${rm.text_status['confirm_link']}    ${individual_req_list}[0]

Select Request With Rejected Status [Individual]
    [Arguments]    ${partner_types}    ${contact_first_name}    ${contact_last_name}
    ...    ${mobile_no}    ${mobile_ext}    ${rm_name}
    ${company_name}=    Set Variable    ${contact_first_name} ${contact_last_name}
    Select Request    ${partner_types}    ${company_name}    ${contact_first_name}    ${contact_last_name}    ${mobile_no}
    ...    ${mobile_ext}    ${rm_name}    ${rm.text_status['reject']}    ${individual_req_list}[0]

Verify Save Assign To RM Success [Individual]
    [Arguments]    ${partner_types}    ${contact_first_name}    ${contact_last_name}
    ...    ${mobile_no}    ${mobile_ext}    ${rm_name}
    ${txt_list}=    Replace String    ${pms_txt_assigned_list_in_request_page}    {types}    ${partner_types}
    ${txt_list}=    Replace String    ${txt_list}   {company}    ${contact_first_name} ${contact_last_name}
    ${txt_list}=    Replace String    ${txt_list}    {name}    ${contact_first_name} ${contact_last_name}
    ${txt_list}=    Replace String    ${txt_list}    {tel}    ${mobile_no}
    ${txt_list}=    Replace String    ${txt_list}    {ext}    ${mobile_ext}
    ${txt_list}=    Replace String    ${txt_list}    {status}    ${rm.text_status['under_consideration']}
    ${txt_list}=    Replace String    ${txt_list}    {rm}    ${rm_name}
    Register Keyword To Run On Failure    NOTHING
    ${status}=    Set Variable    FAIL
    ${status_2}=    Set Variable    False

    Scroll Window To Vertical    0
    FOR    ${i}    IN    @{legal_req_list}
        ${txt_list_complete}=    Replace String    ${txt_list}    {request_no}    ${i}
        ${status}    ${element}=    Run Keyword And Ignore Error    Wait Until Element Is Visible    ${txt_list_complete}
        Run Keyword And Ignore Error    Scroll Element Into View    ${txt_list_complete}
        Log    ${txt_list_complete}
        Exit For Loop If    '${status}' == 'Pass'
    END
    Register Keyword To Run On Failure    Capture Page Screenshot

#################### Full-Register ####################

###### legal entity ######
Select Request With Waiting For Confirm Status [legal entity]
    [Arguments]    ${partner_types}    ${company_name}    ${first_name}    ${last_name}
    ...    ${mobile_no}    ${mobile_ext}    ${rm_name}
    ${value}=    Replace String    ${pms_btn_list_full_regis_request_page}    {types}    ${partner_types}
    ${value}=    Replace String    ${value}    {company}    ${company_name}
    ${value}=    Replace String    ${value}    {name}    ${first_name} ${last_name}
    ${value}=    Replace String    ${value}    {tel}    ${mobile_no}
    ${value}=    Replace String    ${value}    {ext}    ${mobile_ext}
    ${value}=    Replace String    ${value}    {rm}    ${rm_name}
    ${btn_list_in_request_page}=    Replace String    ${value}    {status}    ${rm.text_status['waiting_confirm']}
    Wait Until Element Is Visible    ${btn_list_in_request_page}${pms_txt_request_num_full_regis}    timeout=${DEFAULT_TIMEOUT}
    ${req_no_full_regis}=    Get Text    ${btn_list_in_request_page}${pms_txt_request_num_full_regis}
    ${req_date_full_regis}=    Get Text    ${btn_list_in_request_page}${pms_txt_request_date_full_regis}
    Set Suite Variable    ${req_no_full_regis}
    Set Suite Variable    ${req_date_full_regis}
    common.Click When Ready    ${btn_list_in_request_page}
