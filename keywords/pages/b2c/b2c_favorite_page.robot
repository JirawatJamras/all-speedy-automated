*** Keywords**
########## Sender Tab ############
Select Sender Tab
    ${tab_sender_favorite_page}=    Replace String    ${tab_sender_favorite_page}    {value}    ${favorite['text_parcel_sender']}
    common.Scroll Window To Vertical    0
    common.Click When Ready    ${tab_sender_favorite_page}

Verify Display Sender Card
    [Arguments]    ${sender_favorite_name}    ${sender_name}    ${sender_phone}    ${sender_address}    ${sender_postcode_full}
    ${card_sender_favorite_page}=    Replace String    ${card_sender_favorite_page}    {favorite_name}    ${sender_favorite_name}
    ${card_sender_favorite_page}=    Replace String    ${card_sender_favorite_page}    {name}    ${sender_name}
    ${card_sender_favorite_page}=    Replace String    ${card_sender_favorite_page}    {phone}    ${sender_phone}
    ${card_sender_favorite_page}=    Replace String    ${card_sender_favorite_page}    {address}    ${sender_address} ${sender_postcode_full}
    Sleep  2s
    # Wait Until Element Is Visible    ${card_skelton_favorite_page}    timeout=${DEFAULT_TIMEOUT}
    # Wait Until Element Is Not Visible    ${card_skelton_favorite_page}    timeout=${DEFAULT_TIMEOUT}
    Scroll Element Into View    ${card_sender_favorite_page}
    Wait Until Element Is Visible    ${card_sender_favorite_page}    timeout=${DEFAULT_TIMEOUT}
    ${actual_sender_favorite}=    Get Text    ${card_sender_favorite_page}
    ${actual_sender_favorite}=    Replace String    ${actual_sender_favorite}    \n    ${SPACE}
    Should Be Equal As Strings    ${actual_sender_favorite}    ${sender_favorite_name} ชื่อ : ${sender_name} เบอร์โทรศัพท์ : ${sender_phone} ที่อยู่ : ${sender_address} ${sender_postcode_full}

Verify Display Sender Card After Edit Data
    [Arguments]    ${sender_favorite_name}    ${sender_name}    ${sender_phone}    ${sender_address}    ${sender_postcode_full}
    ${card_sender_favorite_page}=    Replace String    ${card_sender_favorite_page}    {favorite_name}    ${sender_favorite_name}
    ${card_sender_favorite_page}=    Replace String    ${card_sender_favorite_page}    {name}    ${sender_name}
    ${card_sender_favorite_page}=    Replace String    ${card_sender_favorite_page}    {phone}    ${sender_phone}
    ${card_sender_favorite_page}=    Replace String    ${card_sender_favorite_page}    {address}    ${sender_address} ${sender_postcode_full}
    Sleep  2s
    # Wait Until Element Is Visible    ${card_skelton_favorite_page}    timeout=${DEFAULT_TIMEOUT}
    # Wait Until Element Is Not Visible    ${card_skelton_favorite_page}    timeout=${DEFAULT_TIMEOUT}
    Wait Until Element Is Visible    ${msg_successfully_favorite_page}    timeout=${DEFAULT_TIMEOUT}
    ${update_favorite_successfully}=    Get Text    ${msg_successfully_favorite_page}
    Should Be Equal    ${update_favorite_successfully}    ${favorite['text_updated_successfully']}
    Wait Until Element Is Not Visible    ${msg_successfully_favorite_page}    timeout=${DEFAULT_TIMEOUT}
    Scroll Element Into View    ${card_sender_favorite_page}
    Wait Until Element Is Visible    ${card_sender_favorite_page}    timeout=${DEFAULT_TIMEOUT}
    ${actual_sender_favorite}=    Get Text    ${card_sender_favorite_page}
    ${actual_sender_favorite}=    Replace String    ${actual_sender_favorite}    \n    ${SPACE}
    Should Be Equal As Strings    ${actual_sender_favorite}    ${sender_favorite_name} ชื่อ : ${sender_name} เบอร์โทรศัพท์ : ${sender_phone} ที่อยู่ : ${sender_address} ${sender_postcode_full}

