*** Keywords ***
Click Button
    [Arguments]    ${btn}
    Wait Until Element Is Enabled    ${btn}    
    Click Element    ${btn}

Select Draft Booking
    common.Click When Ready    ${b2c_crd_list_of_parcels}

Verify Booking list Page
    [Arguments]    ${booking_list}    ${status}    ${img_heart_sender}    ${sender_name}    ${sender_phone}
    ...    ${img_heart_receiver}    ${receiver_name}    ${receiver_phone}    ${receiver_address}    ${receiver_postcode_full}    
    ...    ${parcel_size}    ${discount_value}    ${insurance_fee_value}    ${cod_fee_value}

    ${receiver_address}=    Set Variable If    '${receiver_address}' == '-' and '${receiver_postcode_full}' == '-'    -    ${receiver_address} ${receiver_postcode_full}
    
    Wait Until Element Is Enabled    ${b2c_crd_list_of_parcels}     timeout=60
    Wait Until Page Contains Element    ${b2c_txt_booking_list}

    ${actual_text_list_of_parcels}=    Get Text    ${b2c_crd_list_of_parcels}
    ${actual_text_list_of_parcels} =  Replace String    ${actual_text_list_of_parcels}    \n    ${SPACE}
    Should Be Equal As Strings    ${actual_text_list_of_parcels}    ผู้ส่ง : ${sender_name} (${sender_phone}) ผู้รับ : ${receiver_name} (${receiver_phone}) ${receiver_address} ประเภทพัสดุ : ราคา : ${discount_value}บาท ซื้อประกัน : ${insurance_fee_value} บาท COD : ${cod_fee_value} บาท พิมพ์ใบจ่ายหน้าพัสดุ -

    ${b2c_txt_list_of_parcels_status}=    Replace String    ${b2c_txt_list_of_parcels_status}    {value}    ${status}
    
    ${actual_text_booking_list}=    Get Text    ${b2c_txt_booking_list}
    ${actual_text_list_of_parcels_status} =    Get Text    ${b2c_txt_list_of_parcels_status} 
    #Sender
    Should Be Equal    ${actual_text_booking_list}   ${booking_list}
    Should Be Equal    ${actual_text_list_of_parcels_status}    ${status}
    IF         '${img_heart_sender}' == 'รูปหัวใจไม่มีสี'
    Wait Until Page Contains Element    ${b2c_img_white_heart_front_sender}     
    ELSE IF    '${img_heart_sender}' == 'รูปหัวใจสีแดง'
    Wait Until Page Contains Element    ${b2c_img_red_heart_front_sender}
    END
    #Receiver
    IF         '${img_heart_receiver}' == 'รูปหัวใจไม่มีสี'
    Wait Until Page Contains Element    ${b2c_img_white_heart_front_receiver}  
    ELSE IF    '${img_heart_receiver}' == 'รูปหัวใจสีแดง'
    Wait Until Page Contains Element    ${b2c_img_red_heart_front_receiver} 
    END
    Wait Until Element Is Enabled    ${b2c_ico_trash_red}
    Wait Until Page Contains Element    ${b2c_btn_print_the_parcel_payment_slip_disabled}

Click Edit Booking List
    # Wait Until Element Is Not Visible    ${b2c_img_loading}    timeout=${DEFAULT_TIMEOUT}
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
    Wait Until Element Is Visible    ${b2c_btn_select_store}    timeout=${DEFAULT_TIMEOUT}
    Scroll Element Into View    ${b2c_btn_select_store}
    Click When Ready    ${b2c_btn_select_store}

Click Save Shipping Origin Aria
    Click When Ready    ${b2c_btn_save_shipping_origin}

Get Booking ID
    Wait Until Element Is Visible    ${txt_booking_id}    timeout=${DEFAULT_TIMEOUT}
    ${booking_id}=    Get Text    ${txt_booking_id}
    RETURN    ${booking_id}

