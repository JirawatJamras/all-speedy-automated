*** Keywords ***
Verify Booking Page 
    [Arguments]    ${txt_title}
    Wait Until Element Is Visible    ${b2c_btn_add}    timeout=30s
    ${title}=    Get Text    ${txt_title_booking}    
    Should Be Equal    ${title}    ${txt_title}

Click Button To Add
    sleep    4s
    Wait Until Element Is Visible    ${b2c_btn_add}    timeout=30s
    Click Element        ${b2c_btn_add}

Verify Term & Condition 
    [Arguments]    ${txt_term_and_condition}    ${text_accept}
    Wait Until Element Is Visible    ${btn_accept_terms_service}    timeout=30s
    ${text}=    Get Text    ${txt_term_and_condition}
    Should Be Equal    ${text}    ${text_accept}

# Close Term & Condition Popup
#     Wait Until Element Is Visible    ${close_condition_popup}    timeout=10s
#     Click Element        ${close_condition_popup}

Click Accept Terms of Service
    Wait Until Element Is Visible    ${btn_accept_terms_service}    timeout=30s
    Click Element        ${btn_accept_terms_service}

Verify Select Parcel Type
    Wait Until Element Is Enabled   ${btn_parcel_type_dry}    timeout=30s
    Element Should Be Visible    ${btn_parcel_type_dry}
    Element Should Be Visible    ${btn_parcel_type_chill}

Select Parcel Type  
    [Arguments]    ${parcel_type}
    IF         '${parcel_type}' == 'พัสดุทั่วไป'
        Click General Parcel
    ELSE IF    '${parcel_type}' == 'พัสดุควบคุมอุณหภมิ'
        Click Temperature Controlled Parcel
    END

Click General Parcel
    Wait Until Element Is Visible    ${parcel_type_dry_btn}   timeout=30s
    Click Element    ${parcel_type_dry_btn}
    Wait Until Element Is Visible    ${close_noti_btn}   timeout=30s

Click Temperature Controlled Parcel
    Wait Until Element Is Visible    ${parcel_type_chill_btn}   timeout=30s
    Click Element    ${parcel_type_chill_btn}
    
# Verify Close Pop-Up
#     Wait Until Element Is Visible    ${close_noti_txt}    timeout=30s
#     ${button_text}=    Get Text    ${close_noti_txt}
#     Should Be Equal    ${button_text}    ${AllSpeedy_B2C_005_ID_1['closepopun_noti']}

# Verify Create Parcel Page Sender Step
#     Wait Until Element Is Visible    ${title_create_parcel_page_txt}    timeout=30s
#     Wait Until Element Is Not Visible    ${status_active_sender}    timeout=30s
#     ${title_text}=    Get Text    ${txt_title_create_parcel_page}
#     Should Be Equal    ${title_text}    ${Booking_002['text_title']}
#     ${text_phone}=    Get Text    ${txt_phone_sender}
#     Should Be Equal    ${text_phone}    ${Booking_002['text_phone_sender']}
#     ${text_name}=    Get Text    ${txt_name_sender}
#     Should Be Equal    ${text_name}    ${Booking_002['text_name_sender']}
#     ${text_address}=    Get Text    ${txt_address_sender}
#     Should Be Equal    ${text_address}    ${Booking_002['text_address_sender']}
#     ${text_postcode}=    Get Text    ${txt_postcode_sender}
#     Should Be Equal    ${text_postcode}    ${Booking_002['text_postcode_sender']}


# Verify Create Parcel Page Receiver Step
#     Wait Until Element Is Visible    ${title_create_parcel_page_txt}    timeout=30s
#     Wait Until Element Is Not Visible    ${status_active_receiver}    timeout=30s
#     ${title_text}=    Get Text    ${txt_title_create_parcel_page}
#     Should Be Equal    ${title_text}    ${Booking_002['text_title']}
#     ${text_phone}=    Get Text    ${txt_phone_receiver}
#     Should Be Equal    ${text_phone}    ${Booking_002['text_phone_receiver']}
#     ${text_name}=    Get Text    ${txt_name_receiver}
#     Should Be Equal    ${text_name}    ${Booking_002['text_name_receiver']}
#     ${text_name}=    Get Text    ${txt_location_receiver}
#     Should Be Equal    ${text_name}    ${Booking_002['text_location_receiver']}
#     ${text_address}=    Get Text    ${txt_address_receiver}
#     Should Be Equal    ${text_address}    ${Booking_002['text_address_receiver']}
#     ${text_postcode}=    Get Text    ${txt_postcode_receiver}
#     Should Be Equal    ${text_postcode}    ${Booking_002['text_postcode_receiver']}


