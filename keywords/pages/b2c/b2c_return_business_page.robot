*** Keywords ***
Verify Return Business
    Wait Until Element Is Visible    ${txt_return_business_header}    timeout=${DEFAULT_TIMEOUT}
    Element Should Be Visible    ${txt_return_business_header}
    ${actual_header}=    Get Text    ${txt_return_business_header}
    Should Be Equal    ${actual_header}    ${sub_menu['return_business']}

Click Add Booking Button
    ${btn_add_booking}=    Replace String    ${btn_add_booking}    {value}    ${return_business['text_btn_add']}
    common.Click When Ready    ${btn_add_booking}

Verify Term & Condition 
    [Arguments]    ${txt_term_and_condition}    ${header_term_and_condition}
    ${btn_accept_terms_service}=    Replace String    ${btn_accept_terms_service}    {value}    ${Booking['text_accept_term_and_condition']}
    Wait Until Element Is Visible    ${btn_accept_terms_service}    timeout=30s
    ${actual_term_and_condition}=    Get Text    ${txt_term_and_condition}
    Should Be Equal    ${actual_term_and_condition}    ${actual_term_and_condition}

Click Accept Terms of Service
    common.Click When Ready    ${btn_accept_terms_service}

Click Accept Condition Button
    Sleep    3s
    ${btn_accept_condition}=    Replace String    ${btn_accept_condition}    {value}    ${return_business['text_accept_condition']}
    common.Click Xpath By JavaScript    ${btn_accept_condition}

Verify Label Link Return Business Popup
    [Arguments]    ${link_return_business}    ${link_name}    ${phone}    ${name}
    ...            ${shipping_payer}    ${location_pickup}    ${address}    ${postcode}
    
    Wait Until Element Is Visible    ${txt_link_return_business_header}   timeout=${DEFAULT_TIMEOUT}
    
    ${actual_link_return_business}=    Get Text    ${txt_link_return_business_header}
    ${actual_link_name}=    Get Text    ${txt_link_name_return_business}
    ${actual_phone}=    Get Text    ${txt_phone_return_business}
    ${actual_name}=    Get Text    ${txt_name_return_business}
    ${actual_shipping_payer}=    Get Text    ${txt_shipping_payer_return_business}
    ${actual_location_pickup}=    Get Text    ${txt_location_pickup_return_business}
    ${actual_address}=    Get Text    ${txt_address_return_business}
    ${actual_postcode}=    Get Text    ${txt_postcode_return_business}
    
    Should Be Equal    ${actual_link_return_business}    ${link_return_business}
    Should Be Equal    ${actual_link_name}    ${link_name}
    Should Be Equal    ${actual_phone}    ${phone}
    Should Be Equal    ${actual_name}    ${name}
    Should Be Equal    ${actual_shipping_payer}    ${shipping_payer}
    Should Be Equal    ${actual_location_pickup}    ${location_pickup}
    Should Be Equal    ${actual_address}    ${address}
    Should Be Equal    ${actual_postcode}    ${postcode}

Verify Data Link Return Business Popup
    [Arguments]    ${link_name}    ${phone}    ${name}    ${shipping_payer} 
    ...            ${location_pickup}    ${address}    ${postcode}
    
    ${txtbox_postcode}=    Replace String    ${opt_postcode_choice_return_business}    {value}    ${postcode}
    ${actual_opt_owner_pay}=    Replace String    ${opt_owner_pay_return_business}    {value}    ${shipping_payer}
    
    Run Keyword If    '${shipping_payer}' == 'บริษัทชำระค่าจัดส่ง'    
    ...    Element Should Be Visible    ${actual_opt_owner_pay}
    Run Keyword If    '${location_pickup}' == 'ส่งที่บ้าน'    Element Should Be Visible    ${tab_send_home_return_business}
    
    ${value_link_name}=    Get Value    ${txtbox_link_name_return_business}
    ${value_phone}=    Get Value    ${txtbox_phone_return_business}
    ${value_name}=    Get Value    ${txtbox_name_return_business}
    ${value_address}=    Get Text    ${txtbox_address_return_business}
    ${value_postcode}=    Get Text    ${txtbox_postcode}
    
    Should Be Equal    ${value_link_name}    ${link_name}
    Should Be Equal    ${value_phone}    ${phone}
    Should Be Equal    ${value_name}    ${name}
    Should Be Equal    ${value_address}    ${address}
    Should Be Equal    ${value_postcode}    ${postcode}