Get Booking Time
    @{booking_time}    Create List
    Wait Until Element Is Visible    ${txt_booking_time}    timeout=${DEFAULT_TIMEOUT}
    ${booking_time_1}=    Get Text    ${txt_booking_time}
    ${part}=    Split String    ${booking_time_1}    ${SPACE}
    ${day}=    Set Variable    ${part}[0]
    ${time}=    Set Variable    ${part}[1]
    ${part_time}=    Split String    ${time}    :
    ${minute}=    Set Variable    ${part_time}[1]
    ${minute}=    Convert To Integer    ${minute}
    ${new_minute}=    Evaluate    ${minute} + 1
    ${new_minute}=    Convert To String    ${new_minute}
    ${new_time}=    Set Variable    ${part_time}[0]:${new_minute}
    ${booking_time_2}=    Set Variable    ${day}${SPACE}${new_time}
    Append To List    ${booking_time}    ${booking_time_1}
    Append To List    ${booking_time}    ${booking_time_2}
    RETURN    ${booking_time}

Get Booking Name
    Wait Until Element Is Visible    ${txt_booking_name}    timeout=${DEFAULT_TIMEOUT}
    ${booking_name}=    Get Text    ${txt_booking_name}
    RETURN    ${booking_name}

Get Parcel ID
    Wait Until Element Is Visible    ${txt_parcel_id}    timeout=${DEFAULT_TIMEOUT}
    ${parcel_id}=    Get Text    ${txt_parcel_id}
    RETURN    ${parcel_id}

Click Booking With Status Select Shipping Origin
    [Arguments]    ${booking_id}
    Wait Until Element Is Visible    //span[normalize-space()='${booking_id}']    timeout=${DEFAULT_TIMEOUT}
    Scroll Element Into View    //span[normalize-space()='${booking_id}']
    common.Click When Ready    //span[normalize-space()='${booking_id}']
    Wait Until Element Is Visible    //*[@role='dialog']    timeout=${DEFAULT_TIMEOUT}
    Wait Until Element Is Not Visible    //*[@role='dialog']    timeout=${DEFAULT_TIMEOUT}
    Scroll Window To Vertical    0

