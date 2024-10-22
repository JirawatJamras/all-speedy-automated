*** Keywords ***
Click Next Page Button
    ${btn_next_page}=    Replace String    ${pms_btn_next_page}    {value}    ${rm['text_next_page']}
    Scroll Element Into View    ${btn_next_page}
    common.Click When Ready    ${btn_next_page}

Click Dry Parcel Tab
    Scroll Window To Vertical    0
    common.Click When Ready    ${pms_tab_dry_parcel}

Click Chill Parcel Tab
    Scroll Window To Vertical    0
    common.Click When Ready    ${pms_tab_chill_parcel}

Click Return Business Tab
    Scroll Window To Vertical    0
    common.Click When Ready    ${pms_tab_return_business}

########## legal entity  ###########
Verify Full Register Detail Page With Waiting For Confirm Status [legal entity]
    [Arguments]    ${firstname}    ${lastname}    ${req_type}
    ${title}=    Replace String    ${pms_txt_title_detail}    {value}    ${rm['text_request_detail']}
    Wait Until Element Is Visible    ${title}   timeout=${DEFAULT_TIMEOUT}
    Wait Until Element Is Visible    ${pms_txtbox_customer_type_full_regis}   timeout=${DEFAULT_TIMEOUT}

    #### part 1 ####
    ${label_req_no}=    Replace String    ${pms_txt_detail_full_regis}    {value}    ${rm['text_request_number']}
    ${label_contact_name}=    Replace String    ${pms_txt_detail_full_regis}    {value}    ${rm['text_contact_name']}
    ${label_req_date}=    Replace String    ${pms_txt_detail_full_regis}    {value}    ${rm['text_request_date']}
    ${label_req_type}=    Replace String    ${pms_txt_detail_full_regis}    {value}    ${rm['text_request_type']}
    ${label_req_ref}=    Replace String    ${pms_txt_detail_full_regis}    {value}    ${rm['text_reference_request']}

    ${label_req_no}=    Get Text    ${label_req_no}
    ${label_contact_name}=    Get Text    ${label_contact_name}
    ${label_req_date}=    Get Text    ${label_req_date}
    ${label_req_type}=    Get Text    ${label_req_type}
    ${label_req_ref}=    Get Text    ${label_req_ref}

    Should Be Equal As Strings    ${label_req_no}    ${rm['text_request_number']} ${req_no_full_regis}
    Should Be Equal As Strings    ${label_contact_name}    ${rm['text_contact_name']} ${firstname} ${lastname}
    Should Be Equal As Strings    ${label_req_date}   ${rm['text_request_date']} ${req_date_full_regis}
    Should Be Equal As Strings    ${label_req_type}    ${rm['text_request_type']}${req_type}
    # Should Be Equal As Strings    ${label_req_ref}   ${rm['text_reference_request']} ${get_request_no}