Clear Input
    common.Click Xpath By JavaScript    ${txtbox_link_name_delete}
    common.Click Xpath By JavaScript    ${txtbox_phone_delete}
    common.Click Xpath By JavaScript    ${txtbox_name_delete}
    common.Click Xpath By JavaScript    ${txtbox_address_delete}
    Mouse Over    ${txtbox_postcode_return_business}
    common.Click Xpath By JavaScript    ${txtbox_postcode_delete}

Input Link Name 
    [Arguments]    ${input_link_name}
    common.Input When Ready    ${txtbox_link_name_return_business}    ${input_link_name}

Input Phone Receiver
    [Arguments]    ${input_phone_receiver}
    common.Input When Ready    ${txtbox_phone_return_business}    ${input_phone_receiver}

Input Name Receiver
    [Arguments]    ${input_name_receiver}
    common.Input When Ready    ${txtbox_name_return_business}    ${input_name_receiver}

Input Address Receiver
    [Arguments]    ${input_address_receiver}
    common.Input When Ready    ${txtbox_address_return_business}    ${input_address_receiver}

Input Postcode Receiver
    [Arguments]    ${input_postcode_receiver}
    common.Input When Ready    ${txtbox_postcode_return_business}    ${input_postcode_receiver}

Click Postcode Receiver Lists
    [Arguments]    ${name}
    ${cbo_postcode_sender}=    Replace String    ${opt_postcode_choice_return_business}    {value}    ${name}
    common.Click Xpath By JavaScript    ${cbo_postcode_sender}

Click Owner Pay
    [Arguments]    ${owner}
    ${selected_owner}=    Replace String   ${opt_owner_pay_return_business}    {value}    ${owner}
    common.Click When Ready  ${selected_owner}

Select Send To Home Tab
    common.Click When Ready    ${tab_send_to_home}
    
Select Send To 7-ELEVEN Store Tab
    common.Click When Ready    ${tab_send_to_store}

Click Save Button
    ${btn_save}=    Replace String    ${btn_save_return_business}    {value}    ${return_business['text_btn_save']}
    common.Click When Ready    ${btn_save}

Verify New Booking
    [Arguments]    ${linkname}    ${name}    ${phone}    ${address}    ${postcode}
    Reload Page
    ${selected_card}=     Replace String    ${crd_booking_return_business}    {link_name}    ${linkname}
    ${selected_card}=     Replace String    ${selected_card}    {name}    ${name}
    ${selected_card}=     Replace String    ${selected_card}    {phone}    ${phone}
    ${selected_card}=     Replace String    ${selected_card}    {address}    ${address} ${postcode}
    Wait Until Element Is Visible    ${selected_card}    timeout=${DEFAULT_TIMEOUT}
    Page Should Contain Element    ${selected_card}

Click Booking Card
    [Arguments]    ${linkname}    ${name}    ${phone}    ${address}    ${postcode}

    ${selected_card}=     Replace String    ${crd_booking_return_business}    {link_name}    ${linkname}
    ${selected_card}=     Replace String    ${selected_card}    {name}    ${name}
    ${selected_card}=     Replace String    ${selected_card}    {phone}    ${phone}
    ${selected_card}=     Replace String    ${selected_card}    {address}    ${address} ${postcode}
    
    ${id_path}=    Set Variable    (${selected_card}${crd_id_booking_return_business})[2]
    ${booking_id}=    Get Text    ${id_path}
    ${BookingID}=    Set Variable    ${booking_id}
    Set Suite Variable    ${BookingID}
    
    common.Click When Ready    ${selected_card}

