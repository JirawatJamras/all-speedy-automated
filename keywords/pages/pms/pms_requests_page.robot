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