Verify Display Sender Card After Add New
    [Arguments]    ${sender_favorite_name}    ${sender_name}    ${sender_phone}    ${sender_address}    ${sender_postcode_full}
    Wait Until Page Contains Element    ${card_skelton_favorite_page}    timeout=${DEFAULT_TIMEOUT}
    Wait Until Page Does Not Contain Element    ${card_skelton_favorite_page}    timeout=${DEFAULT_TIMEOUT}
    ${card_sender_favorite_page}=    Replace String    ${card_sender_favorite_page}    {favorite_name}    ${sender_favorite_name}
    ${card_sender_favorite_page}=    Replace String    ${card_sender_favorite_page}    {name}    ${sender_name}
    ${card_sender_favorite_page}=    Replace String    ${card_sender_favorite_page}    {phone}    ${sender_phone}
    ${card_sender_favorite_page}=    Replace String    ${card_sender_favorite_page}    {address}    ${sender_address} ${sender_postcode_full}
    ${add_favorite_successfully}=    Get Text    ${msg_successfully_favorite_page}
    Should Be Equal    ${add_favorite_successfully}    ${favorite['text_added_successfully']}
    Wait Until Element Is Not Visible    ${msg_successfully_favorite_page}    timeout=${DEFAULT_TIMEOUT}
    Scroll Element Into View    ${card_sender_favorite_page}
    Wait Until Element Is Visible    ${card_sender_favorite_page}    timeout=${DEFAULT_TIMEOUT}
    ${actual_sender_favorite}=    Get Text    ${card_sender_favorite_page}
    ${actual_sender_favorite}=    Replace String    ${actual_sender_favorite}    \n    ${SPACE}
    Should Be Equal As Strings    ${actual_sender_favorite}    ${sender_favorite_name} ชื่อ : ${sender_name} เบอร์โทรศัพท์ : ${sender_phone} ที่อยู่ : ${sender_address} ${sender_postcode_full}

Click Sender Card
   [Arguments]    ${sender_favorite_name}    ${sender_name}    ${sender_phone}    ${sender_address}    ${sender_postcode_full}
    ${card_sender_favorite_page}=    Replace String    ${card_sender_favorite_page}    {favorite_name}    ${sender_favorite_name}
    ${card_sender_favorite_page}=    Replace String    ${card_sender_favorite_page}    {name}    ${sender_name}
    ${card_sender_favorite_page}=    Replace String    ${card_sender_favorite_page}    {phone}    ${sender_phone}
    ${card_sender_favorite_page}=    Replace String    ${card_sender_favorite_page}    {address}    ${sender_address} ${sender_postcode_full}
    common.Click When Ready    ${card_sender_favorite_page}

Verify Label Sender
    [Arguments]    ${text_sender_data}    ${sender_favorite_name}   ${sender_phone}    ${sender_name}    ${sender_address}    ${sender_full_postcode}
    Wait Until Element Is Visible    ${txt_sender_data_in_popup_favorite_page}    timeout=${DEFAULT_TIMEOUT}
    ${actual_text_sender_data}=    Get Text    ${txt_sender_data_in_popup_favorite_page}
    ${actual_text_sender_favorite_name}=    Get Text    ${txt_sender_favorite_name_in_popup_favorite_page}
    ${actual_text_sender_phone}=    Get Text    ${txt_sender_phone_in_popup_favorite_page}
    ${actual_text_sender_name}=    Get Text    ${txt_sender_name_in_popup_favorite_page}
    ${actual_text_sender_address}=    Get Text    ${txt_sender_address_in_popup_favorite_page}
    ${actual_text_sender_postcode}=    Get Text    ${txt_sender_postcode_in_popup_favorite_page}
    Should Be Equal    ${actual_text_sender_data}    ${text_sender_data}
    Should Be Equal    ${actual_text_sender_favorite_name}    ${sender_favorite_name}
    Should Be Equal    ${actual_text_sender_phone}    ${sender_phone}
    Should Be Equal    ${actual_text_sender_name}    ${sender_name}
    Should Be Equal    ${actual_text_sender_address}    ${sender_address}
    Should Be Equal    ${actual_text_sender_postcode}    ${sender_full_postcode}

