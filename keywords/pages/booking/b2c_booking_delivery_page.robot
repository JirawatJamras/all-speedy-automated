*** Keywords ***
Verify Booking Page For Business Customer
    ${isvisible}=    Run Keyword And Ignore Error    Wait Until Page Contains Element    ${txt_booking_card_skeleton}    timeout=${DEFAULT_TIMEOUT}
    Wait Until Page Does Not Contain Element    ${txt_booking_card_skeleton}    timeout=${DEFAULT_TIMEOUT}
    ${txt_title_booking}=    Replace String    ${txt_title_booking}    {value}    ${Booking['text_title_booking_for_business_customer']}  
    ${btn_add}=    Replace String    ${b2c_btn_add}    {value}    ${Booking['text_btn_add']}
    Wait Until Element Is Visible    ${btn_add}    timeout=${DEFAULT_TIMEOUT}
    ${title}=    Get Text    ${txt_title_booking}    
    Should Be Equal    ${title}    ${Booking['text_title_booking_for_business_customer']}

Verify Booking Page For General Customer 
    ${isvisible}=    Run Keyword And Ignore Error    Wait Until Page Contains Element    ${txt_booking_card_skeleton}    timeout=${DEFAULT_TIMEOUT}
    Wait Until Page Does Not Contain Element    ${txt_booking_card_skeleton}    timeout=${DEFAULT_TIMEOUT}
    ${txt_title_booking}=    Replace String    ${txt_title_booking}    {value}    ${Booking['text_title_booking_for_general_customer']}
    ${btn_add}=    Replace String    ${b2c_btn_add}    {value}    ${Booking['text_btn_add']}
    Wait Until Element Is Visible    ${btn_add}    timeout=${DEFAULT_TIMEOUT}
    ${title}=    Get Text    ${txt_title_booking}    
    Should Be Equal    ${title}    ${Booking['text_title_booking_for_general_customer']}

Click Button To Add
    ${btn_add}=    Replace String    ${b2c_btn_add}    {value}    ${Booking['text_btn_add']}
    Wait Until Element Is Enabled    ${btn_add}    timeout=${DEFAULT_TIMEOUT}
    common.Click When Ready    ${btn_add}

Verify Term & Condition 
    [Arguments]    ${txt_term_and_condition}    ${header_term_and_condition}
    ${btn_accept_terms_service}=    Replace String    ${btn_accept_terms_service}    {value}    ${Booking['text_accept_term_and_condition']}
    Wait Until Element Is Visible    ${btn_accept_terms_service}    timeout=${DEFAULT_TIMEOUT}
    ${actual_term_and_condition}=    Get Text    ${txt_term_and_condition}
    Should Be Equal    ${actual_term_and_condition}    ${header_term_and_condition}

Click Accept Terms of Service
    ${btn_accept_terms_service}=    Replace String    ${btn_accept_terms_service}    {value}    ${Booking['text_accept_term_and_condition']}
    common.Click Xpath By JavaScript    ${btn_accept_terms_service}

Verify Select Parcel Type
    Wait Until Element Is Enabled   ${btn_parcel_type_dry}    timeout=${DEFAULT_TIMEOUT}
    Wait Until Element Is Visible    ${btn_parcel_type_dry}    timeout=${DEFAULT_TIMEOUT}
    Wait Until Element Is Visible    ${btn_parcel_type_chill}    timeout=${DEFAULT_TIMEOUT}

Select Parcel Type  
    [Arguments]    ${parcel_type}
    IF         '${parcel_type}' == 'พัสดุทั่วไป'
        Click General Parcel
    ELSE IF    '${parcel_type}' == 'พัสดุควบคุมอุณหภูมิ'
        Click Temperature Controlled Parcel
    END

Select Send To Home Tab
    common.Click When Ready    ${tab_send_to_home}
    
Select Send To 7-ELEVEN Store Tab
    common.Click When Ready    ${tab_send_to_store}

Click General Parcel
    common.Click When Ready    ${parcel_type_dry_btn}
    Wait Until Element Is Visible    ${close_noti_btn}   timeout=${DEFAULT_TIMEOUT}

Click Temperature Controlled Parcel
    common.Click When Ready    ${parcel_type_chill_btn}
    
Click Close X Popup
    ${close_popup}=    Replace String    ${btn_close_popup}    {value}    ${Booking['text_title']}
    common.Click When Ready    ${close_popup}
    common.Click When Ready    ${btn_confirm_to_close_popup}

Click Latest Booking Created
    common.Click When Ready    ${btn_card_latest_booking}

Verify Create Parcel Page Sender Step
    [Arguments]    ${title}    ${parcel_sender_information}    ${phone_sender}    ${name_sender}    ${address_sender}    ${postcode_sender}  
    ${txt_parcel_sender_information}=  Replace String   ${txt_parcel_sender_information}   {value}   ${parcel_sender_information}
    ${title_create_parcel_page_txt}=    Replace String    ${title_create_parcel_page_txt}    {value}    ${Booking['text_title']}
    Wait Until Element Is Visible    ${title_create_parcel_page_txt}    timeout=${DEFAULT_TIMEOUT}
    Wait Until Element Is Not Visible    ${status_active_sender}    timeout=${DEFAULT_TIMEOUT}
    ${actual_text_title}=    Get Text    ${txt_title_create_parcel_page}
    ${actual_text_parcel_sender_information}=    Get Text    ${txt_parcel_sender_information}
    ${actual_text_phone}=    Get Text    ${txt_phone_sender}
    ${actual_text_name_sender}=    Get Text    ${txt_name_sender}
    ${actual_text_address}=    Get Text    ${txt_address_sender}
    ${actual_text_postcode}=    Get Text    ${txt_postcode_sender}
    Should Be Equal    ${actual_text_title}    ${title}
    Should Be Equal    ${actual_text_parcel_sender_information}    ${parcel_sender_information}
    Should Be Equal    ${actual_text_phone}    ${phone_sender}
    Should Be Equal    ${actual_text_name_sender}    ${name_sender}
    Should Be Equal    ${actual_text_address}    ${address_sender}
    Should Be Equal    ${actual_text_postcode}    ${postcode_sender}