Verify Booking Detail Page
    [Arguments]    ${title}    ${booking_id}    ${booking_name}    ${bookig_time}    ${title_parcel_list}    ${parcel_status}
    ...    ${img_heart_sender}    ${sender_name}    ${sender_phone}
    ...    ${img_heart_receiver}    ${receiver_name}    ${receiver_phone}    ${receiver_address}    ${receiver_postcode_full}    ${parcel_type}
    ...    ${booking_summary}    ${discount_amount}    ${discount_value}    ${insurance_fee_amount}    ${insurance_fee_value}
    ...    ${cod_fee_amount}    ${cod_fee_value}    ${total_price_amount}    ${total_price_value}
    
    Log    Booking List
    Wait Until Element Is Visible    ${b2c_txt_booking_list}    timeout=${DEFAULT_TIMEOUT}
    ${actual_text_title}=    Get text    ${b2c_txt_booking_list}
    Should Be Equal    ${title}    ${actual_text_title}
    ${actaul_bookig_id}=    Get Text    ${b2c_txt_booking_id_booking_detail_page}
    Should Be Equal    ${booking_id}    ${actaul_bookig_id}
    ${actaul_booking_name}=    Get Text    ${b2c_txt_booking_name_booking_detail_page}
    Should Be Equal    ${booking_name}    ${actaul_booking_name}
    Verify Date And Time With Time Distortion    ${b2c_txt_booking_date_and_time_booking_detail_page}    ${bookig_time}
    ${actaul_shipping_origin}=    Get Text    ${b2c_txt_shipping_origin_booking_detail_page}
    Should Be Empty    ${actaul_shipping_origin}

    Log    Parcel List
    Wait Until Element Is Visible    ${b2c_txt_parcel_list_booking_detail_page}    timeout=${DEFAULT_TIMEOUT}
    ${actual_title_parcel_list}=    Get Text    ${b2c_txt_parcel_list_booking_detail_page}
    Should Be Equal    ${title_parcel_list}    ${actual_title_parcel_list}
    ${b2c_txt_parcel_status_booking_detail_page}=    Replace String    ${b2c_txt_parcel_status_booking_detail_page}    {value}    ${parcel_status}
    ${actaul_parcel_status}=    Get Text    ${b2c_txt_parcel_status_booking_detail_page}
    Should Be Equal    ${parcel_status}    ${actaul_parcel_status}
    Wait Until Element Is Enabled    ${b2c_crd_list_of_parcels}     timeout=60
    ${actual_text_list_of_parcels}=    Get Text    ${b2c_crd_list_of_parcels}
    ${actual_text_list_of_parcels} =  Replace String    ${actual_text_list_of_parcels}    \n    ${SPACE}
    Should Be Equal As Strings    ${actual_text_list_of_parcels}    ผู้ส่ง : ${sender_name} (${sender_phone}) ผู้รับ : ${receiver_name} (${receiver_phone}) ${receiver_address} ${receiver_postcode_full} ประเภทพัสดุ : ${parcel_type} ราคา : -บาท ซื้อประกัน : - บาท COD : - บาท พิมพ์ใบจ่ายหน้าพัสดุ -
    #Sender Heart
    IF         '${img_heart_sender}' == 'รูปหัวใจไม่มีสี'
        Wait Until Page Contains Element    ${b2c_img_white_heart_front_sender}     
    ELSE IF    '${img_heart_sender}' == 'รูปหัวใจสีแดง'
        Wait Until Page Contains Element    ${b2c_img_red_heart_front_sender}
    END
    #Receiver Heart
    IF         '${img_heart_receiver}' == 'รูปหัวใจไม่มีสี'
        Wait Until Page Contains Element    ${b2c_img_white_heart_front_receiver}  
    ELSE IF    '${img_heart_receiver}' == 'รูปหัวใจสีแดง'
        Wait Until Page Contains Element    ${b2c_img_red_heart_front_receiver} 
    END
    Wait Until Element Is Enabled    ${b2c_ico_trash_red}
    Wait Until Element Is Visible    ${b2c_btn_print_parcel_label}    timeout=${DEFAULT_TIMEOUT}

    Log    Booking Summary
    Wait Until Element Is Visible    ${b2_txt_booking_summary_booking_detail_page}    timeout=${DEFAULT_TIMEOUT}
    ${actual_txt_title_booking_summary}=    Get Text    ${b2_txt_booking_summary_booking_detail_page}
    Should Be Equal    ${booking_summary}    ${actual_txt_title_booking_summary}
    Wait Until Element Is Visible    //*[@class='hidden sm:inline']//span[text()='รวมส่วนลด']/../../..    timeout=${DEFAULT_TIMEOUT}
    Scroll Element Into View    //*[@class='hidden sm:inline']//span[text()='รวมส่วนลด']/../../..
    ${acrual_txt_price_detail}=   Get Text    //*[@class='hidden sm:inline']//span[text()='รวมส่วนลด']/../../..
    ${acrual_txt_price_detail} =  Replace String    ${acrual_txt_price_detail}    \n    ${SPACE}
    Should Be Equal As Strings    ${acrual_txt_price_detail}    รวมส่วนลด ${discount_amount} ${discount_value} ค่าธรรมเนียมประกัน ${insurance_fee_amount} ${insurance_fee_value} ค่าธรรมเนียม COD ${cod_fee_amount} ${cod_fee_value} ยอดสุทธิ ${total_price_amount} ${total_price_value}
    