Verify Data Sender In Read-Only Mode
    [Arguments]    ${sender_favorite_name}   ${sender_name}    ${sender_phone}    ${sender_address}    ${sender_full_postcode}
    ${actual_value_sender_favorite_name}=    Get Value    ${txtbox_sender_favorite_name_favorite_page}
    ${actual_value_sender_phone}=    Get Value    ${txtbox_sender_phone_favorite_page}
    ${actual_value_sender_name}=    Get Value    ${txtbox_sender_name_favorite_page}
    ${actual_value_sender_address}=    Get Text    ${txtbox_sender_address_favorite_page}
    ${actual_value_sender_full_postcode}=    Get Text    ${txtbox_sender_postcode_value_favorite_page}
    Should Be Equal    ${actual_value_sender_favorite_name}    ${sender_favorite_name}
    Element Should Be Disabled    ${txtbox_sender_favorite_name_favorite_page}
    Should Be Equal    ${actual_value_sender_phone}    ${sender_phone}
    Element Should Be Disabled    ${txtbox_sender_phone_favorite_page}
    Should Be Equal    ${actual_value_sender_name}    ${sender_name}
    Element Should Be Disabled    ${txtbox_sender_name_favorite_page}
    Should Be Equal    ${actual_value_sender_address}    ${sender_address}
    Element Should Be Disabled    ${txtbox_sender_address_favorite_page}
    Should Be Equal    ${actual_value_sender_full_postcode}    ${sender_full_postcode}
    Element Should Be Disabled    ${txtbox_sender_postcode_favorite_page}

Verify Data Sender
    [Arguments]    ${sender_favorite_name}   ${sender_name}    ${sender_phone}    ${sender_address}    ${sender_full_postcode}
    ${actual_value_sender_favorite_name}=    Get Value    ${txtbox_sender_favorite_name_favorite_page}
    ${actual_value_sender_phone}=    Get Value    ${txtbox_sender_phone_favorite_page}
    ${actual_value_sender_name}=    Get Value    ${txtbox_sender_name_favorite_page}
    ${actual_value_sender_address}=    Get Text    ${txtbox_sender_address_favorite_page}
    ${actual_value_sender_full_postcode}=    Get Text    ${txtbox_sender_postcode_value_favorite_page}
    Should Be Equal    ${actual_value_sender_favorite_name}    ${sender_favorite_name}
    Element Should Not Contain    ${txtbox_sender_favorite_name_favorite_page}    disabled
    Should Be Equal    ${actual_value_sender_phone}    ${sender_phone}
    Element Should Not Contain    ${txtbox_sender_phone_favorite_page}    disabled
    Should Be Equal    ${actual_value_sender_name}    ${sender_name}
    Element Should Not Contain    ${txtbox_sender_name_favorite_page}    disabled
    Should Be Equal    ${actual_value_sender_address}    ${sender_address}
    Element Should Not Contain    ${txtbox_sender_address_favorite_page}    disabled
    Should Be Equal    ${actual_value_sender_full_postcode}    ${sender_full_postcode}
    Element Should Not Contain    ${txtbox_sender_postcode_favorite_page}    disabled

Click Edit Button
    ${btn_edit_data_favorite_page}=    Replace String    ${btn_edit_data_favorite_page}    {value}    ${favorite['button_edit']}
    common.Click When Ready    ${btn_edit_data_favorite_page}

Edit Sender Favorite Name
    [Arguments]    ${value}
    common.Click When Ready    ${btn_sender_clear_favorite_name_favorite_page}
    common.Input When Ready    ${txtbox_sender_favorite_name_favorite_page}    ${value}

Input Sender Favorite Name
    [Arguments]    ${value}
    common.Input When Ready    ${txtbox_sender_favorite_name_favorite_page}    ${value}

Click Save Edit Button
    ${btn_save_edit_data_favorite_page}=    Replace String    ${btn_save_edit_data_favorite_page}    {value}    ${favorite['button_save_edit']}
    common.Click When Ready    ${btn_save_edit_data_favorite_page}