Verify Data Sender
    [Arguments]   ${phone_sender}    ${name_sender}    ${address_sender}    ${full_postcode_sender}
    ${title_create_parcel_page_txt}=    Replace String    ${title_create_parcel_page_txt}    {value}    ${Booking['text_title']}
    Wait Until Element Is Visible    ${title_create_parcel_page_txt}    timeout=${DEFAULT_TIMEOUT}
    ${actual_text_phone_sender}=    Get Value    ${txtbox_phone_sender}
    ${actual_text_name_sender}=    Get Value    ${txtbox_name_sender}
    ${actual_text_address_sender}=    Get Value    ${txtbox_address_sender}
    Should Be Equal    ${actual_text_phone_sender}    ${phone_sender}
    Should Be Equal    ${actual_text_name_sender}    ${name_sender}
    Should Be Equal    ${actual_text_address_sender}    ${address_sender}
    Run Keyword If    '${full_postcode_sender}' == '${EMPTY}'    Verify full_postcode_sender Equal EMPTY    ${full_postcode_sender}
    ...    ELSE    Verify full_postcode_sender Equal Text    ${full_postcode_sender}

Verify full_postcode_sender Equal EMPTY
    [Arguments]    ${full_postcode_sender}
   ${actual_textbox_full_postcode_sender}=    Get Text    ${txtbox_full_postcode_sender}
    Should Be Equal    ${actual_textbox_full_postcode_sender}    ${full_postcode_sender}
    
Verify full_postcode_sender Equal Text
    [Arguments]    ${full_postcode_sender}
    ${actual_text_full_postcode_sender}=    Get Text    ${txt_full_postcode_sender}
    Should Be Equal    ${actual_text_full_postcode_sender}    ${full_postcode_sender}

Verify Data Receiver When Select Home
    [Arguments]   ${phone_receiver}    ${name_receiver}    ${address_receiver}    ${full_postcode_receiver} 
    ${title_create_parcel_page_txt}=    Replace String    ${title_create_parcel_page_txt}    {value}    ${Booking['text_title']}
    Wait Until Element Is Visible    ${title_create_parcel_page_txt}    timeout=${DEFAULT_TIMEOUT}
    ${actual_text_phone_receiver}=    Get Value    ${txtbox_phone_receiver}
    ${actual_text_name_receiver}=    Get Value    ${txtbox_name_receiver}
    ${actual_text_address_receiver}=    Get Value    ${txtbox_address_receiver}
    Should Be Equal    ${actual_text_phone_receiver}    ${phone_receiver}
    Should Be Equal    ${actual_text_name_receiver}    ${name_receiver}
    Should Be Equal    ${actual_text_address_receiver}    ${address_receiver}
    Run Keyword If    '${full_postcode_receiver}' == '${EMPTY}'    Verify full_postcode_senderVerify full_postcode_receiver    ${full_postcode_receiver}
    ...    ELSE    Verify full_postcode_receiver Equal Text   ${full_postcode_receiver}

Verify full_postcode_senderVerify full_postcode_receiver    
    [Arguments]    ${full_postcode_receiver}
    ${txtbox_full_postcode_receiver}=    Replace String    ${txtbox_full_postcode_receiver}    {value}    ${Booking['text_postcode_receiver_1']}
   ${actual_textbox_full_postcode_receiver}=    Get Text    ${txtbox_full_postcode_receiver}
    Should Be Equal    ${actual_textbox_full_postcode_receiver}    ${full_postcode_receiver}

Verify full_postcode_receiver Equal Text
    [Arguments]    ${full_postcode_receiver}
    ${actual_text_full_postcode_receiver}=    Get Text    ${txt_full_postcode_receiver}
    Should Be Equal    ${actual_text_full_postcode_receiver}    ${full_postcode_receiver}

Verify Data Receiver When Select 7-ELEVEN Store
    [Arguments]   ${phone_receiver}    ${name_receiver}    ${store_address_receiver}
    ${title_create_parcel_page_txt}=    Replace String    ${title_create_parcel_page_txt}    {value}    ${Booking['text_title']}
    Wait Until Element Is Visible    ${title_create_parcel_page_txt}    timeout=${DEFAULT_TIMEOUT}
    ${actual_text_phone_receiver}=    Get Value    ${txtbox_phone_receiver}
    ${actual_text_name_receiver}=    Get Value    ${txtbox_name_receiver}
    ${tab_send_to_store_verify}=    Get Element Attribute    ${tab_send_to_store_verify}    aria-selected
    ${actual_text_store_receiver}=    Get Text    ${txt_store_address}
    Should Be Equal    ${actual_text_phone_receiver}    ${phone_receiver}
    Should Be Equal    ${actual_text_name_receiver}    ${name_receiver}
    Should Be Equal    ${tab_send_to_store_verify}    true
    Should Be Equal    ${actual_text_store_receiver}    ${store_address_receiver}

Verify Create Parcel Page Receiver Step When Select Home
    [Arguments]    ${title}    ${parcel_receiver_information}   ${phone_receiver}    ${name_receiver}    ${location_receiver}    ${address_receiver}    ${postcode_receiver}
    ${txt_parcel_receiver_information}=  Replace String   ${txt_parcel_receiver_information}   {value}   ${parcel_receiver_information}
    ${title_create_parcel_page_txt}=    Replace String    ${title_create_parcel_page_txt}    {value}    ${Booking['text_title']}
    Wait Until Element Is Visible    ${title_create_parcel_page_txt}    timeout=${DEFAULT_TIMEOUT}
    Wait Until Element Is Not Visible    ${status_active_receiver}    timeout=${DEFAULT_TIMEOUT}
    ${actual_text_title}=    Get Text    ${txt_title_create_parcel_page}
    ${actual_text_parcel_receiver_information}=    Get Text    ${txt_parcel_receiver_information}
    ${actual_text_phone}=    Get Text    ${txt_phone_receiver}
    ${actual_text_name}=    Get Text    ${txt_name_receiver}
    ${actual_text_location_receiver}=    Get Text    ${txt_location_receiver}
    ${actual_text_address}=    Get Text    ${txt_address_receiver}
    ${actual_text_postcode}=    Get Text    ${txt_postcode_receiver}
    Should Be Equal    ${actual_text_title}    ${title}
    Should Be Equal    ${actual_text_parcel_receiver_information}    ${parcel_receiver_information}
    Should Be Equal    ${actual_text_phone}    ${phone_receiver}
    Should Be Equal    ${actual_text_name}    ${name_receiver}
    Should Be Equal    ${actual_text_location_receiver}    ${location_receiver}
    Should Be Equal    ${actual_text_address}    ${address_receiver}
    Should Be Equal    ${actual_text_postcode}    ${postcode_receiver}

