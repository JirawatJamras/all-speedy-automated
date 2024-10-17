*** Keywords ***
Select New Request With Considering Status
    [Arguments]    ${partner_type}    ${customer_name}
    //div[text()='กำลังพิจารณา']/../..//div[contains(@class,'ant-row ant-row-center')]//img

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

Select Request With Status Waiting For Assign
    [Arguments]    ${partner_types}    ${company_name}    ${first_name}    ${last_name}
    ...    ${mobile_no}    ${mobile_ext}    ${status}
    ${value}=    Replace String    ${pms_btn_list_in_request_page}    {types}    ${partner_types}
    ${value2}=    Replace String    ${value}    {company}    ${company_name}
    ${value3}=    Replace String    ${value2}    {name}    ${first_name} ${last_name}
    ${value4}=    Replace String    ${value3}    {tel}    ${mobile_no}
    ${value5}=    Replace String    ${value4}    {ext}    ${mobile_ext}
    ${value6}=    Replace String    ${value5}    {status}    ${status}
    common.Click When Ready    ${value6}