Verify Booking Popup
    [Arguments]    ${link_name}    ${phone}    ${name}    ${shipping_payer}    ${location_pickup}    ${address}    ${postcode}

    ${header_popup}=    Replace String    ${txt_topic_in_popup}    {value}    ${return_business['text_header_link_return_popup']}
    ${label_link_name}=    Get Text    ${txt_link_name_in_popup}
    ${txt_link_name}=    Get Element Attribute    ${txtbox_link_name_in_popup}    placeholder
    ${topic_receiver_info}=    Replace String    ${txt_topic_in_popup}    {value}    ${return_business['text_receiver_info']}
    ${label_phone}=    Get Text    ${txt_phone_in_popup}
    ${txt_phone}=    Get Element Attribute    ${txtbox_phone_in_popup}    placeholder
    ${label_name}=    Get Text    ${txt_name_in_popup}
    ${txt_name}=    Get Element Attribute    ${txtbox_name_in_popup}    placeholder
    ${topic_shipping_payer}=    Replace String    ${txt_topic_in_popup}    {value}    ${return_business['text_shipping_payer_popup']}
    ${txt_shipping_payer}=    Replace String    ${txt_shipping_payer_in_popup}    {label}    ${return_business['text_shipping_payer_popup']}
    ${txt_shipping_payer}=    Replace String    ${txt_shipping_payer}    {value}    ${shipping_payer}
    ${topic_pickup_location}=    Replace String    ${txt_topic_in_popup}    {value}    ${return_business['text_pickup_location']}
    ${txt_pickup_location}=    Replace String    ${txt_topic_in_popup}    {value}    ${location_pickup}
    ${label_address}=    Replace String    ${txt_address_in_popup}    {value}    ${return_business['text_address']}
    ${txt_address_path}=    Replace String    ${txtbox_address_in_popup}    {value}    ${return_business['text_address']}
    ${txt_address}=    Get Text    ${txt_address_path}
    ${topic_list_of_bookings}=    Replace String    ${txt_topic_in_popup}    {value}    ${return_business['text_address']}

    Wait Until Element Is Visible    ${header_popup}    timeout=${DEFAULT_TIMEOUT}
    # Should Be Equal As Strings    ${label_link_name} ${txt_link_name}    ${return_business['text_link_name']} ${link_name}
    Should Be Equal As Strings    ${label_link_name} ${txt_link_name}    ${return_business['text_link_name']} ${BookingID}
    Wait Until Element Is Visible    ${topic_receiver_info}
    Should Be Equal As Strings    ${label_phone} ${txt_phone}    ${return_business['text_phone']} ${phone}
    Should Be Equal As Strings    ${label_name} ${txt_name}    ${return_business['text_name']} ${name}
    Wait Until Element Is Visible    ${topic_shipping_payer}
    Wait Until Element Is Visible    ${txt_shipping_payer}
    Wait Until Element Is Visible    ${topic_pickup_location}
    Wait Until Element Is Visible    ${txt_pickup_location}
    Wait Until Element Is Visible    ${label_address}
    Should Be Equal As Strings    ${txt_address}    ${address} ${postcode}
    Wait Until Element Is Visible    ${topic_list_of_bookings}



Click Download QR Code Button
    ${btn_add_download_qr}=    Replace String    ${btn_popup_return_business}    {value}    ${return_business['text_btn_download_qr']}
    common.Click When Ready    ${btn_add_download_qr}

Verrify Download QR Code
    [Arguments]    ${value}
    ${popup_download_qr}=    Replace String    ${msg_popup_success}    {value}    ${value}
    Wait Until Element Is Visible    ${popup_download_qr}    timeout=${DEFAULT_TIMEOUT}
    Page Should Contain Element    ${popup_download_qr}

Click Copy Link Button
    ${btn_add_copy_link}=    Replace String    ${btn_popup_return_business}    {value}    ${return_business['text_btn_copy_link']}
    common.Click When Ready    ${btn_add_copy_link}

Verify Copy Link
    [Arguments]    ${value}  
    ${popup_copy_link}=    Replace String    ${msg_popup_success}    {value}    ${value}
    Wait Until Element Is Visible    ${popup_copy_link}    timeout=${DEFAULT_TIMEOUT}
    Page Should Contain Element    ${popup_copy_link}
    ${Link_booking_return}=    Evaluate    __import__('clipboard').paste()    modules=clipboard
    Should Be Equal    ${Link_booking_return}    ${return_business['text_link_booking']}${BookingID}
    Set Suite Variable    ${Link_booking_return}

Input Trigger Phone Number
    [Arguments]    ${phone_number}
    common.Input When Ready    ${b2c_txtbox_trigger_phone_number}    ${phone_number}

Click Confirm Button
    common.Click When Ready    ${b2c_btn_confirm_phone_number}