Verify Create Parcel Page Receiver Step When Select 7-ELEVEN Store
    [Arguments]    ${title}    ${parcel_receiver_information}   ${phone_receiver}    ${name_receiver}    ${location_receiver}    ${address_receiver}
    ${txt_parcel_receiver_information}=  Replace String   ${txt_parcel_receiver_information}   {value}   ${parcel_receiver_information}
    ${title_create_parcel_page_txt}=    Replace String    ${title_create_parcel_page_txt}    {value}    ${Booking['text_title']}
    Wait Until Element Is Visible    ${title_create_parcel_page_txt}    timeout=${DEFAULT_TIMEOUT}
    Wait Until Element Is Not Visible    ${status_active_receiver}    timeout=${DEFAULT_TIMEOUT}
    ${actual_text_title}=    Get Text    ${txt_title_create_parcel_page}
    ${actual_text_parcel_receiver_information}=    Get Text    ${txt_parcel_receiver_information}
    ${actual_text_phone}=    Get Text    ${txt_phone_receiver}
    ${actual_text_name}=    Get Text    ${txt_name_receiver}
    ${actual_text_location}=    Get Text    ${txt_location_receiver}
    ${actual_text_address}=    Get Text    ${txt_address_receiver_for_7_11_select}
    Should Be Equal    ${actual_text_title}    ${title}
    Should Be Equal    ${actual_text_parcel_receiver_information}    ${parcel_receiver_information}
    Should Be Equal    ${actual_text_phone}    ${phone_receiver}
    Should Be Equal    ${actual_text_name}    ${name_receiver}
    Should Be Equal    ${actual_text_location}    ${location_receiver}
    Should Be Equal    ${actual_text_address}    ${address_receiver}
    Element Should Be Visible    ${txtbox_store_receiver} 

Click Close Parcel Page
    common.Click When Ready    ${close_noti_btn}
    common.Click When Ready    ${close_noticonfirm_btn}

Click Choose Favorites 
    common.Click When Ready    ${choose_favorites_btn}
    Wait Until Element Is Visible    ${favorites_defult_text}    timeout=${DEFAULT_TIMEOUT}

Click Choose Favorites Receiver
    common.Click When Ready    ${choose_favorites_btn}

Verify Favorites Sender PopUp
    [Arguments]    ${sender_phone}    ${sender_name}    ${sender_address}    ${sender_postcode_full}
    ${sender_postcode_full_list}=    Split String    ${sender_postcode_full}    ${SPACE}
    ${selected_favorites_list}=  Replace String   ${btn_choose_favorites_list}   {value_name}   ${sender_name}
    ${selected_favorites_list}=  Replace String   ${selected_favorites_list}   {value_phone}   ${sender_phone}
    ${selected_favorites_list}=  Replace String   ${selected_favorites_list}   {value_address}   ${sender_address}
    ${selected_favorites_list}=  Replace String   ${selected_favorites_list}   {value_subdistrict}   ${sender_postcode_full_list[0]}
    ${selected_favorites_list}=  Replace String   ${selected_favorites_list}   {value_district}   ${sender_postcode_full_list[1]}
    ${selected_favorites_list}=  Replace String   ${selected_favorites_list}   {value_province}   ${sender_postcode_full_list[2]}
    ${selected_favorites_list}=  Replace String   ${selected_favorites_list}   {value_postal_code}   ${sender_postcode_full_list[3]}
    Wait Until Element Is Visible    ${selected_favorites_list}    timeout=${DEFAULT_TIMEOUT}

Verify Favorites Receiver PopUp
    [Arguments]    ${receiver_phone}    ${receiver_name}    ${receiver_address}    ${receiver_postcode_full}
    ${receiver_postcode_full_list}=    Split String    ${receiver_postcode_full}    ${SPACE}
    ${selected_favorites_list}=  Replace String   ${btn_choose_favorites_list}   {value_name}   ${receiver_name}
    ${selected_favorites_list}=  Replace String   ${selected_favorites_list}   {value_phone}   ${receiver_phone}
    ${selected_favorites_list}=  Replace String   ${selected_favorites_list}   {value_address}   ${receiver_address}
    ${selected_favorites_list}=  Replace String   ${selected_favorites_list}   {value_subdistrict}   ${receiver_postcode_full_list[0]}
    ${selected_favorites_list}=  Replace String   ${selected_favorites_list}   {value_district}   ${receiver_postcode_full_list[1]}
    ${selected_favorites_list}=  Replace String   ${selected_favorites_list}   {value_province}   ${receiver_postcode_full_list[2]}
    ${selected_favorites_list}=  Replace String   ${selected_favorites_list}   {value_postal_code}   ${receiver_postcode_full_list[3]}    
    Wait Until Element Is Visible    ${selected_favorites_list}    timeout=${DEFAULT_TIMEOUT}

Verify Favorites Receiver PopUp When Address At 7-ELEVEN Store
    [Arguments]    ${receiver_phone}    ${receiver_name}    ${receiver_store_address}
    ${receiver_store_address_split}=    Split String    ${receiver_store_address}    ${SPACE}
    ${selected_favorites_list}=  Replace String   ${btn_choose_favorites_list_store}   {value_name}   ${receiver_name}
    ${selected_favorites_list}=  Replace String   ${selected_favorites_list}   {value_phone}   ${receiver_phone}
    ${selected_favorites_list}=  Replace String   ${selected_favorites_list}   {store_address}   ${receiver_store_address_split[0]}  
    Wait Until Element Is Visible    ${selected_favorites_list}    timeout=${DEFAULT_TIMEOUT}

Click Choose Favorites Receiver List When Address At 7-ELEVEN Store
    [Arguments]    ${receiver_phone}    ${receiver_name}    ${receiver_store_address}
    ${receiver_store_address_split}=    Split String    ${receiver_store_address}    ${SPACE}
    ${selected_favorites_list}=  Replace String   ${btn_choose_favorites_list_store}   {value_name}   ${receiver_name}
    ${selected_favorites_list}=  Replace String   ${selected_favorites_list}   {value_phone}   ${receiver_phone}
    ${selected_favorites_list}=  Replace String   ${selected_favorites_list}   {store_address}   ${receiver_store_address[0]}  
    common.Click When Ready    ${selected_favorites_list}


