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
    ${pending}=  Replace String   ${pms_tab_in_request_page}   {value}   ${rm['text_pending']}
    common.Click When Ready    ${pending}
    Sleep    2s

Click Add New Customer
    ${pms_btn_add_new_customer}=    Replace String    ${pms_btn_add_new_customer}    {value}    เพิ่มลูกค้าใหม่
    common.Click When Ready    ${pms_btn_add_new_customer}

Select Request
    [Arguments]    ${partner_types}    ${company_name}    ${contact_first_name}    ${contact_last_name}
    ...    ${mobile_no}    ${mobile_ext}    ${rm_name}    ${status}
    ${pms_btn_assigned_list_in_request_page}=    Replace String    ${pms_btn_assigned_list_in_request_page}    {req_no}    ${get_request_no}
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
Select Request With Status Waiting For Assign [legal entity]
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
    Set Suite Variable    ${get_request_no}
    Set Suite Variable    ${get_request_date}
    common.Click When Ready    ${btn_list_in_request_page}

    ${btn_assign_rm}=    Replace String    ${pms_btn_assign_rm}    {value}    ${rm['text_assign_rm']}
    Wait Until Element Is Visible    ${btn_assign_rm}

Select Request With Considering Status [legal entity]
    [Arguments]    ${partner_types}    ${company_name}    ${contact_first_name}    ${contact_last_name}
    ...    ${mobile_no}    ${mobile_ext}    ${rm_name}
    Select Request    ${partner_types}    ${company_name}    ${contact_first_name}    ${contact_last_name}    ${mobile_no}
    ...    ${mobile_ext}    ${rm_name}    ${rm.text_status['under_consideration']}

Select Request With Confirm Sent Link Status [legal entity]
    [Arguments]    ${partner_types}    ${company_name}    ${contact_first_name}    ${contact_last_name}
    ...    ${mobile_no}    ${mobile_ext}    ${rm_name}
    Select Request    ${partner_types}    ${company_name}    ${contact_first_name}    ${contact_last_name}    ${mobile_no}
    ...    ${mobile_ext}    ${rm_name}    ${rm.text_status['confirm_link']}

Select Request With Rejected Status [legal entity]  
    [Arguments]    ${partner_types}    ${company_name}    ${contact_first_name}    ${contact_last_name}
    ...    ${mobile_no}    ${mobile_ext}    ${rm_name}
    Select Request    ${partner_types}    ${company_name}    ${contact_first_name}    ${contact_last_name}    ${mobile_no}
    ...    ${mobile_ext}    ${rm_name}    ${rm.text_status['reject']}

Verify Save Assign To RM Success
    [Arguments]    ${partner_types}    ${company_name}    ${contact_first_name}    ${contact_last_name}
    ...    ${mobile_no}    ${mobile_ext}    ${rm_name}
    ${txt_list}=    Replace String    ${pms_txt_assigned_list_in_request_page}    {request_no}    ${get_request_no}
    ${txt_list}=    Replace String    ${txt_list}    {types}    ${partner_types}
    ${txt_list}=    Replace String    ${txt_list}   {company}    ${company_name}
    ${txt_list}=    Replace String    ${txt_list}    {name}    ${contact_first_name} ${contact_last_name}
    ${txt_list}=    Replace String    ${txt_list}    {tel}    ${mobile_no}
    ${txt_list}=    Replace String    ${txt_list}    {ext}    ${mobile_ext}
    ${txt_list}=    Replace String    ${txt_list}    {status}    ${rm.text_status['under_consideration']}
    ${txt_list}=    Replace String    ${txt_list}    {rm}    ${rm_name}
    Wait Until Page Contains Element    ${txt_list}        timeout=${DEFAULT_TIMEOUT}
    Scroll Element Into View    ${txt_list}

## Individual
Select Request With Status Waiting For Assign [Individual]
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
    Set Suite Variable    ${get_request_no}
    Set Suite Variable    ${get_request_date}
    common.Click When Ready    ${btn_list_in_request_page}

    ${btn_assign_rm}=    Replace String    ${pms_btn_assign_rm}    {value}    ${rm['text_assign_rm']}
    Wait Until Element Is Visible    ${btn_assign_rm}

Select Request With Considering Status [Individual]
    [Arguments]    ${partner_types}    ${contact_first_name}    ${contact_last_name}    ${mobile_no}    ${mobile_ext}    ${rm_name}
    ${company_name}=    Set Variable    ${contact_first_name} ${contact_last_name}
    Select Request    ${partner_types}    ${company_name}    ${contact_first_name}    ${contact_last_name}    ${mobile_no}
    ...    ${mobile_ext}    ${rm_name}    ${rm.text_status['under_consideration']}

Select Request With Confirm Sent Link Status [Individual]
    [Arguments]    ${partner_types}    ${contact_first_name}    ${contact_last_name}    ${mobile_no}    ${mobile_ext}    ${rm_name}
    ${company_name}=    Set Variable    ${contact_first_name} ${contact_last_name}
    Select Request    ${partner_types}    ${company_name}    ${contact_first_name}    ${contact_last_name}    ${mobile_no}
    ...    ${mobile_ext}    ${rm_name}    ${rm.text_status['confirm_link']}