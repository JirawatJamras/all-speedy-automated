*** Keywords ***
Verify Reqeust Detail Page
    ${pms_txt_request_detail_header}=    Replace String    ${pms_txt_request_detail_header}    {value}    ${rm['text_request_detail']}
    Wait Until Element Is Visible    ${pms_txt_request_detail_header}    timeout=${DEFAULT_TIMEOUT}
    ${company_title_name}=    Get Text    ${pms_txt_company_titile_name}
    ${company_name}=    Get Text    ${pms_txt_company_name}
    ${company_id_number}=    Get Text    ${pms_txt_company_id_number}
    ${address}=    Get Text    ${pms_txt_address}
    {address}=    Get Text    ${pms_txt_address}

Input Mobile Number In Sale Information
    [Arguments]    ${value}
    ${pms_txt_sale_information}=    Replace String    ${pms_txt_sale_information}    {value}    ${rm['text_sale_information']}
    Scroll Into View By Xpath      ${pms_txt_sale_information}    true
    Input When Ready    ${pms_txtbox_sale_phone}    ${value}

Click Approve Button
    ${pms_btn_approve}=    Replace String    ${pms_btn_approve}    {value}    ${rm['text_approve']}
    Click When Ready    ${pms_btn_approve}