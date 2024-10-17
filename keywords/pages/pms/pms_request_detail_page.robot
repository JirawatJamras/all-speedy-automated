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

Verify Request Detail Page With Status Waiting For Assign
    [Arguments]    ${first_name}    ${last_name}    ${request_type}    ${reference_request}    ${partner_types}    ${company_title}
    ...    ${company_name}    ${company_address}    ${address_full}    ${title_name}    ${customer_firstname}    ${customer_lastname}
    ...    ${email}

    ${title}=    Replace String    ${pms_txt_request_detail_header}    {value}    ${rm['text_request_detail']} 
    ${text_list_in_detail_page}=    Replace String    ${pms_txt_in_request_detail_page}    {value}    ${rm['text_request_number']} 
    Sleep    2s
    ${actual_text_list}=    Get Text    ${text_list_in_detail_page}
    ${actual_text_list}=    Replace String    ${actual_text_list}    \n    ${SPACE}
    Wait Until Element Is Visible    ${title}    timeout=${DEFAULT_TIMEOUT}
    Should Be Equal As Strings    ${actual_text_list}
    ...    ${rm['text_request_number']} ${get_request_no} ${rm['text_contact_name']} ${first_name} ${last_name} ${rm['text_request_date']} ${get_request_date} ${rm['text_request_type']} ${request_type} ${rm['text_reference_request']} ${reference_request} ${rm['text_rm']}

    ${label_customer_type}=    Get Text    ${pms_txt_customer_type}
    ${input_customer_type}=    Get Value    ${pms_txtbox_customer_type}
    ${label_company_titile}=    Get Text    ${pms_txt_company_titile_name}
    ${input_company_titile}=    Get Value    ${pms_txtbox_company_title_name}
    ${label_company_name}=    Get Text    ${pms_txt_company_name}
    ${input_company_name}=    Get Value    ${pms_txtbox_company_name}
    ${label_company_id_number}=    Get Text    ${pms_txt_company_id_number}
    ${input_company_id_number}=    Get Value    ${pms_txtbox_id_number}
    ${label_mobile_company}=    Get Text    ${pms_txt_mobile_company}
    ${input_mobile_company}=    Get Value    ${pms_txtbox_mobile_company}
    ${label_mobile_company_ext}=    Get Text    ${pms_txt_mobile_company_ext}
    ${input_mobile_company_ext}=    Get Value    ${pms_txtbox_mobile_company_ext}
    ${label_address}=    Get Text    ${pms_txt_address}
    ${input_address}=    Get Element Attribute    ${pms_txtbox_address}    placeholder
    ${label_address_full}=    Get Text    ${pms_txt_postcode}
    ${input_address_full}=    Get Element Attribute    ${pms_txtbox_postcode}    placeholder
    ${label_title_name}=    Get Text    ${pms_txt_title_name}
    ${input_title_name}=    Get Text    ${pms_txtbox_title_name}
    ${label_customer_first_name}=    Get Text    ${pms_txt_customer_first_name}
    ${input_customer_first_name}=    Get Element Attribute    ${pms_txtbox_first_name}    placeholder
    ${label_customer_last_name}=    Get Text    ${pms_txt_customer_last_name}
    ${input_customer_last_name}=    Get Element Attribute    ${pms_txtbox_last_name}    placeholder
    ${label_email}=    Get Text    ${pms_txt_customer_email}
    ${input_email}=    Get Value    ${pms_txtbox_customer_email}

    
    Should Be Equal As Strings    ${label_customer_type} ${input_customer_type}    ประเภทนิติบุคคลหรือบุคคลธรรมดา ${partner_types}
    Should Be Equal As Strings    ${label_company_titile} ${input_company_titile}    คำนำหน้าประเภทจดทะเบียนบริษัท ${company_title}
    Should Be Equal As Strings    ${label_company_name} ${input_company_name}    ชื่อบริษัท ${company_name}
    # Should Be Equal As Strings    ${label_company_id_number} ${input_company_id_number}    เลขประจำตัวผู้เสียภาษี ${JuristicID}
    Should Be Equal As Strings    ${label_mobile_company} ${input_mobile_company}    เบอร์โทรศัพท์ ${EMPTY}
    Should Be Equal As Strings    ${label_mobile_company_ext} ${input_mobile_company_ext}    '#ต่อ' ${EMPTY}
    Should Be Equal As Strings    ${label_address} ${input_address}    ที่อยู่บริษัท ${company_address}
    Should Be Equal As Strings    ${label_address_full} ${input_address_full}    ตำบล/อำเภอ/จังหวัด/รหัสไปรษณีย์ ${address_full}
    Should Be Equal As Strings    ${label_title_name} ${input_title_name}    คำนำหน้าชื่อ ${title_name}
    Should Be Equal As Strings    ${label_customer_first_name} ${input_customer_first_name}    ชื่อ (ผู้ติดต่อ) ${customer_firstname}
    Should Be Equal As Strings    ${label_customer_last_name} ${input_customer_last_name}    นามสกุล ${customer_lastname}
    Should Be Equal As Strings    ${label_email} ${input_email}    E-mail ${email}

