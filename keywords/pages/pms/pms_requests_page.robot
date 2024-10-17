*** Keywords ***
Select New Request With Considering Status
    [Arguments]    ${partner_type}    ${customer_name}

Click Tab Pre-Register
    ${pms_tab_pre_register_request_page}=    Replace String    ${pms_tab_pre_register_request_page}    {value}    ${rm['text_pre_register']}
    common.Click When Ready    ${pms_tab_pre_register_request_page}