Click Add Sender Button
    ${btn_add_sender_favorite_page}=    Replace String    ${btn_add_sender_favorite_page}    {value}    ${favorite['button_add']}
    Scroll Element Into View    ${btn_add_sender_favorite_page}
    common.Click When Ready    ${btn_add_sender_favorite_page}

Input Sender Phone Number
    [Arguments]    ${value}
    common.Input When Ready    ${txtbox_sender_phone_favorite_page}    ${value}

Input Sender Name
    [Arguments]    ${value}
    common.Input When Ready    ${txtbox_sender_name_favorite_page}    ${value}

Input Sender Address
    [Arguments]    ${value}
    common.Input When Ready    ${txtbox_sender_address_favorite_page}    ${value}
    
Input Sender Postcode
    [Arguments]    ${value}
    common.Input When Ready    ${txtbox_sender_postcode_favorite_page}    ${value}

Select Sender Postcode List
    [Arguments]    ${postcode}
    ${cbo_sender_address_favorite_page}=    Replace String    ${cbo_sender_address_favorite_page}    {value}    ${postcode}
    common.Click When Ready    ${cbo_sender_address_favorite_page}

Click Save Button
    ${btn_save_data_favorite_page}=    Replace String    ${btn_save_data_favorite_page}    {value}    ${favorite['button_save']}
    common.Click When Ready    ${btn_save_data_favorite_page}

########## Receiver Tab ############
Select Receiver Tab
    ${tab_receiver_favorite_page}=    Replace String    ${tab_receiver_favorite_page}    {value}    ${favorite['text_parcel_receiver']}
    common.Scroll Window To Vertical    0
    common.Click When Ready    ${tab_receiver_favorite_page}

Verify Display Receiver Card When Select Home
    [Arguments]    ${receiver_favorite_name}    ${receiver_name}    ${receiver_phone}    ${receiver_address}    ${receiver_postcode_full}
    Sleep  2s
    # Wait Until Element Is Visible    ${card_skelton_favorite_page}    timeout=${DEFAULT_TIMEOUT}
    # Wait Until Element Is Not Visible    ${card_skelton_favorite_page}    timeout=${DEFAULT_TIMEOUT}
    ${card_receiver_send_home_favorite_page} =    Replace String    ${card_receiver_send_home_favorite_page}    {favorite_name}    ${receiver_favorite_name}
    ${card_receiver_send_home_favorite_page}=    Replace String    ${card_receiver_send_home_favorite_page}    {name}    ${receiver_name}
    ${card_receiver_send_home_favorite_page}=    Replace String    ${card_receiver_send_home_favorite_page}    {phone}    ${receiver_phone}
    ${card_receiver_send_home_favorite_page}=    Replace String    ${card_receiver_send_home_favorite_page}    {address}    ${receiver_address} ${receiver_postcode_full}
    Scroll Element Into View    ${card_receiver_send_home_favorite_page}
    Wait Until Page Contains Element    ${card_receiver_send_home_favorite_page}    timeout=${DEFAULT_TIMEOUT}
    ${actual_receiver_favorite}=    Get Text    ${card_receiver_send_home_favorite_page}
    ${actual_receiver_favorite}=    Replace String    ${actual_receiver_favorite}    \n    ${SPACE}
    Should Be Equal As Strings    ${actual_receiver_favorite}    ${receiver_favorite_name} ชื่อ : ${receiver_name} เบอร์โทรศัพท์ : ${receiver_phone} ที่อยู่ : ${receiver_address} ${receiver_postcode_full}