Verify Booking Detail Page [Not Have Parcel List]
    [Arguments]    ${booking_id}    ${booking_name}    ${discount_value}    ${insurance_fee_value}    ${cod_fee_value}    
    ...    ${total_price_amount}    ${total_price_value}

    ${txt_booking_list} =  Replace String    ${txt_heading_booking_list}    {value}    ${return_business.email_link['text_title_booking_list']}
    ${txt_booking_id}=    Replace String    ${txt_booking_id_return_business}    {value}    ${return_business.email_link['text_booking_id_label']}
    ${txt_booking_name}=    Replace String    ${txt_booking_name_return_business}    {value}    ${return_business.email_link['text_booking_name_label']}
    ${txt_booking_time}=    Replace String    ${txt_booking_time_return_business}    {value}    ${return_business.email_link['text_booking_time_label']}
    ${txt_shipping_origin}=    Replace String    ${txt_shipping_origin_return_business}    {value}    ${return_business.email_link['text_shipping_origin']}
    ${txt_parcel_list}=    Replace String    ${txt_heading_parcel_list_return_business}    {value}    ${return_business.email_link['text_title_parcel_list']}
    ${txt_summary_booking}=    Replace String    ${txt_heading_summary_booking_return_business}    {value}    ${return_business.email_link['text_title_booking_summary']}
    ${txt_discount}=    Replace String    ${txt_discount_return_business}    {value}    ${return_business.email_link['text_dixcount']}
    ${txt_insure}=    Replace String    ${txt_insure_return_business}    {value}    ${return_business.email_link['text_insure']}
    ${txt_cod}=    Replace String    ${txt_cod_return_business}    {value}    ${return_business.email_link['text_cod']}
    ${txt_total}=    Replace String    ${txt_total_return_business}    {value}    ${return_business.email_link['text_total_price']}

    ${actual_booking_id}=    Get Text    ${txt_booking_id}
    ${actual_booking_name}=    Get Text    ${txt_booking_name}
    ${actaul_booking_time}=    Get Text    ${txt_booking_time}
    Scroll Element Into View    ${txt_total}
    ${actual_discount}=    Get Text    ${txt_discount}
    # ${actual_insure}=    Get Text    ${txt_insure}
    # ${actual_cod}=    Get Text    ${txt_cod}
    ${actual_total}=    Get Text    ${txt_total}

    ${booking_time}    Split String And Select    ${actaul_booking_time}    \n    1
    ${time_convert}    Convert Date    ${booking_time}    date_format=%d-%m-%Y %H:%M    result_format=%d-%m-%Y %H:%M

    Wait Until Element Is Visible    ${txt_booking_list}
    Should Be Equal    ${actual_booking_id}    ${booking_id}
    Should Be Equal    ${actual_booking_name}    ${booking_name}
    Should Be Equal As Strings    ${booking_time}   ${time_convert}
    Wait Until Element Is Visible    ${txt_shipping_origin}
    Wait Until Element Is Visible    ${txt_parcel_list}
    Should Be Equal    ${actual_discount}    ${return_business.email_link['text_dixcount']} ${discount_value}
    # Should Be Equal    ${actual_insure}    ${Booking['text_insure']} ${insurance_fee_value}
    # Should Be Equal    ${actual_cod}    ${Booking['text_cod']} ${cod_fee_value}
    Should Be Equal    ${actual_total}    ${return_business.email_link['text_total_price']} ${total_price_amount} ${total_price_value}
    common.Scroll Window To Vertical    0

Click Add Parcel Button
    common.Scroll Window To Vertical    0
    common.Click When Ready    ${btn_add_parcel_return_business}

