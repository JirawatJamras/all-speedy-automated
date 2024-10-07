*** Keywords ***
Click Button
    [Arguments]    ${btn}
    Wait Until Element Is Enabled    ${btn}    
    Click Element    ${btn}

Verify Booking list Page
    [Arguments]    ${booking_list}    ${status}    ${img_heart_sender}    ${sender_name}    ${sender_phone}
    ...    ${img_heart_receiver}    ${receiver_name}    ${receiver_phone}    ${receiver_address}    ${receiver_postcode_full}
    Wait Until Element Is Enabled    ${b2c_crd_list_of_parcels}     timeout=60
    Wait Until Page Contains Element    ${b2c_txt_booking_list}

    ${actual_text_list_of_parcels}=    Get Text    ${b2c_crd_list_of_parcels}
    ${actual_text_list_of_parcels} =  Replace String    ${actual_text_list_of_parcels}    \n    ${SPACE}
    Should Be Equal As Strings    ${actual_text_list_of_parcels}    ผู้ส่ง : ${sender_name} (${sender_phone}) ผู้รับ : ${receiver_name} (${receiver_phone}) ${receiver_address} ${receiver_postcode_full} ประเภทพัสดุ : ราคา : -บาท ซื้อประกัน : - บาท COD : - บาท พิมพ์ใบจ่ายหน้าพัสดุ -


    ${b2c_txt_list_of_parcels_status}=    Replace String    ${b2c_txt_list_of_parcels_status}    {value}    ${status}
    # ${b2c_txt_sender_name}=    Replace String    ${b2c_txt_sender_name}    {value}    ${sender_name}
    # ${b2c_txt_sender_phone}=    Replace String    ${b2c_txt_sender_phone}    {value}    ${sender_phone}
    # ${b2c_txt_receiver_name}=    Replace String    ${b2c_txt_receiver_name}    {value}    ${receiver_name}
    # ${b2c_txt_receiver_phone}=    Replace String    ${b2c_txt_receiver_phone}    {value}    ${receiver_phone}
    
    ${actual_text_booking_list}=    Get Text    ${b2c_txt_booking_list}
    ${actual_text_list_of_parcels_status} =    Get Text    ${b2c_txt_list_of_parcels_status} 
    # ${actual_text_sender}=    Get Text    ${b2c_txt_sender}
    # ${actual_text_sender_name}=    Get Text    ${b2c_txt_sender_name}
    # ${actual_text_sender_phone}=    Get Text    ${b2c_txt_sender_phone}
    # ${actual_text_receiver}=    Get Text    ${b2c_txt_receiver}
    # ${actual_text_receiver_name}=    Get Text    ${b2c_txt_receiver_name}
    # ${actual_text_receiver_phone}=    Get Text    ${b2c_txt_receiver_phone}

    Should Be Equal    ${actual_text_booking_list}   ${booking_list}
    Should Be Equal    ${actual_text_list_of_parcels_status}    ${status}
    IF         '${img_heart_sender}' == 'รูปหัวใจไม่มีสี'
    Wait Until Page Contains Element    ${b2c_img_white_heart_front_sender}     
    ELSE IF    '${img_heart_sender}' == 'รูปหัวใจสีแดง'
    Wait Until Page Contains Element    ${b2c_img_red_heart_front_sender}
    END
    # Should Be Equal    ${actual_text_sender}   ${sender}
    # Should Be Equal    ${actual_text_sender_name}   ${sender_name}
    # Should Contain     ${actual_text_sender_phone}   ${sender_phone}
    IF         '${img_heart_receiver}' == 'รูปหัวใจไม่มีสี'
    Wait Until Page Contains Element    ${b2c_img_white_heart_front_receiver}  
    ELSE IF    '${img_heart_receiver}' == 'รูปหัวใจสีแดง'
    Wait Until Page Contains Element    ${b2c_img_red_heart_front_receiver} 
    END
    Wait Until Element Is Enabled    ${b2c_ico_trash_red}
    Wait Until Page Contains Element    ${b2c_btn_print_the_parcel_payment_slip_disabled}

    # Should Be Equal    ${actual_text_receiver}   ${receiver}
    # Should Be Equal    ${actual_text_receiver_name}   ${receiver_name}
    # Should Contain     ${actual_text_receiver_phone}   ${receiver_phone}