Verify Display Receiver Card When Select 7-ELEVEN Store
    [Arguments]    ${receiver_favorite_name}    ${receiver_name}    ${receiver_phone}    ${receiver_address}
    Sleep  2s
    # Wait Until Element Is Visible    ${card_skelton_favorite_page}    timeout=${DEFAULT_TIMEOUT}
    # Wait Until Element Is Not Visible    ${card_skelton_favorite_page}    timeout=${DEFAULT_TIMEOUT}
    ${card_receiver_send_store_favorite_page} =    Replace String    ${card_receiver_send_store_favorite_page}    {favorite_name}    ${receiver_favorite_name}
    ${card_receiver_send_store_favorite_page}=    Replace String    ${card_receiver_send_store_favorite_page}    {name}    ${receiver_name}
    ${card_receiver_send_store_favorite_page}=    Replace String    ${card_receiver_send_store_favorite_page}    {phone}    ${receiver_phone}
    ${card_receiver_send_store_favorite_page}=    Replace String    ${card_receiver_send_store_favorite_page}    {address}    ${receiver_address}
    Scroll Element Into View    ${card_receiver_send_store_favorite_page}
    Wait Until Page Contains Element    ${card_receiver_send_store_favorite_page}    timeout=${DEFAULT_TIMEOUT}
    ${actual_receiver_favorite}=    Get Text    ${card_receiver_send_store_favorite_page}
    ${actual_receiver_favorite}=    Replace String    ${actual_receiver_favorite}    \n    ${SPACE}
    Should Be Equal As Strings    ${actual_receiver_favorite}    ${receiver_favorite_name} ชื่อ : ${receiver_name} เบอร์โทรศัพท์ : ${receiver_phone} ที่อยู่ : ${receiver_address}

Click Receiver Card
    [Arguments]    ${receiver_favorite_name}    ${receiver_name}    ${receiver_phone}    ${receiver_address}    ${receiver_postcode_full}
    ${card_receiver_send_home_favorite_page}=    Replace String    ${card_receiver_send_home_favorite_page}    {favorite_name}    ${receiver_favorite_name}
    ${card_receiver_send_home_favorite_page}=    Replace String    ${card_receiver_send_home_favorite_page}    {name}    ${receiver_name}
    ${card_receiver_send_home_favorite_page}=    Replace String    ${card_receiver_send_home_favorite_page}    {phone}    ${receiver_phone}
    ${card_receiver_send_home_favorite_page}=    Replace String    ${card_receiver_send_home_favorite_page}    {address}    ${receiver_address} ${receiver_postcode_full}
    common.Click When Ready    ${card_receiver_send_home_favorite_page}

Verify Label Receiver
    [Arguments]    ${text_receiver_data}    ${reciever_favorite_name}   ${receiver_phone}    ${receiver_name}    
    ...            ${receiver_location_pickup}    ${receiver_address}    ${receiver_full_postcode}
    Wait Until Element Is Visible    ${txt_receiver_data_in_popup_favorite_page}    timeout=${DEFAULT_TIMEOUT}
    ${txt_receiver_location_pickup_in_popup_favorite_page}=    Replace String    ${txt_receiver_location_pickup_in_popup_favorite_page}    {value}    ${favorite.label_reciever_favorite['text_location_pickup']}
    ${actual_text_receiver_data}=    Get Text    ${txt_receiver_data_in_popup_favorite_page}
    ${actual_text_receiver_favorite_name}=    Get Text    ${txt_receiver_favorite_name_in_popup_favorite_page}
    ${actual_text_receiver_phone}=    Get Text    ${txt_receiver_phone_in_popup_favorite_page}
    ${actual_text_receiver_name}=    Get Text    ${txt_receiver_name_in_popup_favorite_page}
    ${actaul_text_receiver_location_pickup}=    Get Text    ${txt_receiver_location_pickup_in_popup_favorite_page}
    ${actual_text_receiver_address}=    Get Text    ${txt_receiver_address_in_popup_favorite_page}
    ${actual_text_receiver_postcode}=    Get Text    ${txt_receiver_postcode_in_popup_favorite_page}
    Should Be Equal    ${actual_text_receiver_data}    ${text_receiver_data}
    Should Be Equal    ${actual_text_receiver_favorite_name}    ${reciever_favorite_name}
    Should Be Equal    ${actual_text_receiver_phone}    ${receiver_phone}
    Should Be Equal    ${actual_text_receiver_name}    ${receiver_name}
    Should Be Equal    ${actaul_text_receiver_location_pickup}    ${receiver_location_pickup}
    Should Be Equal    ${actual_text_receiver_address}    ${receiver_address}
    Should Be Equal    ${actual_text_receiver_postcode}    ${receiver_full_postcode}