Verify Create Parcel Page Sender Step
    [Arguments]    ${title}    ${parcel_sender_information}    ${phone_sender}    ${name_sender}    ${address_sender}    ${postcode_sender}  
    Wait Until Element Is Visible    ${title_create_parcel_page_txt}    timeout=30s
    Wait Until Element Is Not Visible    ${status_active_sender}    timeout=30s
    ${actual_text_title}=    Get Text    ${txt_title_create_parcel_page}
    Should Be Equal    ${actual_text_title}    ${title}
    ${actual_text_parcel_sender_information}=    Get Text    ${txt_parcel_sender_information}
    Should Be Equal    ${actual_text_parcel_sender_information}    ${parcel_sender_information}
    ${actual_text_phone}=    Get Text    ${txt_phone_sender}
    Should Be Equal    ${actual_text_phone}    ${phone_sender}
    ${actual_text_name_sender}=    Get Text    ${txt_name_sender}
    Should Be Equal    ${actual_text_name_sender}    ${name_sender}
    ${actual_text_address}=    Get Text    ${txt_address_sender}
    Should Be Equal    ${actual_text_address}    ${address_sender}
    ${actual_text_postcode}=    Get Text    ${txt_postcode_sender}
    Should Be Equal    ${actual_text_postcode}    ${postcode_sender}

Verify Draft Paecel Sender
    [Arguments]   ${phone_sender}    ${name_sender}    ${address_sender}    ${full_postcode_sender}  
    Wait Until Element Is Visible    ${title_create_parcel_page_txt}    timeout=30s
    ${actual_text_phone_sender}=    Get Value    ${txtbox_phone_sender}
    Should Be Equal    ${actual_text_phone_sender}    ${phone_sender}
    ${actual_text_name_sender}=    Get Value    ${txtbox_name_sender}
    Should Be Equal    ${actual_text_name_sender}    ${name_sender}
    ${actual_text_address_sender}=    Get Value    ${txtbox_address_sender}
    Should Be Equal    ${actual_text_address_sender}    ${address_sender}
    ${actual_text_full_postcode_sender}=    Get Text    ${txtbox_full_postcode_sender}
    Should Be Equal    ${actual_text_full_postcode_sender}    ${full_postcode_sender}

Verify Draft Paecel Receiver
    [Arguments]   ${phone_receiver}    ${name_receiver}    ${address_receiver}    ${full_postcode_receiver}  
    Wait Until Element Is Visible    ${title_create_parcel_page_txt}    timeout=30s
    ${actual_text_phone_receiver}=    Get Value    ${txtbox_phone_receiver}
    Should Be Equal    ${actual_text_phone_receiver}    ${phone_receiver}
    ${actual_text_name_receiver}=    Get Value    ${txtbox_name_receiver}
    Should Be Equal    ${actual_text_name_receiver}    ${name_receiver}
    ${actual_text_address_receiver}=    Get Value    ${txtbox_address_receiver}
    Should Be Equal    ${actual_text_address_receiver}    ${address_receiver}
    ${actual_text_full_postcode_receiver}=    Get Text    ${txtbox_full_postcode_receiver}
    Should Be Equal    ${actual_text_full_postcode_receiver}    ${full_postcode_receiver}


Verify Create Parcel Page Receiver Step
    [Arguments]    ${title}    ${parcel_receiver_information}   ${phone_receiver}    ${name_receiver}    ${location_receiver}    ${address_receiver}    ${postcode_receiver}
    Wait Until Element Is Visible    ${title_create_parcel_page_txt}    timeout=30s
    Wait Until Element Is Not Visible    ${status_active_receiver}    timeout=30s
    ${actual_text_title}=    Get Text    ${txt_title_create_parcel_page}
    Should Be Equal    ${actual_text_title}    ${title}
    ${actual_text_parcel_receiver_information}=    Get Text    ${txt_parcel_receiver_information}
    Should Be Equal    ${actual_text_parcel_receiver_information}    ${parcel_receiver_information}
    ${actual_text_phone}=    Get Text    ${txt_phone_receiver}
    Should Be Equal    ${actual_text_phone}    ${phone_receiver}
    ${actual_text_name}=    Get Text    ${txt_name_receiver}
    Should Be Equal    ${actual_text_name}    ${name_receiver}
    ${actual_text_name}=    Get Text    ${txt_location_receiver}
    Should Be Equal    ${actual_text_name}    ${location_receiver}
    ${actual_text_address}=    Get Text    ${txt_address_receiver}
    Should Be Equal    ${actual_text_address}    ${address_receiver}
    ${actual_text_postcode}=    Get Text    ${txt_postcode_receiver}
    Should Be Equal    ${actual_text_postcode}    ${postcode_receiver}