Verify Booking Detail Page After Set Origin Shipping
    [Arguments]    ${title}    ${booking_id}    ${booking_name}    ${bookig_time}    ${title_parcel_list}    ${parcel_status}
    ...    ${img_heart_sender}    ${sender_name}    ${sender_phone}
    ...    ${img_heart_receiver}    ${receiver_name}    ${receiver_phone}    ${receiver_address}    ${receiver_postcode_full}    ${parcel_type}
    ...    ${booking_summary}    ${discount_amount}    ${discount_value}    ${insurance_fee_amount}    ${insurance_fee_value}
    ...    ${cod_fee_amount}    ${cod_fee_value}    ${total_price_amount}    ${total_price_value}    ${store_code}
    
    Log    Booking List
    Wait Until Element Is Visible    ${b2c_txt_booking_list}    timeout=${DEFAULT_TIMEOUT}
    ${actual_text_title}=    Get text    ${b2c_txt_booking_list}
    Should Be Equal    ${title}    ${actual_text_title}
    ${actaul_bookig_id}=    Get Text    ${b2c_txt_booking_id_booking_detail_page}
    Should Be Equal    ${booking_id}    ${actaul_bookig_id}
    ${actaul_booking_name}=    Get Text    ${b2c_txt_booking_name_booking_detail_page}
    Should Be Equal    ${booking_name}    ${actaul_booking_name}
    Verify Date And Time With Time Distortion    ${b2c_txt_booking_date_and_time_booking_detail_page}    ${bookig_time}
    Wait Until Element Is Visible    ${b2c_txt_shipping_origin_booking_detail_page}    timeout=${DEFAULT_TIMEOUT}
    Element Should Contain    ${b2c_txt_shipping_origin_booking_detail_page}    ${store_code}

    Log    Parcel List
    Wait Until Element Is Visible    ${b2c_txt_parcel_list_booking_detail_page}    timeout=${DEFAULT_TIMEOUT}
    ${actual_title_parcel_list}=    Get Text    ${b2c_txt_parcel_list_booking_detail_page}
    Should Be Equal    ${title_parcel_list}    ${actual_title_parcel_list}
    ${b2c_txt_parcel_status_booking_detail_page}=    Replace String    ${b2c_txt_parcel_status_booking_detail_page}    {value}    ${parcel_status}
    ${actaul_parcel_status}=    Get Text    ${b2c_txt_parcel_status_booking_detail_page}
    Should Be Equal    ${parcel_status}    ${actaul_parcel_status}
    Wait Until Element Is Enabled    ${b2c_crd_list_of_parcels}     timeout=60
    ${actual_text_list_of_parcels}=    Get Text    ${b2c_crd_list_of_parcels}
    ${actual_text_list_of_parcels} =  Replace String    ${actual_text_list_of_parcels}    \n    ${SPACE}
    Should Be Equal As Strings    ${actual_text_list_of_parcels}    ผู้ส่ง : ${sender_name} (${sender_phone}) ผู้รับ : ${receiver_name} (${receiver_phone}) ${receiver_address} ${receiver_postcode_full} ประเภทพัสดุ : ${parcel_type} ราคา : 24บาท ซื้อประกัน : - บาท COD : - บาท พิมพ์ใบจ่ายหน้าพัสดุ -
    #Sender Heart
    IF         '${img_heart_sender}' == 'รูปหัวใจไม่มีสี'
        Wait Until Page Contains Element    ${b2c_img_white_heart_front_sender}     
    ELSE IF    '${img_heart_sender}' == 'รูปหัวใจสีแดง'
        Wait Until Page Contains Element    ${b2c_img_red_heart_front_sender}
    END
    #Receiver Heart
    IF         '${img_heart_receiver}' == 'รูปหัวใจไม่มีสี'
        Wait Until Page Contains Element    ${b2c_img_white_heart_front_receiver}  
    ELSE IF    '${img_heart_receiver}' == 'รูปหัวใจสีแดง'
        Wait Until Page Contains Element    ${b2c_img_red_heart_front_receiver} 
    END
    Wait Until Element Is Enabled    ${b2c_ico_trash_red}
    Wait Until Element Is Visible    ${b2c_btn_print_parcel_label}    timeout=${DEFAULT_TIMEOUT}

    Log    Booking Summary
    Wait Until Element Is Visible    ${b2_txt_booking_summary_booking_detail_page}    timeout=${DEFAULT_TIMEOUT}
    ${actual_txt_title_booking_summary}=    Get Text    ${b2_txt_booking_summary_booking_detail_page}
    Should Be Equal    ${booking_summary}    ${actual_txt_title_booking_summary}
    Wait Until Element Is Visible    //*[@class='hidden sm:inline']//span[text()='รวมส่วนลด']/../../..    timeout=${DEFAULT_TIMEOUT}
    Scroll Element Into View    //*[@class='hidden sm:inline']//span[text()='รวมส่วนลด']/../../..
    ${acrual_txt_price_detail}=   Get Text    //*[@class='hidden sm:inline']//span[text()='รวมส่วนลด']/../../..
    ${acrual_txt_price_detail} =  Replace String    ${acrual_txt_price_detail}    \n    ${SPACE}
    Should Be Equal As Strings    ${acrual_txt_price_detail}    รวมส่วนลด ${discount_amount} ${discount_value} ค่าธรรมเนียมประกัน ${insurance_fee_amount} ${insurance_fee_value} ค่าธรรมเนียม COD ${cod_fee_amount} ${cod_fee_value} ยอดสุทธิ ${total_price_amount} ${total_price_value}
    