Click Choose Favorites Sender List
    [Arguments]    ${sender_phone}    ${sender_name}    ${sender_address}    ${sender_postcode_full}
    ${sender_postcode_full_list}=    Split String    ${sender_postcode_full}    ${SPACE}
    ${selected_favorites_list}=  Replace String   ${btn_choose_favorites_list}   {value_name}   ${sender_name}
    ${selected_favorites_list}=  Replace String   ${selected_favorites_list}   {value_phone}   ${sender_phone}
    ${selected_favorites_list}=  Replace String   ${selected_favorites_list}   {value_address}   ${sender_address}
    ${selected_favorites_list}=  Replace String   ${selected_favorites_list}   {value_subdistrict}   ${sender_postcode_full_list[0]}
    ${selected_favorites_list}=  Replace String   ${selected_favorites_list}   {value_district}   ${sender_postcode_full_list[1]}
    ${selected_favorites_list}=  Replace String   ${selected_favorites_list}   {value_province}   ${sender_postcode_full_list[2]}
    ${selected_favorites_list}=  Replace String   ${selected_favorites_list}   {value_postal_code}   ${sender_postcode_full_list[3]}
    common.Click When Ready    ${selected_favorites_list}

Click Choose Favorites Receiver List
    [Arguments]    ${receiver_phone}    ${receiver_name}    ${receiver_address}    ${receiver_postcode_full}
    ${receiver_postcode_full_list}=    Split String    ${receiver_postcode_full}    ${SPACE}
    ${selected_favorites_list}=  Replace String   ${btn_choose_favorites_list}   {value_name}   ${receiver_name}
    ${selected_favorites_list}=  Replace String   ${selected_favorites_list}   {value_phone}   ${receiver_phone}
    ${selected_favorites_list}=  Replace String   ${selected_favorites_list}   {value_address}   ${receiver_address}
    ${selected_favorites_list}=  Replace String   ${selected_favorites_list}   {value_subdistrict}   ${receiver_postcode_full_list[0]}
    ${selected_favorites_list}=  Replace String   ${selected_favorites_list}   {value_district}   ${receiver_postcode_full_list[1]}
    ${selected_favorites_list}=  Replace String   ${selected_favorites_list}   {value_province}   ${receiver_postcode_full_list[2]}
    ${selected_favorites_list}=  Replace String   ${selected_favorites_list}   {value_postal_code}   ${receiver_postcode_full_list[3]}    
    common.Click When Ready    ${selected_favorites_list}

Verify Choose Favorites Receiver List
    [Arguments]    ${receiver_phone}    ${receiver_name}    ${receiver_address}
    ${selected_favorites_list}=  Replace String   ${btn_choose_favorites_list}   {value_name}   ${receiver_name}
    ${selected_favorites_list}=  Replace String   ${selected_favorites_list}   {value_phone}   ${receiver_phone}
    ${selected_favorites_list}=  Replace String   ${selected_favorites_list}   {value_address}   ${receiver_address}
    Wait Until Element Is Visible    ${selected_favorites_list}    timeout=${DEFAULT_TIMEOUT}

Verify Choose Receiver From Favorites
    [Arguments]    ${receiver_name}    ${receiver_phone}    ${receiver_address}    ${receiver_postcode} 
    Wait Until Element Is Visible    ${choose_favorites_btn}    timeout=${DEFAULT_TIMEOUT}
    ${tab_send_to_home_verify}=    Replace String    ${tab_send_to_home_verify}    {value}    ${Booking['text_send_home']}
    Wait Until Element Is Visible    ${tab_send_to_home_verify}    timeout=${DEFAULT_TIMEOUT}
    ${phone_text}=    Get Value    ${txtbox_phone_receiver}
    ${name_text}=    Get Value    ${txtbox_name_receiver}
    ${address_text}=    Get Value    ${txtbox_address_receiver}
    ${postcode_text}=    Get Text    ${txtbox_postcode_receiver_select_text}
    Should Be Equal    ${phone_text}    ${receiver_phone}    
    Should Be Equal   ${name_text}    ${receiver_name}
    Should Be Equal    ${address_text}    ${receiver_address}
    Should Be Equal    ${postcode_text}    ${receiver_postcode}

Click Favorites Default
    common.Click When Ready    ${select_favorites_btn}

Input Special Letters
    [Arguments]    ${search_txt}
    Wait Until Element Is Visible    ${search_favorites_txtbox}    timeout=${DEFAULT_TIMEOUT}
    Input Text    ${search_favorites_txtbox}    ${search_txt}

Clear Search Favorites TextBox
    common.Click When Ready    ${search_favorites_txtbox}
    Clear Element Text    ${search_favorites_txtbox}

Input Text Exceeds 100 Characters
    [Arguments]    ${search_txt}
    Wait Until Element Is Visible    ${search_favorites_txtbox}    timeout=${DEFAULT_TIMEOUT}
    Clear Element Text    ${search_favorites_txtbox}
    Input Text    ${search_favorites_txtbox}    ${search_txt}

Verify Popup Favorites Sender 
    ${favorites_accetp_btn}=    Replace String    ${favorites_accetp_btn}    {value}    ${Booking['text_btn_select']}
    Wait Until Element Is Visible    ${favorites_accetp_btn}    timeout=${DEFAULT_TIMEOUT} 
    ${title_text}=    Get Text    ${favorites_title_text}
    ${default_text}=    Get Text    ${favorites_default_text}
    Should Be Equal    ${title_text}    ${B2C_AddBooking_003_002['favorites_title_text']}
    Should Be Equal    ${default_text}    ${B2C_AddBooking_003_002['favorites_default_text']}

Input Favorites TextBox Nomal Letters Less Than 100 Characters
    [Arguments]    ${search_txt}
    Wait Until Element Is Visible    ${search_favorites_txtbox}    timeout=${DEFAULT_TIMEOUT}
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
    Wait Until Element Is Visible    ${search_favorites_txtbox}    timeout=${DEFAULT_TIMEOUT}
    Input Text    ${search_favorites_txtbox}    ${search_txt}

Click Favorites Default List
    common.Click When Ready    ${choose_default_favorites_btn}

Click Accept Favorites List
    ${favorites_accetp_btn}=    Replace String    ${favorites_accetp_btn}    {value}    ${Booking['text_btn_select']}
    common.Click When Ready    ${favorites_accetp_btn}

Click Cancel Favorites List
    common.Click When Ready    ${cancel_favorites_btn}