Click Close Paecel Page
    Click Element    ${close_noti_btn}
    # Verify Close Pop-Up
    Click Element    ${close_noticonfirm_btn}

Click Choose Favorites
    Wait Until Element Is Visible    ${choose_favorites_btn}    timeout=30s
    Click Element    ${choose_favorites_btn}
    Wait Until Element Is Visible    ${favorites_defult_text}    timeout=30s
    ${title_text}=    Get Text    ${favorites_defult_text}
    Should Be Equal    ${title_text}    ${B2C_AddBooking_003_002['favorites_default_text']}

Click Favorites Defult
    Wait Until Element Is Visible    ${select_favorites_btn}    timeout=30s
    Click Element    ${select_favorites_btn}


Input Special Letters
    [Arguments]    ${search_txt}
    Wait Until Element Is Visible    ${search_favorites_txtbox}    timeout=10s
    Input Text    ${search_favorites_txtbox}    ${search_txt}

Clear Search Favorites TextBox
    Wait Until Element Is Visible    ${search_favorites_txtbox}    timeout=10s
    Click Element    ${search_favorites_txtbox}
    Clear Element Text    ${search_favorites_txtbox}

Input Text Exceeds 100 Characters
    [Arguments]    ${search_txt}
    Wait Until Element Is Visible    ${search_favorites_txtbox}    timeout=10s
    Clear Element Text    ${search_favorites_txtbox}
    Input Text    ${search_favorites_txtbox}    ${search_txt}

Verify Popup Favorites Sender 
    Wait Until Element Is Visible    ${favorites_accetp_btn}    timeout=30s
    ${title_text}=    Get Text    ${favorites_title_text}
    Should Be Equal    ${title_text}    ${B2C_AddBooking_003_002['favorites_title_text']}
    ${default_text}=    Get Text    ${favorites_default_text}
    Should Be Equal    ${default_text}    ${B2C_AddBooking_003_002['favorites_default_text']}

Input Favorites TextBox Nomal Letters Less Than 100 Characters
    [Arguments]    ${search_txt}
    Wait Until Element Is Visible    ${search_favorites_txtbox}    timeout=10s
    Input Text    ${search_favorites_txtbox}    ${search_txt}

Verify Favorites Text In TextBox
    [Arguments]    ${search_txt}
    ${text}=    Get Value    ${search_favorites_txtbox}
    Should Be Equal    ${text}    ${search_txt}   

Verify Favorites Show Item Lists   
    Page Should Not Contain     ${B2C_AddBooking_003_003['text_no_data']}

Verify Favorites Not Show Item Lists   
    Page Should Contain     ${B2C_AddBooking_003_004['text_no_data']}

Input Favorites TextBox Nomal Letters More Than 100 Characters
    [Arguments]    ${search_txt}
    Wait Until Element Is Visible    ${search_favorites_txtbox}    timeout=10s
    Input Text    ${search_favorites_txtbox}    ${search_txt}

Click Favorites Defult List
    Wait Until Element Is Visible    ${choose_default_favorites_btn}    timeout=30s
    Click Element    ${choose_default_favorites_btn}

Click Accept Favorites List
    Click Element    ${accept_favorites_btn}

Click Cancel Favorites List
    Click Element    ${cancel_favorites_btn}

Verify Choose From Favorites
    Wait Until Element Is Visible    ${choose_favorites_btn}    timeout=30s
    ${phone_text}=    Get Value    ${phone_sender_txtbox}
    Should Be Equal    ${phone_text}    ${b2c_addbooking_003_ID_5['verify_phone_sender']}    
    ${name_text}=    Get Value    ${name_sender_txtbox}
    Should Be Equal   ${name_text}    ${b2c_addbooking_003_ID_5['verify_name_sender']}
    ${address_text}=    Get Value    ${address_sender_txtbox}
    Should Be Equal    ${address_text}    ${b2c_addbooking_003_ID_5['verify_address_sender']}
    ${postcode_text}=    Get Text    ${postcode_sender_text_in_txtbox}
    Should Be Equal    ${postcode_text}    ${b2c_addbooking_003_ID_5['verify_postcode_sender']}