Click Print Parcel Label
    Wait Until Element Is Not Visible    ${b2c_img_loading}    timeout=${DEFAULT_TIMEOUT}
    Click When Ready    ${b2c_btn_print_parcel_label}

Verify Parcel Label
    [Arguments]    ${size_a4}    ${size_a5}    ${size_8cm}    ${receiver_postcode}    ${parcel_box}    ${parcel_size}    ${sender_name}    ${sender_phone}
    ...    ${sender_address}    ${sender_postcode_full}    ${receiver_name}    ${receiver_phone}    ${receiver_address}    ${receiver_postcode_full}
    ...    ${parcel_cod}    ${parcel_insure}
    ${parcel_id}    Get Parcel ID
    Wait Until Element Is Visible    ${b2c_txt_title_print_label}
    Wait Until Element Is Visible    ${b2c_txt_paper_size}
    Click When Ready    ${b2c_cbo_paper_size}
    ${actual_list_paper_size}    Get Text    ${b2c_txt_list_paper_size}
    ${actual_list_paper_size} =  Replace String    ${actual_list_paper_size}    \n    ${SPACE}
    Should Be Equal As Strings    ${actual_list_paper_size}    ${size_a4} ${size_a5} ${size_8cm}

    Wait Until Element Is Visible    ${b2c_img_logo_speed_d}
    Wait Until Element Is Visible    ${b2c_img_qr_code}
    ${actual_list_parcel_label_detail}    Get Text    ${b2c_txt_parcel_label_detail}
    ${actual_list_parcel_label_detail} =  Replace String    ${actual_list_parcel_label_detail}    \n    ${SPACE}
    Should Be Equal As Strings    ${actual_list_parcel_label_detail}    
    ...    รหัสไปรษณีย์ปลายทาง ${receiver_postcode} ${parcel_size} ${parcel_box} ${parcel_size} ผู้ส่ง : ${sender_name} (${sender_phone}) ${sender_address} ${sender_postcode_full} ผู้รับ : ${receiver_name} (${receiver_phone}) ${receiver_address} ${receiver_postcode_full} COD ${parcel_cod} ${parcel_insure} ${parcel_id}

Click Print Label On Popup
    Click When Ready    ${b2c_btn_print_parcel_label_popup}

Verify Date And Time With Time Distortion
    [Arguments]    ${locator}    ${booking_time}
    ${actaul_booking_time}=    Get Text    ${locator}
    ${match_found}=    Set Variable    False
    FOR    ${time}    IN     @{booking_time}
        ${time_convert}    Convert Date    ${actaul_booking_time}    date_format=%d-%m-%Y %H:%M    result_format=%d-%m-%Y %H:%M
        Should Be Equal    ${actaul_booking_time}   ${time_convert}
        ${isequal}=    Run Keyword And Return Status    Should Be Equal    ${time}    ${actaul_booking_time}
        Run Keyword IF  '${isequal}' == 'True'    Run Keywords    Set Suite Variable    ${match_found}    True
        ...    AND    Exit For Loop
    END
    Run Keyword IF  '${match_found}' == 'False'   Fail    No matching time found in the booking time.