Verify Choose From Favorites
    Wait Until Element Is Visible    ${choose_favorites_btn}    timeout=${DEFAULT_TIMEOUT}
    ${phone_text}=    Get Value    ${phone_sender_txtbox}
    ${name_text}=    Get Value    ${name_sender_txtbox}
    ${address_text}=    Get Value    ${address_sender_txtbox}
    ${postcode_text}=    Get Text    ${postcode_sender_text_in_txtbox}
    Should Be Equal    ${phone_text}    ${b2c_addbooking_003_ID_5['verify_phone_sender']}    
    Should Be Equal   ${name_text}    ${b2c_addbooking_003_ID_5['verify_name_sender']}
    Should Be Equal    ${address_text}    ${b2c_addbooking_003_ID_5['verify_address_sender']}
    Should Be Equal    ${postcode_text}    ${b2c_addbooking_003_ID_5['verify_postcode_sender']}

Verify Not Choose From Favorites
    Wait Until Element Is Visible    ${choose_favorites_btn}    timeout=${DEFAULT_TIMEOUT}
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
    Wait Until Element Is Visible    ${txtbox_phone_sender}    timeout=${DEFAULT_TIMEOUT}
    Input Text    ${txtbox_phone_sender}    ${input_phone_sender}

Verify Phone Sender Value
    [Arguments]    ${verify_phone_sender_value}
    Wait Until Element Is Visible    ${txtbox_phone_sender}    timeout=${DEFAULT_TIMEOUT}
    ${phone_sender_txt}=    Get Value    ${txtbox_phone_sender}
    Should Be Equal    ${phone_sender_txt}    ${verify_phone_sender_value}  

Verify Phone Sender Error Msg
    [Arguments]    ${text_error_msg_phone_sender}
    Wait Until Element Is Visible    ${phone_sender_txtbox}    timeout=${DEFAULT_TIMEOUT}
    ${phone_sender_error_msg}=    Get Text    ${phone_sender_txtbox}
    Should Be Equal    ${phone_sender_error_msg}    ${text_error_msg_phone_sender}

Input Name Sender
    [Arguments]    ${input_name_sender}
    Wait Until Element Is Visible    ${txtbox_name_sender}    timeout=${DEFAULT_TIMEOUT}
    Input Text    ${txtbox_name_sender}    ${input_name_sender}

Verify Name Sender Value
    [Arguments]    ${verify_name_sender_value}
    Wait Until Element Is Visible    ${txtbox_name_sender}    timeout=${DEFAULT_TIMEOUT}
    ${name_sender_txt}=    Get Value    ${txtbox_name_sender}
    Should Be Equal    ${name_sender_txt}    ${verify_name_sender_value} 

Verify Name Sender Error Msg
    [Arguments]    ${text_error_msg_name_sender}
    Wait Until Element Is Visible    ${name_sender_txtbox}    timeout=${DEFAULT_TIMEOUT}
    ${name_sender_error_msg}=    Get Text    ${name_sender_error_txt}
    Should Be Equal    ${name_sender_error_msg}    ${text_error_msg_name_sender}

Input Address Sender
    [Arguments]    ${input_address_sender}
    common.Input When Ready    ${txtbox_address_sender}    ${input_address_sender}

Verify Address Sender Value
    [Arguments]    ${verify_address_sender_value}
    Wait Until Element Is Visible    ${txtbox_address_sender}    timeout=${DEFAULT_TIMEOUT}
    ${address_sender_txt}=    Get Value    ${txtbox_address_sender}
    Should Be Equal    ${address_sender_txt}    ${verify_address_sender_value} 

Verify Address Sender Error Msg
    [Arguments]    ${text_error_msg_address_sender}
    Wait Until Element Is Visible    ${address_sender_txtbox}    timeout=${DEFAULT_TIMEOUT}
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
    ${cbo_postcode_sender}=    Replace String    ${cbo_postcode_sender}    {value}    ${name}
    common.Click When Ready    ${cbo_postcode_sender}

Verify Postcode Sender Error Msg
    [Arguments]    ${text_error_msg_postcode_sender}
    Wait Until Element Is Visible    ${postcode_sender_txtbox}    timeout=${DEFAULT_TIMEOUT}
    ${postcode_sender_error_msg}=    Get Text    ${postcode_sender_error_txt}
    Should Be Equal    ${postcode_sender_error_msg}    ${text_error_msg_postcode_sender}

Click Button
    [Arguments]    ${btn}
    common.Click When Ready    ${btn}

Click Save Button
    ${btn_save_draft}=    Replace String    ${btn_save_draft}    {value}    ${Booking['text_draft_save']}
    common.Click When Ready    ${btn_save_draft}
    Sleep    5s

Click Next Button
    ${btn}=    Replace String    ${btn_next}    {value}    ${Booking['text_btn_next']}
    common.Click Xpath By JavaScript    ${btn}

Click Add To Favorites In Sender
    common.Click When Ready    ${btn_add_sender_to_favorites}

Click Add To Favorites In Receiver
    common.Click When Ready    ${btn_add_receiver_to_favorites}

Verify Favorites Icon Red Heart
    Wait Until Page Contains Element    ${btn_add_sender_to_favorites_is_red}

Verify Add To Favorites
    [Arguments]    ${text_search}
    Click Choose Favorites
    Input Favorites TextBox Nomal Letters Less Than 100 Characters    ${text_search}
    Verify Favorites Show Item Lists

Verify Step In Create Parcel Popup
    [Arguments]    ${title}    ${status}
    ${title_create_parcel_page_txt}=    Replace String    ${title_create_parcel_page_txt}    {value}    ${Booking['text_title']}
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
    ${cbo_postcode_sender}=    Replace String    ${cbo_postcode_sender}    {value}    ${name}
    common.Click When Ready    ${cbo_postcode_sender}

Input And Select Store Code Receiver
    [Arguments]    ${input_store_receiver}    ${store}
    ${select_store}=    Replace String    ${btn_choose_store}    {value}    ${Booking['text_select_store_on_map']}
    FOR    ${i}    IN RANGE    0    5
        common.Input When Ready    ${txtbox_store_receiver}    ${input_store_receiver}
        Click Store Receiver Lists    ${store}
        ${isvisible}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${select_store}    timeout=${DEFAULT_TIMEOUT}
        Run Keyword IF  '${isvisible}' == 'True'    Exit For Loop
        common.Clear Value Input Text    ${txtbox_store_receiver}
    END

Click Store Receiver Lists
    [Arguments]    ${store}
    ${cbo_store_receiver}=    Replace String    ${cbo_store_receiver}    {value}    ${store}
    common.Click When Ready    ${cbo_store_receiver}

Click Store On Map
    ${select_store}=    Replace String    ${btn_choose_store}    {value}    ${Booking['text_select_store_on_map']}
    common.Click When Ready    ${select_store}