Verify Not Choose From Favorites
    Wait Until Element Is Visible    ${choose_favorites_btn}    timeout=30s
    ${phone_text}=    Get Value    ${phone_sender_txtbox}
    Should Not Be Equal    ${phone_text}    ${b2c_addbooking_003_ID_6['verify_phone_sender']}    
    ${name_text}=    Get Value    ${name_sender_txtbox}
    Should Not Be Equal   ${name_text}    ${b2c_addbooking_003_ID_6['verify_name_sender']}
    ${address_text}=    Get Value    ${address_sender_txtbox}
    Should Not Be Equal    ${address_text}    ${b2c_addbooking_003_ID_6['verify_address_sender']}
    ${postcode_text}=    Get Text    ${postcode_sender_txtbox}
    Should Not Be Equal    ${postcode_text}    ${b2c_addbooking_003_ID_6['verify_postcode_sender']}

Input Phone Sender
    [Arguments]    ${input_phone_sender}
    Wait Until Element Is Visible    ${txtbox_phone_sender}    timeout=10s
    Input Text    ${txtbox_phone_sender}    ${input_phone_sender}

Verify Phone Sender Value
    [Arguments]    ${verify_phone_sender_value}
    Wait Until Element Is Visible    ${txtbox_phone_sender}    timeout=10s
    ${phone_sender_txt}=    Get Value    ${txtbox_phone_sender}
    Should Be Equal    ${phone_sender_txt}    ${verify_phone_sender_value}  

Verify Phone Sender Error Msg
    [Arguments]    ${text_error_msg_phone_sender}
    Wait Until Element Is Visible    ${phone_sender_txtbox}    timeout=10s
    ${phone_sender_error_msg}=    Get Text    ${phone_sender_txtbox}
    Should Be Equal    ${phone_sender_error_msg}    ${text_error_msg_phone_sender}

Input Name Sender
    [Arguments]    ${input_name_sender}
    Wait Until Element Is Visible    ${txtbox_name_sender}    timeout=10s
    Input Text    ${txtbox_name_sender}    ${input_name_sender}

Verify Name Sender Value
    [Arguments]    ${verify_name_sender_value}
    Wait Until Element Is Visible    ${txtbox_name_sender}    timeout=10s
    ${name_sender_txt}=    Get Value    ${txtbox_name_sender}
    Should Be Equal    ${name_sender_txt}    ${verify_name_sender_value} 

Verify Name Sender Error Msg
    [Arguments]    ${text_error_msg_name_sender}
    Wait Until Element Is Visible    ${name_sender_txtbox}    timeout=10s
    ${name_sender_error_msg}=    Get Text    ${name_sender_error_txt}
    Should Be Equal    ${name_sender_error_msg}    ${text_error_msg_name_sender}

Input Address Sender
    [Arguments]    ${input_address_sender}
    common.Input When Ready    ${txtbox_address_sender}    ${input_address_sender}

Verify Address Sender Value
    [Arguments]    ${verify_address_sender_value}
    Wait Until Element Is Visible    ${txtbox_address_sender}    timeout=10s
    ${address_sender_txt}=    Get Value    ${txtbox_address_sender}
    Should Be Equal    ${address_sender_txt}    ${verify_address_sender_value} 

Verify Address Sender Error Msg
    [Arguments]    ${text_error_msg_address_sender}
    Wait Until Element Is Visible    ${address_sender_txtbox}    timeout=10s
    ${address_sender_error_msg}=    Get Text    ${address_sender_error_txt}
    Should Be Equal    ${address_sender_error_msg}    ${text_error_msg_address_sender}

Input Postcode Sender
    [Arguments]    ${input_postcode_sender}
    common.Input When Ready    ${txtbox_postcode_sender}    ${input_postcode_sender}

Verify Postcode Sender Value
    [Arguments]    ${xpath}
    ${value}=    Get Value    ${xpath}
    Should Be Equal    ${postcode_sender_txt}    ${verify_postcode_sender_value} 