Verify Data Recevier In Read-Only Mode
    [Arguments]    ${receiver_favorite_name}   ${receiver_name}    ${receiver_phone}    
    ...            ${reciever_location_pickup}    ${receiver_address}    ${receiver_full_postcode}
    Wait Until Element Is Visible    ${txt_receiver_data_in_popup_favorite_page}    timeout=${DEFAULT_TIMEOUT}
    ${actual_receiver_data_in_popup_favorite_page}=    Get Text    ${txt_receiver_data_in_popup_favorite_page}
    ${actual_value_receiver_favorite_name}=    Get Value    ${txtbox_receiver_favorite_name_favorite_page}
    ${actual_value_receiver_phone}=    Get Value    ${txtbox_receiver_phone_favorite_page}
    ${actual_value_receiver_name}=    Get Value    ${txtbox_receiver_name_favorite_page}
    ${actual_value_receiver_address}=    Get Text    ${txtbox_receiver_address_favorite_page}
    ${actual_value_receiver_full_postcode}=    Get Text    ${txtbox_receiver_postcode_value_favorite_page}
    Should Be Equal    ${actual_value_receiver_favorite_name}    ${receiver_favorite_name}
    Element Should Be Disabled    ${txtbox_receiver_favorite_name_favorite_page}
    Should Be Equal    ${actual_value_receiver_phone}    ${receiver_phone}
    Element Should Be Disabled    ${txtbox_receiver_phone_favorite_page}
    Should Be Equal    ${actual_value_receiver_name}    ${receiver_name}
    Element Should Be Disabled    ${txtbox_receiver_name_favorite_page}
    Run Keyword If    '${reciever_location_pickup}' == 'ส่งที่บ้าน'    Element Should Be Visible    ${tab_selected_send_home_favorite_page}
    Run Keyword If    '${reciever_location_pickup}' == 'ส่งร้าน 7-11'    Element Should Be Visible    ${tab_selected_send_store_favorite_page}
    Should Be Equal    ${actual_value_receiver_address}    ${receiver_address}
    Element Should Be Disabled    ${txtbox_receiver_address_favorite_page}
    Should Be Equal    ${actual_value_receiver_full_postcode}    ${receiver_full_postcode}
    Element Should Be Disabled    ${txtbox_receiver_postcode_favorite_page}

Verify Data Receiver
    [Arguments]    ${receiver_favorite_name}   ${receiver_name}    ${receiver_phone}    
    ...            ${reciever_location_pickup}    ${receiver_address}    ${receiver_full_postcode}
    ${actual_value_receiver_favorite_name}=    Get Value    ${txtbox_receiver_favorite_name_favorite_page}
    ${actual_value_receiver_phone}=    Get Value    ${txtbox_receiver_phone_favorite_page}
    ${actual_value_receiver_name}=    Get Value    ${txtbox_receiver_name_favorite_page}
    ${actual_value_receiver_address}=    Get Text    ${txtbox_receiver_address_favorite_page}
    ${actual_value_receiver_full_postcode}=    Get Text    ${txtbox_receiver_postcode_value_favorite_page}
    Should Be Equal    ${actual_value_receiver_favorite_name}    ${receiver_favorite_name}
    Element Should Not Contain    ${txtbox_receiver_favorite_name_favorite_page}    disabled
    Should Be Equal    ${actual_value_receiver_phone}    ${receiver_phone}
    Element Should Not Contain    ${txtbox_receiver_phone_favorite_page}    disabled
    Should Be Equal    ${actual_value_receiver_name}    ${receiver_name}
    Element Should Not Contain    ${txtbox_receiver_name_favorite_page}    disabled
    Run Keyword If    '${reciever_location_pickup}' == 'ส่งที่บ้าน'    Element Should Be Visible    ${tab_selected_send_home_favorite_page}
    Run Keyword If    '${reciever_location_pickup}' == 'ส่งร้าน 7-11'    Element Should Be Visible    ${tab_selected_send_home_favorite_page}
    Should Be Equal    ${actual_value_receiver_address}    ${receiver_address}
    Element Should Not Contain    ${txtbox_receiver_address_favorite_page}    disabled
    Should Be Equal    ${actual_value_receiver_full_postcode}    ${receiver_full_postcode}
    Element Should Not Contain    ${txtbox_receiver_postcode_favorite_page}    disabled