Verify Phone Receiver Value
    [Arguments]    ${verify_phone_receiver_value}
    Wait Until Element Is Visible    ${txtbox_phone_receiver}    timeout=${DEFAULT_TIMEOUT}
    ${phone_receiver_txt}=    Get Value    ${txtbox_phone_receiver}
    Should Be Equal    ${phone_receiver_txt}    ${verify_phone_receiver_value} 

Verify Name Receiver Value
    [Arguments]    ${verify_name_receiver_value}
    Wait Until Element Is Visible    ${txtbox_name_receiver}    timeout=${DEFAULT_TIMEOUT}
    ${name_receiver_txt}=    Get Value    ${txtbox_name_receiver}
    Should Be Equal    ${name_receiver_txt}    ${verify_name_receiver_value} 

Verify Address Receiver Value
    [Arguments]    ${verify_address_receiver_value}
    Wait Until Element Is Visible    ${txtbox_address_receiver}    timeout=${DEFAULT_TIMEOUT}
    ${address_receiver_txt}=    Get Value    ${txtbox_address_receiver}
    Should Be Equal    ${address_receiver_txt}    ${verify_address_receiver_value} 

Verify Full Post Code Value
    [Arguments]    ${verify_full_post_code_receiver_value}
    Wait Until Element Is Visible    ${txtbox_full_postcode_sender}    timeout=${DEFAULT_TIMEOUT}
    ${full_post_code_receiver_txt}=    Get Text    ${txtbox_full_postcode_sender}
    Should Be Equal    ${full_post_code_receiver_txt}    ${verify_full_post_code_receiver_value}

Verify Store Address Receiver
    [Arguments]    ${store}
    ${store_value}    Get Text    ${txt_store_address}
    Should Be Equal    ${store_value}    ${store}

Verify Created Booking On Booking Delivery Page
    [Arguments]    ${booking_id}    ${booking_time}    ${status_booking}    ${name_booking}    ${item_booking}    ${price_booking}    
    ${booking_id_replace}=    Replace String    ${txt_booking_id_in_list}    {value}    ${booking_id}
    Wait Until Element Is Visible    ${booking_id_replace}    timeout=${DEFAULT_TIMEOUT}
    Verify Booking ID Format And Value    ${booking_id_replace}    ${booking_id}
    ${booking_status_replace}=    Replace String    ${txt_booking_status_in_list}    {value}    ${booking_id}
    ${txt_status}=    Get Text    ${booking_status_replace}
    ${booking_name}=    Replace String    ${txt_booking_name_in_list}    {value}    ${booking_id}
    ${txt_name}=    Get Text    ${booking_name}
    ${booking_date}=    Replace String    ${txt_booking_date_in_list}    {value}    ${booking_id}
    Verify Date And Time With Time Distortion   ${booking_date}    ${booking_time}
    ${booking_item}=    Replace String    ${txt_booking_item_in_list}    {value}    ${booking_id}
    ${txt_item}=    Get Text    ${booking_item}
    ${booking_price}=    Replace String    ${txt_booking_price_in_list}    {value}    ${booking_id}
    ${txt_price}=    Get Text    ${booking_price}    
    Should Be Equal    ${txt_status}    ${status_booking}
    Should Be Equal    ${txt_name}    ${name_booking}
    Should Be Equal    ${txt_item}    ${item_booking}
    Should Be Equal    ${txt_price}    ${price_booking}

Verify Booking ID Format And Value
    [Arguments]    ${locator}    ${value}
    ${txt_id}=    Get Text    ${locator}
    ${length}=    Get Length    ${txt_id}
    Should Be Equal As Integers    ${length}    11
    Should Start With    ${txt_id}    B
    ${current_date}=    Get Current Date    result_format=%y%m
    ${current_date_string}=    Convert To String    ${current_date}
    ${txt_id_index_1_to_5}=    Get Substring    ${txt_id}    1    5
    ${txt_id_index_5_to_11}=    Get Substring    ${txt_id}    5    11
    Should Be Equal    ${txt_id_index_1_to_5}     ${current_date}
    ${int_value}=    Convert To Integer    ${txt_id_index_5_to_11}
    Should Be Equal    ${txt_id}    ${value}

Verify Parcel ID Format And Value
    [Arguments]    ${locator}    ${4_start_unit}
    ${isblank}=    Run Keyword And Return Status    Should Be Equal As Strings    ${4_start_unit}    -
    IF    '${isblank}' == 'True'
        Wait Until Element Is Visible    ${locator}    timeout=${DEFAULT_TIMEOUT}
        ${pearcel_id}=    Get Text    ${locator}
        Should Be Equal    ${pearcel_id}    ${4_start_unit}
    ELSE
        Sleep    3s
        Wait Until Element Is Visible    ${locator}    timeout=${DEFAULT_TIMEOUT}
        ${pearcel_id}=    Get Text    ${locator}
        ${length}=    Get Length    ${pearcel_id}
        ${unit_1_to_4}=    Set Variable    ${pearcel_id}[0:4]
        ${year_month}=    Get Current Date    result_format=%y%m
        ${year_month_string}=    Convert To String    ${year_month}
        ${unite_5_to_8}=    Set Variable    ${pearcel_id}[4:8]
        Should Be Equal As Integers    ${length}    16
        Should Be Equal As Strings    ${unit_1_to_4}    ${4_start_unit}
        Should Be Equal    ${unite_5_to_8}     ${year_month_string}
    END

Select Parcel Size
    [Arguments]    ${value}
    ${btn_parcel_size}=  Replace String   ${btn_parcel_size}   {value}   ${value}
    Click When Ready    ${btn_parcel_size}

Verify Promotion Detail
    [Arguments]    ${selected_coupon_and_code}    ${my_coupon_and_code}
    ${actual_selected_coupon_and_code}=    Get Text    ${txt_selected_coupon_and_code}
    ${actual_my_coupon_and_code}=    Get Text    ${txt_my_coupon_and_code}
    Should Be Equal    ${selected_coupon_and_code}    ${actual_selected_coupon_and_code}
    Should Be Equal    ${my_coupon_and_code}    ${actual_my_coupon_and_code}

Click Parcel Booking Button
    ${btn_parcel_booking}=   Replace String    ${btn_parcel_booking}    {value}    ${Booking['text_parcel_booking']}
    common.Click When Ready    ${btn_parcel_booking}
    