Verify Create Parcel Popup
    [Arguments]    ${sender_info}    ${text_phone}    ${text_name}    ${text_address}    ${text_address_full}
    ...    ${parcel_detail_A4}    ${parcel_detail_A3}    ${parcel_detail_XS}    ${parcel_detail_S}    ${parcel_detail_M}
    ...    ${parcel_detail_L}    ${parcel_detail_XL}    ${parcel_detail_XXL}    ${remark}
    ${txt_title}=    Replace String    ${txt_return_business_return_business}    {value}    ${return_business.email_link['text_title']}
    ${txt_sender_info}=    Replace String    ${txt_sender_info_return_business}    {value}    ${sender_info}
    ${txt_parcel_A4}=    Replace String    ${txt_list_parcel_size_return_business}    {value}    ${return_business.email_link['parcel_A4']}
    ${txt_parcel_A3}=    Replace String    ${txt_list_parcel_size_return_business}    {value}    ${return_business.email_link['parcel_A3']}
    ${txt_parcel_XS}=    Replace String    ${txt_list_parcel_size_return_business}    {value}    ${return_business.email_link['parcel_XS']}
    ${txt_parcel_S}=    Replace String    ${txt_list_parcel_size_return_business}    {value}    ${return_business.email_link['parcel_S']}
    ${txt_parcel_M}=    Replace String    ${txt_list_parcel_size_return_business}    {value}    ${return_business.email_link['parcel_M']}
    ${txt_parcel_L}=    Replace String    ${txt_list_parcel_size_return_business}    {value}    ${return_business.email_link['parcel_L']}
    ${txt_parcel_XL}=    Replace String    ${txt_list_parcel_size_return_business}    {value}    ${return_business.email_link['parcel_XL']}
    ${txt_parcel_XXL}=    Replace String    ${txt_list_parcel_size_return_business}    {value}    ${return_business.email_link['parcel_XXL']}

    Wait Until Element Is Visible    ${txt_title}    timeout=${DEFAULT_TIMEOUT}
    Wait Until Element Is Visible    ${txt_sender_info}

    ${actual_sender_phone}=    Get Text    ${txt_sender_phone_return_business}
    ${actual_sender_name}=    Get Text    ${txt_sender_name_return_business}
    ${actual_sender_address}=    Get Text    ${txt_sender_address_return_business}
    ${actual_sender_address_full}=    Get Text    ${txt_sender_address_full_return_business}
    ${actual_remark}=    Get Text    ${txt_remark_full_return_business}
    ${actual_parcel_A4}=    Get Text    ${txt_parcel_A4}
    ${actual_parcel_A4}=    Replace String    ${actual_parcel_A4}    \n    ${SPACE}
    ${actual_parcel_A3}=    Get Text    ${txt_parcel_A3}
    ${actual_parcel_A3}=    Replace String    ${actual_parcel_A3}    \n    ${SPACE}
    ${actual_parcel_XS}=    Get Text    ${txt_parcel_XS}
    ${actual_parcel_XS}=    Replace String    ${actual_parcel_XS}    \n    ${SPACE}
    ${actual_parcel_S}=    Get Text    ${txt_parcel_S}
    ${actual_parcel_S}=    Replace String    ${actual_parcel_S}    \n    ${SPACE}
    ${actual_parcel_M}=    Get Text    ${txt_parcel_M}
    ${actual_parcel_M}=    Replace String    ${actual_parcel_M}    \n    ${SPACE}
    ${actual_parcel_L}=    Get Text    ${txt_parcel_L}
    ${actual_parcel_L}=    Replace String    ${actual_parcel_L}    \n    ${SPACE}
    ${actual_parcel_XL}=    Get Text    ${txt_parcel_XL}
    ${actual_parcel_XL}=    Replace String    ${actual_parcel_XL}    \n    ${SPACE}
    ${actual_parcel_XXL}=    Get Text    ${txt_parcel_XXL}
    ${actual_parcel_XXL}=    Replace String    ${actual_parcel_XXL}    \n    ${SPACE}

    Should Be Equal    ${actual_sender_phone}    ${text_phone}
    Should Be Equal    ${actual_sender_name}    ${text_name}
    Should Be Equal    ${actual_sender_address}    ${text_address}
    Should Be Equal    ${actual_sender_address_full}    ${text_address_full}
    Should Be Equal    ${actual_parcel_A4}    ${parcel_detail_A4}
    Should Be Equal    ${actual_parcel_A3}    ${parcel_detail_A3}
    Should Be Equal    ${actual_parcel_XS}    ${parcel_detail_XS}
    Should Be Equal    ${actual_parcel_S}    ${parcel_detail_S}
    Should Be Equal    ${actual_parcel_M}    ${parcel_detail_M}
    Should Be Equal    ${actual_parcel_L}    ${parcel_detail_L}
    Should Be Equal    ${actual_parcel_XL}    ${parcel_detail_XL}
    Should Be Equal    ${actual_parcel_XXL}    ${parcel_detail_XXL}
    Should Be Equal    ${actual_remark}    ${remark}

Input Sender Phone
    [Arguments]    ${phone}
    common.Input When Ready    ${txtbox_sender_phone_return_business}    ${phone}

Input Sender Name
    [Arguments]    ${name}
    common.Input When Ready    ${txtbox_sender_name_return_business}    ${name}