Select Pickup Location
    [Arguments]    ${value}
    Run Keyword If    '${value}' == 'ส่งที่บ้าน'    Run Keywords    Scroll Element Into View    ${tab_send_home_favorite_page}
    ...    AND    common.Click When Ready    ${tab_send_home_favorite_page}
    Run Keyword If    '${value}' == 'ส่งร้าน 7-11'    Run Keywords    Scroll Element Into View    ${tab_send_store_favorite_page}
    ...    AND    common.Click When Ready    ${tab_send_store_favorite_page}

Input Store Code Receiver
    [Arguments]    ${store_code}
    ${txtbox_receiver_search_store_favorite_page}=    Replace String    ${txtbox_receiver_search_store_favorite_page}    {value}    ${favorite['text_search_store']}
    common.Input When Ready    ${txtbox_receiver_search_store_favorite_page}    ${store_code}

Select Store Receiver Lists
    [Arguments]    ${store}
    ${cbo_receiver_store}=    Replace String    ${cbo_receiver_store}    {value}    ${store}
    common.Click When Ready    ${cbo_receiver_store}

Click Store On Map
    ${btn_choose_store_favorite_page}=    Replace String    ${btn_choose_store_favorite_page}    {value}    ${favorite['button_select_store']}
    common.Click When Ready    ${btn_choose_store_favorite_page}

Verify Store Address Receiver
    [Arguments]    ${store}
    ${store_value}    Get Text    ${txtbox_receiver_display_store_address_favorite_page}
    Should Be Equal    ${store_value}    ${store}

Click Add Receiver Button
    ${btn_add_receiver_favorite_page}=    Replace String    ${btn_add_receiver_favorite_page}    {value}    ${favorite['button_add']}
    Scroll Element Into View    ${btn_add_receiver_favorite_page}
    common.Click When Ready    ${btn_add_receiver_favorite_page}

Input Receiver Favorite Name
    [Arguments]    ${value}
    common.Input When Ready    ${txtbox_receiver_favorite_name_favorite_page}    ${value}

Input Receiver Phone Number
    [Arguments]    ${value}
    common.Input When Ready    ${txtbox_receiver_phone_favorite_page}    ${value}

Input Receiver Name
    [Arguments]    ${value}
    Input When Ready    ${txtbox_receiver_name_favorite_page}    ${value}

Input Receiver Address
    [Arguments]    ${value}
    Input When Ready    ${txtbox_receiver_address_favorite_page}    ${value}

Input Receiver Postcode
    [Arguments]    ${value}
    Input When Ready    ${txtbox_receiver_postcode_favorite_page}    ${value}

Select Receiver Postcode Lists
    [Arguments]    ${postcode}
    ${cbo_receiver_postcode}=    Replace String    ${cbo_receiver_postcode}    {value}    ${postcode}
    common.Click When Ready    ${cbo_receiver_postcode}

########## Shipping Origin Area Tab ############
Select Shipping Origin Area Tab
    common.Scroll Window To Vertical    0
    common.Click When Ready    ${tab_shipping_origin_area_favorite_page}

Verify Shipping Origin Area Tab
    ${actual_shipping_origin_area_status}=    Get Element Attribute    ${tab_selected_shipping_origin_area_favorite_page}    aria-selected
    Should Be Equal    ${actual_shipping_origin_area_status}    true

Click Add Shipping Origin Area Button
    ${btn_add_shipping_origin_area_favorite_page}=    Replace String    ${btn_add_shipping_origin_area_favorite_page}    {value}    ${favorite['button_add']}
    Scroll Element Into View    ${btn_add_shipping_origin_area_favorite_page}
    common.Click When Ready    ${btn_add_shipping_origin_area_favorite_page}