Verify Parcel Detail Page of Create Parcel [Dry Parcel]
    [Arguments]    ${detail_A4}    ${detail_A3}    ${detail_XS}    ${detail_S}    ${detail_M}    ${detail_L}    ${detail_XL}    ${detail_XXL}    ${insure_amount}    ${cod}    ${remark}
    ${btn_parcel_select_A4}=    Replace String    ${btn_parcel_select_A4}    {value}    ${Booking.dry_parcel['parcel_A4']}
    ${actual_detail_A4}=    Get Text    ${btn_parcel_select_A4}
    ${detail_A4_replace}=  Replace String   ${actual_detail_A4}   \n   ${SPACE}
    ${btn_parcel_select_A3}=    Replace String    ${btn_parcel_select_A3}    {value}    ${Booking.dry_parcel['parcel_A3']}
    ${actual_detail_A3}=    Get Text    ${btn_parcel_select_A3} 
    ${detail_A3_replace}=  Replace String   ${actual_detail_A3}   \n   ${SPACE}
    ${btn_parcel_select_XS}=    Replace String    ${btn_parcel_select_XS}    {value}    ${Booking.dry_parcel['parcel_XS']}
    ${actual_detail_XS}=    Get Text    ${btn_parcel_select_XS}
    ${detail_XS_replace}=  Replace String   ${actual_detail_XS}   \n   ${SPACE}
    ${btn_parcel_select_S}=    Replace String    ${btn_parcel_select_S}    {value}    ${Booking.dry_parcel['parcel_S']}
    ${actual_detail_S}=    Get Text    ${btn_parcel_select_S} 
    ${detail_S_replace}=  Replace String   ${actual_detail_S}   \n   ${SPACE}
    ${btn_parcel_select_M}=    Replace String    ${btn_parcel_select_M}    {value}    ${Booking.dry_parcel['parcel_M']}
    ${actual_detail_M}=    Get Text    ${btn_parcel_select_M}
    ${detail_M_replace}=  Replace String   ${actual_detail_M}   \n   ${SPACE}
    ${btn_parcel_select_L}=    Replace String    ${btn_parcel_select_L}    {value}    ${Booking.dry_parcel['parcel_L']}
    ${actual_detail_L}=    Get Text    ${btn_parcel_select_L}
    ${detail_L_replace}=  Replace String   ${actual_detail_L}   \n   ${SPACE}
    ${btn_parcel_select_XL}=    Replace String    ${btn_parcel_select_XL}    {value}    ${Booking.dry_parcel['parcel_XL']}
    ${actual_detail_XL}=    Get Text    ${btn_parcel_select_XL}
    ${detail_XL_replace}=  Replace String   ${actual_detail_XL}   \n   ${SPACE}
    ${btn_parcel_select_XXL}=    Replace String    ${btn_parcel_select_XXL}    {value}    ${Booking.dry_parcel['parcel_XXL']}
    ${actual_detail_XXL}=    Get Text    ${btn_parcel_select_XXL}
    ${detail_XXL_replace}=  Replace String   ${actual_detail_XXL}   \n   ${SPACE}
    ${txt_insure_amount}=    Replace String    ${txt_insure_amount}    {value}    ${Booking['parcel_detail_insure_amount']}
    ${actual_insure_amount}=    Get Text    ${txt_insure_amount}
    ${txt_cod}=    Replace String    ${txt_cod}    {value}    ${Booking['parcel_detail_cod']}
    ${actual_cod}=    Get Text    ${txt_cod}
    ${txt_remark}=    Replace String    ${txt_remark}    {value}    ${Booking['parcel_detail_remark']}
    ${actual_remark}=    Get Text    ${txt_remark}
    Should Be Equal    ${detail_A4_replace}    ${detail_A4}
    Should Be Equal    ${detail_A3_replace}    ${detail_A3}
    Should Be Equal    ${detail_XS_replace}    ${detail_XS}
    Should Be Equal    ${detail_S_replace}    ${detail_S}
    Should Be Equal    ${detail_M_replace}    ${detail_M}
    Should Be Equal    ${detail_L_replace}    ${detail_L}
    Should Be Equal    ${detail_XL_replace}    ${detail_XL}
    Should Be Equal    ${detail_XXL_replace}    ${detail_XXL}
    Should Be Equal    ${actual_cod}    ${cod}
    Should Be Equal    ${actual_insure_amount}    ${insure_amount}
    Should Be Equal    ${actual_remark}    ${remark}

Verify Textbox Value On Parcel Detail Step [Dry Parcel]
    [Arguments]    ${insure}    ${cod}    ${remark}
    ${insure_amount}=    Replace String    ${txtbox_insure_amount}    {value}    ${Booking['parcel_detail_insure_amount']}
    ${txtbox_parcel_remark}=    Replace String    ${txtbox_parcel_remark}    {value}    ${Booking['parcel_detail_remark']}
    ${actual_insure_amount}=    Get Value    ${insure_amount}
    ${actual_cod}=    Get Value    ${txtbox_cod}
    ${actual_remark}=    Get Text    ${txtbox_parcel_remark}
    Should Be Equal    ${actual_insure_amount}    ${insure}
    Should Be Equal    ${actual_cod}    ${cod}
    Should Be Equal    ${actual_remark}    ${remark}

Verify Textbox Value On Parcel Detail Step [Chilled Parcel]
    [Arguments]    ${cod}    ${remark}
    ${txtbox_insure_amount}=    Replace String    ${txtbox_insure_amount}    {value}    ${Booking['parcel_detail_insure_amount']}
    ${txtbox_parcel_remark}=    Replace String    ${txtbox_parcel_remark}    {value}    ${Booking['parcel_detail_remark']}
    ${actual_cod}=    Get Value    ${txtbox_cod}
    ${actual_remark}=    Get Text    ${txtbox_parcel_remark}
    Element Should Be Disabled    ${txtbox_insure_amount}
    Should Be Equal    ${actual_cod}    ${cod}
    Should Be Equal    ${actual_remark}    ${remark}