Click Edit Booking List
    Wait Until Element Is Not Visible    ${b2c_img_loading}    timeout=${DEFAULT_TIMEOUT}
    Wait Until Element Is Visible    ${b2c_btn_edit_booking_list}    timeout=${DEFAULT_TIMEOUT}
    Click Element    ${b2c_btn_edit_booking_list}

Verify Edit Booking List Popup
    [Arguments]    ${parcel_type}    ${booking_name}    ${shipping_origin_aria}
    Wait Until Element Is Visible    ${b2c_txt_edit_booking_list}    timeout=${DEFAULT_TIMEOUT}
    ${actual_text_parcel_type}    Get Text    ${b2c_txt_parcel_type}
    ${actual_text_parcel_type} =  Replace String    ${actual_text_parcel_type}    \n    ${SPACE}
    Should Be Equal As Strings    ${actual_text_parcel_type}    ประเภทพัสดุ : ${parcel_type}

    ${actual_text_booking_name}    Get Value    ${b2c_txt_booking_name}
    Should Be Equal As Strings    ${actual_text_booking_name}    ${booking_name}

    ${actual_text_shipping_origin_aria}    Get Text    ${b2c_txt_shipping_origin_aria}
    Log To Console    ${actual_text_shipping_origin_aria}
    Should Be Equal As Strings    ${actual_text_shipping_origin_aria}    ${shipping_origin_aria}

Select Shipping Origin Tab 
    [Arguments]    ${aria}
    ${tab_shipping_origin_aria} =  Replace String    ${b2c_tab_shipping_origin_aria}    {value}    ${aria}
    Click When Ready    ${tab_shipping_origin_aria}

Search Shipping Store
    [Arguments]    ${code}
    Wait Until Element Is Visible    ${b2c_txtbox_search_store}
    Scroll Element Into View    ${b2c_txtbox_search_store}
    Input When Ready    ${b2c_txtbox_search_store}    ${code}
    ${search_result_store} =  Replace String    ${b2c_txt_search_result_store}    {value}    ${code}
    Click When Ready    ${search_result_store}

Click Select Store On Map
    Wait Until Element Is Visible    ${b2c_btn_select_store}
    Scroll Element Into View    ${b2c_btn_select_store}
    Click When Ready    ${b2c_btn_select_store}

Click Save Shipping Origin Aria
    Click When Ready    ${b2c_btn_save_shipping_origin}

Click Booking With Status Select Shipping Origin
    [Arguments]    ${booking_id}
    common.Click When Ready    xpath=//span[normalize-space()='${booking_id}']

Verify Booking Detail Page
    [Arguments]    ${title}    ${booking_id}    ${booking_name}    ${bookig_time}
    Wait Until Element Is Visible    //*[@class='hidden sm:inline']//strong[text()='รายการบุ๊คกิ้ง']
    ${actual_text_title}=    Get text    //*[@class='hidden sm:inline']//strong[text()='รายการบุ๊คกิ้ง']
    Should Be Equal    ${title}    ${actual_text_title}
    ${actaul_bookig_id}=    Get Text    //strong[text()='บุ๊คกิ้ง ID :']/../../..//div[2]//span
    Should Be Equal    ${booking_id}    ${actaul_bookig_id}
    ${actaul_booking_name}=    Get Text    //strong[text()='ชื่อบุ๊คกิ้ง :']/../../..//div[4]//span
    Should Be Equal    ${booking_name}    ${actaul_booking_name}
    ${actaul_booking_time}=    Get Text    //*[@class='hidden sm:inline']//strong[text()='วันเวลาทำรายการ :']/../../..//div[2]//span
    Should Be Equal    ${bookig_time}    ${actaul_booking_time}

Get Booking ID
    ${booking_id}=    Get Text    ${txt_booking_id}
    RETURN    ${booking_id}

Get Booking Time
    ${booking_time}=    Get Text    ${txt_booking_time}
    RETURN    ${booking_time}