Verify Label Shipping Origin Area
    [Arguments]    ${text_shipping_origin_data}    ${shipping_origin_favorite_name}   ${text_shipping_origin_set_to_default}
    ${txt_shipping_origin_area_data_in_popupfavorite_page}=    Replace String    ${txt_shipping_origin_area_data_in_popupfavorite_page}    {value}    ${favorite.label_shipping_origin_area['text_data_shipping_origin_area']} 
    Wait Until Element Is Visible    ${txt_shipping_origin_area_data_in_popupfavorite_page}    timeout=30s
    ${actual_text_shipping_origin_area_data}=    Get Text    ${txt_shipping_origin_area_data_in_popupfavorite_page}
    ${actual_text_shipping_origin_favorite_name}=    Get Text    ${txt_shipping_origin_favorite_name_in_popup_favorite_page}
    ${actual_text_shipping_origin_set_to_default}=    Get Text    ${txt_shipping_origin_set_to_default_in_popup_favorite_page}
    Should Be Equal    ${actual_text_shipping_origin_area_data}    ${text_shipping_origin_data}
    Should Be Equal    ${actual_text_shipping_origin_favorite_name}    ${shipping_origin_favorite_name}
    Should Be Equal    ${actual_text_shipping_origin_set_to_default}    ${text_shipping_origin_set_to_default}

Verify Data Shipping Origin Area
    [Arguments]    ${shipping_origin_favorite_name}
    ${actual_value_shipping_origin_favorite_name}=    Get Value    ${txtbox_shipping_origin_favorite_name_favorite_page}
    ${actual_value_shipping_origin_set_to_default}=    Get Element Attribute    ${btn_shipping_origin_set_to_default_area_favorite_page}    aria-checked
    Should Be Equal    ${actual_value_shipping_origin_favorite_name}    ${shipping_origin_favorite_name}
    Should Be Equal    ${actual_value_shipping_origin_set_to_default}    false
    Element Should Be Visible    ${tab_send_store_favorite_page}

Input Shipping Origin Area Favorite Name
    [Arguments]    ${value}
    common.Input When Ready    ${txtbox_shipping_origin_favorite_name_favorite_page}    ${value}

Input Store Code Shipping Origin Area
    [Arguments]    ${store_code}
    ${txtbox_receiver_search_store_favorite_page}=    Replace String    ${txtbox_receiver_search_store_favorite_page}    {value}    ${favorite['text_search_store']}
    common.Input When Ready    ${txtbox_receiver_search_store_favorite_page}    ${store_code}

Select Store Shipping Origin Area Lists
    [Arguments]    ${store}
    ${cbo_shipping_origin_store}=    Replace String    ${cbo_shipping_origin_store}    {value}    ${store}
    common.Scroll Into View By Xpath    ${cbo_shipping_origin_store}    true
    common.Click When Ready    ${cbo_shipping_origin_store}

Verify Display Shipping Origin Area Card
    [Arguments]    ${shipping_origin_favorite_name}    ${shipping_origin_address}
    ${card_shipping_origin_favorite_page}=    Replace String    ${card_shipping_origin_favorite_page}    {favorite_name}    ${shipping_origin_favorite_name}
    ${card_shipping_origin_favorite_page}=    Replace String    ${card_shipping_origin_favorite_page}    {address}    ${shipping_origin_address}
    Sleep  2s
    # Wait Until Element Is Visible    ${card_skelton_favorite_page}    timeout=${DEFAULT_TIMEOUT}
    # Wait Until Element Is Not Visible    ${card_skelton_favorite_page}    timeout=${DEFAULT_TIMEOUT}
    Scroll Element Into View    ${card_shipping_origin_favorite_page}
    Wait Until Element Is Visible    ${card_shipping_origin_favorite_page}    timeout=${DEFAULT_TIMEOUT}
    ${actual_shipping_origin_favorite}=    Get Text    ${card_shipping_origin_favorite_page}
    ${actual_shipping_origin_favorite}=    Replace String    ${actual_shipping_origin_favorite}    \n    ${SPACE}
    Should Be Equal As Strings    ${actual_shipping_origin_favorite}    ${shipping_origin_favorite_name} ที่อยู่ : ${shipping_origin_address}