Verify Parcel Detail Page of Create Parcel [Chilled Parcel]
    [Arguments]    ${detail_S0}    ${detail_S1}    ${detail_S2}    ${detail_A1}    ${detail_A2}    ${insure_amount}    ${cod}    ${remark}
    ${btn_parcel_select_S0}=    Replace String    ${btn_parcel_select_S0}    {value}    ${Booking.chilled_parcel['parcel_S0']}
    ${actual_detail_S0}=    Get Text    ${btn_parcel_select_S0}
    ${actual_detail_S0}=  Replace String   ${actual_detail_S0}   \n   ${SPACE}
    ${btn_parcel_select_S1}=    Replace String    ${btn_parcel_select_S1}    {value}    ${Booking.chilled_parcel['parcel_S1']}
    ${actual_detail_S1}=    Get Text    ${btn_parcel_select_S1}
    ${actual_detail_S1}=  Replace String   ${actual_detail_S1}   \n   ${SPACE}
    ${btn_parcel_select_S2}=    Replace String    ${btn_parcel_select_S2}    {value}    ${Booking.chilled_parcel['parcel_S2']}
    ${actual_detail_S2}=    Get Text    ${btn_parcel_select_S2}
    ${actual_detail_S2}=  Replace String   ${actual_detail_S2}   \n   ${SPACE}
    ${btn_parcel_select_A1}=    Replace String    ${btn_parcel_select_A1}    {value}    ${Booking.chilled_parcel['parcel_A1']}
    ${actual_detail_A1}=    Get Text    ${btn_parcel_select_A1}
    ${actual_detail_A1}=  Replace String   ${actual_detail_A1}   \n   ${SPACE}
    ${btn_parcel_select_A2}=    Replace String    ${btn_parcel_select_A2}    {value}    ${Booking.chilled_parcel['parcel_A2']}
    ${actual_detail_A2}=    Get Text    ${btn_parcel_select_A2}
    ${actual_detail_A2}=  Replace String   ${actual_detail_A2}   \n   ${SPACE}
    ${txt_insure_amount}=    Replace String    ${txt_insure_amount}    {value}    ${Booking['parcel_detail_insure_amount']}
    ${actual_insure_amount}=    Get Text    ${txt_insure_amount}
    ${txt_cod}=    Replace String    ${txt_cod}    {value}    ${Booking['parcel_detail_cod']}
    ${actual_cod}=    Get Text    ${txt_cod}
    ${txt_remark}=    Replace String    ${txt_remark}    {value}    ${Booking['parcel_detail_remark']}
    ${actual_remark}=    Get Text    ${txt_remark}
    ${txtbox_insure_amount}=    Replace String    ${txtbox_insure_amount}    {value}    ${Booking['parcel_detail_insure_amount']}
    Should Be Equal    ${actual_detail_S0}    ${detail_S0}
    Should Be Equal    ${actual_detail_S1}    ${detail_S1}
    Should Be Equal    ${actual_detail_S2}    ${detail_S2}
    Should Be Equal    ${actual_detail_A1}    ${detail_A1}
    Should Be Equal    ${actual_detail_A2}    ${detail_A2}
    Should Be Equal    ${actual_cod}    ${cod}
    Should Be Equal    ${actual_insure_amount}    ${insure_amount}
    Should Be Equal    ${actual_remark}    ${remark}

Input Parcel Remark
    [Arguments]    ${value}
    ${txtbox_parcel_remark}=    Replace String    ${txtbox_parcel_remark}    {value}    ${Booking['parcel_detail_remark']}
    Input When Ready    ${txtbox_parcel_remark}    ${value}

Input Promotion
    [Arguments]    ${value}
    ${txtbox_promotion}=    Replace String    ${txtbox_promotion}    {value}    ${Booking['text_input_discount_code']}
    common.Input When Ready    ${txtbox_promotion}    ${value}

Click Use Code Button
    ${btn_use_code}=    Replace String    ${btn_use_code}    {value}    ${Booking['text_use_code']}
    Click When Ready    ${btn_use_code}

Click Use Coupon
    ${btn_use_coupon}=    Replace String    ${btn_use_coupon}    {value}    ${Booking['text_use_coupon']}
    common.Click When Ready    ${btn_use_coupon}

Verify Can Edit Selected Coupon And Code
    ${take_out_coupon}=    Replace String    ${btn_take_out_coupon}    {value}    ${Booking['text_take_out']}
    Element Should Be Enabled    ${take_out_coupon}

Click Take Out Coupon
    ${take_out_coupon}=    Replace String    ${btn_take_out_coupon}    {value}    ${Booking['text_take_out']}
    common.Click When Ready    ${take_out_coupon}

Verify Not Select Coupon And Code
    ${selected_coupon}=    Replace String    ${txt_selected_code_detail}    {value}    ${Booking['text_selected_coupon_and_code']}
    ${actual_text}=    Get Text    ${selected_coupon}
    ${actual_selected_code_detail}=  Replace String   ${actual_text}   \n   ${SPACE}
    Should Be Equal As Strings    ${actual_selected_code_detail}    ${Booking['text_selected_coupon_and_code']} ${Booking['text_no_data']}

Input COD
    [Arguments]    ${value}
    Input When Ready    ${txtbox_cod}    ${value}
    
Input Insurance
    [Arguments]    ${value}
    ${txtbox_insure_amount}=    Replace String    ${txtbox_insure_amount}    {value}    ${Booking['parcel_detail_insure_amount']}
    Input When Ready    ${txtbox_insure_amount}    ${value}

Verify Selected Coupon And Code
    [Arguments]    ${discount}    ${promotion_name}    ${parcel_size}    ${expired_date}    ${condition}    ${period}
    ${selected_coupon}=    Replace String    ${txt_selected_code_detail}    {value}    ${Booking['text_selected_coupon_and_code']}
    ${selected_coupon}    Get Text    ${selected_coupon}
    ${actual_selected_code_detail}=  Replace String   ${selected_coupon}   \n   ${SPACE}
    Should Be Equal As Strings    ${actual_selected_code_detail}
    ...    ${Booking['text_selected_coupon_and_code']} ${discount} ${promotion_name} ${parcel_size} ${Booking['text_expire']} ${expired_date} ${Booking['text_condition']} - ${condition} ${Booking['text_period']} ${period} ${Booking['text_take_out']}

Verify Booking Status After Cut Off Time
    [Arguments]    ${booking_id}    ${status}
    ${actual_booking_id}=    Replace String    ${txt_booking_status}    {id}    ${booking_id}
    ${actual_booking_status}=    Replace String    ${actual_booking_id}    {status}    ${status}
    Wait Until Element Is Visible    ${actual_booking_status}
    Scroll Element Into View    ${actual_booking_status}

Select Booking With Booking ID
    [Arguments]    ${booking_id}    ${status}
    ${actual_booking_id}=    Replace String    ${txt_booking_status}    {id}    ${booking_id}
    ${actual_booking_status}=    Replace String    ${actual_booking_id}    {status}    ${status}
    common.Click When Ready    ${actual_booking_status}