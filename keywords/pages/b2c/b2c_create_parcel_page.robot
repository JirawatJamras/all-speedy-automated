*** Keywords ***
Verify Create Parcel Page
    Wait Until Element Is Visible    ${title_create_parcel_page_txt}    timeout=30s
    ${title_text}=    Get Text    ${title_create_parcel_page_txt}
    Should Be Equal    ${title_text}    ${B2C_AddBooking_003_001['text_title']}
    ${step_name}=    Get Text    ${frist_step_name}
    Should Be Equal    ${step_name}    ${B2C_AddBooking_003_001['text_frist_step']}

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
    Wait Until Element Is Visible    ${phone_sender_txtbox}    timeout=10s
    Input Text    ${phone_sender_txtbox}    ${input_phone_sender}

Verify Phone Sender Value
    [Arguments]    ${verify_phone_sender_value}
    Wait Until Element Is Visible    ${phone_sender_txtbox}    timeout=10s
    ${phone_sender_txt}=    Get Value    ${phone_sender_txtbox}
    Should Be Equal    ${phone_sender_txt}    ${verify_phone_sender_value}  

Verify Phone Sender Error Msg
    [Arguments]    ${text_error_msg_phone_sender}
    Wait Until Element Is Visible    ${phone_sender_txtbox}    timeout=10s
    ${phone_sender_error_msg}=    Get Text    ${phone_sender_txtbox}
    Should Be Equal    ${phone_sender_error_msg}    ${text_error_msg_phone_sender}

Input Name Sender
    [Arguments]    ${input_name_sender}
    Wait Until Element Is Visible    ${name_sender_txtbox}    timeout=10s
    Input Text    ${name_sender_txtbox}    ${input_name_sender}

Verify Name Sender Value
    [Arguments]    ${verify_name_sender_value}
    Wait Until Element Is Visible    ${name_sender_txtbox}    timeout=10s
    ${name_sender_txt}=    Get Value    ${name_sender_txtbox}
    Should Be Equal    ${name_sender_txt}    ${verify_name_sender_value} 

Verify Name Sender Error Msg
    [Arguments]    ${text_error_msg_name_sender}
    Wait Until Element Is Visible    ${name_sender_txtbox}    timeout=10s
    ${name_sender_error_msg}=    Get Text    ${name_sender_error_txt}
    Should Be Equal    ${name_sender_error_msg}    ${text_error_msg_name_sender}

Input Address Sender
    [Arguments]    ${input_address_sender}
    common.Input When Ready    ${address_sender_txtbox}    ${input_address_sender}

Verify Address Sender Value
    [Arguments]    ${verify_address_sender_value}
    Wait Until Element Is Visible    ${address_sender_txtbox}    timeout=10s
    ${address_sender_txt}=    Get Value    ${address_sender_txtbox}
    Should Be Equal    ${address_sender_txt}    ${verify_address_sender_value} 

Verify Address Sender Error Msg
    [Arguments]    ${text_error_msg_address_sender}
    Wait Until Element Is Visible    ${address_sender_txtbox}    timeout=10s
    ${address_sender_error_msg}=    Get Text    ${address_sender_error_txt}
    Should Be Equal    ${address_sender_error_msg}    ${text_error_msg_address_sender}

Input Postcode Sender
    [Arguments]    ${input_postcode_sender}
    common.Input When Ready    ${postcode_sender_txtbox}    ${input_postcode_sender}

Verify Postcode Sender Value
    [Arguments]    ${verify_postcode_sender_value}
    ${postcode_sender_txt}=    Get Value    ${postcode_sender_txtbox}
    Should Be Equal    ${postcode_sender_txt}    ${verify_postcode_sender_value} 

Verify Not Select Postcode Sender Value
    ${postcode_sender_txt}=    Get Text    ${postcode_sender_not_select_text_in_txtbox}
    Should Be Empty    ${postcode_sender_txt}

Verify Select Postcode Sender Value
    [Arguments]    ${verify_postcode_sender_value}
    ${postcode_sender_txt}=    Get Text    ${postcode_sender_select_text_in_txtbox}
    Should Be Equal    ${postcode_sender_txt}    ${verify_postcode_sender_value} 

Click Postcode Sender Lists
    [Arguments]    ${list}
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

Click Postcode Receiver Lists
    [Arguments]    ${list}
    Click Element    ${list}