Verify Not Select Postcode Sender Value
    ${postcode_sender_txt}=    Get Text    ${postcode_sender_not_select_text_in_txtbox}
    Should Be Empty    ${postcode_sender_txt}

Verify Select Postcode Sender Value
    [Arguments]    ${name}
    ${list}=    Replace String    ${cbo_postcode_sender}    {value}    ${name}
    ${postcode_sender_txt}=    Get Text    ${txtbox_postcode_sender}
    Should Be Equal    ${postcode_sender_txt}    ${verify_postcode_sender_value} 

Click Postcode Sender Lists
    [Arguments]    ${name}
    ${list}=    Replace String    ${cbo_postcode_sender}    {value}    ${name}
    Click Element    ${list}

Verify Postcode Sender Error Msg
    [Arguments]    ${text_error_msg_postcode_sender}
    Wait Until Element Is Visible    ${postcode_sender_txtbox}    timeout=10s
    ${postcode_sender_error_msg}=    Get Text    ${postcode_sender_error_txt}
    Should Be Equal    ${postcode_sender_error_msg}    ${text_error_msg_postcode_sender}

Click Button
    [Arguments]    ${btn}
    Click Element    ${btn}

Click Next To Receiver
    common.Click When Ready  ${next_to_receiver_btn}

Click Add To Favorites
    [Arguments]    ${btn}
    Click Element    ${btn}

Verify Favorites Icon Red Heart
    [Arguments]    ${xpath}    ${status}
    ${value}=    Get Value    ${xpath}
    Should Be Equal    ${value}    ${status}   

Verify Add To Favorites
    [Arguments]    ${text_search}
    Click Choose Favorites
    Input Favorites TextBox Nomal Letters Less Than 100 Characters    ${text_search}
    Verify Favorites Show Item Lists

Verify Step In Create Parcel Popup
    [Arguments]    ${title}    ${status}
    ${title_text}=    Get Text    ${title_create_parcel_page_txt}
    Should Be Equal    ${title_text}    ${title}
    Page Should Contain Element    ${status}    

Input Receiver 
    [Arguments]    ${xpath}    ${value}
    common.Input When Ready    ${xpath}    ${value}

Input Phone Receiver
    [Arguments]    ${input_phone_receiver}
    common.Input When Ready    ${txtbox_phone_receiver}    ${input_phone_receiver}

Input Name Receiver
    [Arguments]    ${input_name_receiver}
    common.Input When Ready    ${txtbox_name_receiver}    ${input_name_receiver}

Input Address Receiver
    [Arguments]    ${input_address_receiver}
    common.Input When Ready    ${txtbox_address_receiver}    ${input_address_receiver}

Input Postcode Receiver
    [Arguments]    ${input_postcode_receiver}
    common.Input When Ready    ${txtbox_postcode_receiver}    ${input_postcode_receiver}

Click Postcode Receiver Lists
    [Arguments]    ${name}
    ${list}=    Replace String    ${cbo_postcode_sender}    {value}    ${name}
    Click Element    ${list}

Verify Phone Receiver Value
    [Arguments]    ${verify_phone_receiver_value}
    Wait Until Element Is Visible    ${txtbox_phone_receiver}    timeout=10s
    ${phone_receiver_txt}=    Get Value    ${txtbox_phone_receiver}
    Should Be Equal    ${phone_receiver_txt}    ${verify_phone_receiver_value} 

Verify Name Receiver Value
    [Arguments]    ${verify_name_receiver_value}
    Wait Until Element Is Visible    ${txtbox_name_receiver}    timeout=10s
    ${name_receiver_txt}=    Get Value    ${txtbox_name_receiver}
    Should Be Equal    ${name_receiver_txt}    ${verify_name_receiver_value} 

Verify Address Receiver Value
    [Arguments]    ${verify_address_receiver_value}
    Wait Until Element Is Visible    ${txtbox_address_receiver}    timeout=10s
    ${address_receiver_txt}=    Get Value    ${txtbox_address_receiver}
    Should Be Equal    ${address_receiver_txt}    ${verify_address_receiver_value} 


Verify Full Post Code Value
    [Arguments]    ${verify_full_post_code_receiver_value}
    Wait Until Element Is Visible    ${txtbox_full_postcode_sender}    timeout=10s
    ${full_post_code_receiver_txt}=    Get Text    ${txtbox_full_postcode_sender}
    Should Be Equal    ${full_post_code_receiver_txt}    ${verify_full_post_code_receiver_value} 