*** Keywords ***
Verify Return Business
    Wait Until Element Is Visible    ${txt_return_business_header}    timeout=${DEFAULT_TIMEOUT}
    Element Should Be Visible    ${txt_return_business_header}
    ${actual_header}=    Get Text    ${txt_return_business_header}
    Should Be Equal    ${actual_header}    ${sub_menu['return_business']}

Click Add Booking Button
    ${btn_add_booking}=    Replace String    ${btn_add_booking}    {value}    ${return_business['button_add']}
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
    ${btn_save}=    Replace String    ${btn_save_return_business}    {value}    ${return_business['button_save']}
    common.Click When Ready    ${btn_save}    
