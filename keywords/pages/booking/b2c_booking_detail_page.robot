*** Keywords ***
Click Add Button
    ${b2c_btn_add_parcel_in_booking_detail_page}=    Replace String    ${b2c_btn_add_parcel_in_booking_detail_page}    {value}    ${Booking['text_btn_add']}
    common.Click When Ready    ${b2c_btn_add_parcel_in_booking_detail_page}

Select Draft Booking
    common.Click When Ready    ${b2c_crd_list_of_parcels}

Verify Booking Detail Page After Draft
    [Arguments]    ${booking_list}    ${status}    ${parcel_id}    ${img_heart_sender}    ${sender_name}    ${sender_phone}
    ...    ${img_heart_receiver}    ${receiver_name}    ${receiver_phone}    ${receiver_address}    ${receiver_postcode_full}    
    ...    ${parcel_size}    ${price_value}    ${buy_insurance}    ${cod_value}
    ${receiver_address}=    Set Variable If    '${receiver_address}' == '-' and '${receiver_postcode_full}' == '-'    -    ${receiver_address} ${receiver_postcode_full}
    ${b2c_txt_booking_list} =  Replace String    ${b2c_txt_booking_list}    {value}    ${booking_list}
    ${b2c_txt_list_of_parcels_status}=    Replace String    ${b2c_txt_list_of_parcels_status}    {value}    ${status}
    ${b2c_img_red_heart_front_sender}=    Replace String    ${b2c_img_red_heart_front_sender}    {value}    ${Booking['text_sender']}
    ${b2c_img_white_heart_front_sender}=    Replace String    ${b2c_img_white_heart_front_sender}    {value}    ${Booking['text_sender']}
    ${b2c_img_red_heart_front_receiver}=    Replace String    ${b2c_img_red_heart_front_receiver}    {value}    ${Booking['text_receiver']}
    ${b2c_img_white_heart_front_receiver}=    Replace String    ${b2c_img_white_heart_front_receiver}    {value}    ${Booking['text_receiver']}
    ${b2c_btn_print_the_parcel_payment_slip_disabled}=    Replace String    ${b2c_btn_print_the_parcel_payment_slip_disabled}    {value}    ${Booking['text_print_parcel_label']}
    Wait Until Element Is Visible    ${b2c_crd_list_of_parcels}     timeout=${DEFAULT_TIMEOUT}
    Wait Until Element Is Visible    ${b2c_txt_booking_list}    timeout=${DEFAULT_TIMEOUT}
    Wait Until Element Is Visible    ${b2c_txt_list_of_parcels_status}    timeout=${DEFAULT_TIMEOUT}
    ${actual_text_list_of_parcels}=    Get Text    ${b2c_crd_list_of_parcels}
    ${actual_text_list_of_parcels} =  Replace String    ${actual_text_list_of_parcels}    \n    ${SPACE}
    Run Keyword If    '${parcel_size}' == '${EMPTY}'    Should Be Equal As Strings    ${actual_text_list_of_parcels}    ผู้ส่ง : ${sender_name} (${sender_phone}) ผู้รับ : ${receiver_name} (${receiver_phone}) ${receiver_address} ประเภทพัสดุ : ราคา : ${price_value}บาท ซื้อประกัน : ${buy_insurance} บาท COD : ${cod_value} บาท พิมพ์ใบจ่ายหน้าพัสดุ -
    Run Keyword If    '${parcel_size}' != '${EMPTY}'    Should Be Equal As Strings    ${actual_text_list_of_parcels}    ผู้ส่ง : ${sender_name} (${sender_phone}) ผู้รับ : ${receiver_name} (${receiver_phone}) ${receiver_address} ประเภทพัสดุ : ${parcel_size} ราคา : ${price_value}บาท ซื้อประกัน : ${buy_insurance} บาท COD : ${cod_value} บาท พิมพ์ใบจ่ายหน้าพัสดุ -
    ${actual_text_booking_list}=    Get Text    ${b2c_txt_booking_list}
    ${actual_text_list_of_parcels_status} =    Get Text    ${b2c_txt_list_of_parcels_status}
    b2c_booking_delivery_page.Verify Parcel ID Format And Value    ${booking_txt_parcel_id_booking_detail_page}    ${parcel_id}
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

Verify Booking Detail Page After Draft When Select 7-ELEVEN Store
    [Arguments]    ${booking_list}    ${status}    ${parcel_id}    ${img_heart_sender}    ${sender_name}    ${sender_phone}
    ...    ${img_heart_receiver}    ${receiver_name}    ${receiver_phone}    ${store_address}   
    ...    ${parcel_size}    ${price_value}    ${buy_insurance}    ${cod_value}
    ${b2c_txt_booking_list} =  Replace String    ${b2c_txt_booking_list}    {value}    ${booking_list}
    ${b2c_txt_list_of_parcels_status}=    Replace String    ${b2c_txt_list_of_parcels_status}    {value}    ${status}
    ${b2c_img_red_heart_front_sender}=    Replace String    ${b2c_img_red_heart_front_sender}    {value}    ${Booking['text_sender']}
    ${b2c_img_white_heart_front_sender}=    Replace String    ${b2c_img_white_heart_front_sender}    {value}    ${Booking['text_sender']}
    ${b2c_img_red_heart_front_receiver}=    Replace String    ${b2c_img_red_heart_front_receiver}    {value}    ${Booking['text_receiver']}
    ${b2c_img_white_heart_front_receiver}=    Replace String    ${b2c_img_white_heart_front_receiver}    {value}    ${Booking['text_receiver']}
    ${b2c_btn_print_the_parcel_payment_slip_disabled}=    Replace String    ${b2c_btn_print_the_parcel_payment_slip_disabled}    {value}    ${Booking['text_print_parcel_label']}
    Wait Until Element Is Enabled    ${b2c_crd_list_of_parcels}     timeout=60s
    Wait Until Page Contains Element    ${b2c_txt_booking_list}
    ${actual_text_list_of_parcels}=    Get Text    ${b2c_crd_list_of_parcels}
    ${actual_text_list_of_parcels} =  Replace String    ${actual_text_list_of_parcels}    \n    ${SPACE}
    Run Keyword If    '${parcel_size}' == '${EMPTY}'    Should Be Equal As Strings    ${actual_text_list_of_parcels}    ผู้ส่ง : ${sender_name} (${sender_phone}) ผู้รับ : ${receiver_name} (${receiver_phone}) ${store_address} ประเภทพัสดุ : ราคา : ${price_value}บาท ซื้อประกัน : ${buy_insurance} บาท COD : ${cod_value} บาท พิมพ์ใบจ่ายหน้าพัสดุ -
    Run Keyword If    '${parcel_size}' != '${EMPTY}'    Should Be Equal As Strings    ${actual_text_list_of_parcels}    ผู้ส่ง : ${sender_name} (${sender_phone}) ผู้รับ : ${receiver_name} (${receiver_phone}) ${store_address} ประเภทพัสดุ : ${parcel_size} ราคา : ${price_value}บาท ซื้อประกัน : ${buy_insurance} บาท COD : ${cod_value} บาท พิมพ์ใบจ่ายหน้าพัสดุ -
    ${actual_text_booking_list}=    Get Text    ${b2c_txt_booking_list}
    ${actual_text_list_of_parcels_status} =    Get Text    ${b2c_txt_list_of_parcels_status}
    b2c_booking_delivery_page.Verify Parcel ID Format And Value    ${booking_txt_parcel_id_booking_detail_page}    ${parcel_id}
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
    ${b2c_btn_edit_booking_list}=    Replace String    ${b2c_btn_edit_booking_list}    {value}    ${Booking['text_booking_list']}
    Scroll Window To Vertical    0
    common.Click When Ready    ${b2c_btn_edit_booking_list}

Verify Edit Booking List Popup
    [Arguments]    ${parcel_type}    ${booking_name}    ${shipping_origin_aria}
    ${text_edit_booking_list}=    Replace String    ${b2c_txt_edit_booking_list}    {value}    ${Booking['text_edit_booking_list']}
    Wait Until Element Is Visible    ${text_edit_booking_list}    timeout=${DEFAULT_TIMEOUT}
    ${b2c_txt_parcel_type}=    Replace String    ${b2c_txt_parcel_type}    {value}    ${Booking['text_parcel_type']}
    ${actual_text_parcel_type}    Get Text    ${b2c_txt_parcel_type}
    ${actual_text_parcel_type} =  Replace String    ${actual_text_parcel_type}    \n    ${SPACE}
    Should Be Equal As Strings    ${actual_text_parcel_type}    ประเภทพัสดุ : ${parcel_type}
    ${b2c_txt_booking_name}=    Replace String    ${b2c_txt_booking_name}    {value}    ${Booking['text_booking_name']}
    ${actual_text_booking_name}    Get Value    ${b2c_txt_booking_name}
    ${b2c_txt_shipping_origin_aria}=    Replace String    ${b2c_txt_shipping_origin_aria}    {value}    ${Booking['text_shipping_origin_aria']}
    ${actual_text_shipping_origin_aria}    Get Text    ${b2c_txt_shipping_origin_aria}
    Log    ${actual_text_shipping_origin_aria}
    Should Be Equal As Strings    ${actual_text_booking_name}    ${booking_name}
    Should Be Equal As Strings    ${actual_text_shipping_origin_aria}    ${shipping_origin_aria}

Verify Edit Booking List Popup For General Customer
    [Arguments]    ${booking_name}    ${shipping_origin_aria}
    ${text_edit_booking_list}=    Replace String    ${b2c_txt_edit_booking_list}    {value}    ${Booking['text_edit_booking_list']}
    Wait Until Element Is Visible    ${text_edit_booking_list}    timeout=${DEFAULT_TIMEOUT}
    ${b2c_txt_booking_name}=    Replace String    ${b2c_txt_booking_name}    {value}    ${Booking['text_booking_name']}
    ${actual_text_booking_name}    Get Value    ${b2c_txt_booking_name}
    ${b2c_txt_shipping_origin_aria}=    Replace String    ${b2c_txt_shipping_origin_aria}    {value}    ${Booking['text_shipping_origin_aria']}
    ${actual_text_shipping_origin_aria}    Get Text    ${b2c_txt_shipping_origin_aria}
    Log    ${actual_text_shipping_origin_aria}
    Should Be Equal As Strings    ${actual_text_booking_name}    ${booking_name}
    Should Be Equal As Strings    ${actual_text_shipping_origin_aria}    ${shipping_origin_aria}

Select Pickup Schedule Tab
    ${tab_pickup_schedule} =  Replace String    ${b2c_tab_pickup_schedule}    {value}    ${Booking.tab_shipping_origin['car_pickup']}
    common.Click When Ready    ${tab_pickup_schedule}

Verify Display Pickup Schedule Data
    [Arguments]   ${round}    ${tomorrow}    ${parcel_num}    ${today}    ${price}
    ${today_pattern}    Set Date Pattern    ${today}
    ${tomorrow_pattern}    Set Date Pattern    ${tomorrow}

    ${actual_round} =  Replace String    ${b2c_txt_pickup_schedule}    {round}    ${round}
    ${actual_pickup_date} =  Replace String    ${actual_round}    {pickup_date}    ${Booking.pickup_schedule['pickup_date']} ${tomorrow_pattern}
    ${actual_parcel} =  Replace String    ${actual_pickup_date}    {parcel_num}    ${Booking.pickup_schedule['parcel_number']} ${parcel_num}
    ${actual_cut_off_time} =  Replace String    ${actual_parcel}    {cut_off_time}    ${Booking.pickup_schedule['cut_off_time']} ${today_pattern}
    ${actual_pickup_schedule_checkbox} =  Replace String    ${actual_cut_off_time}    {price}    ${Booking.pickup_schedule['price']} ${price}
    Set Suite Variable    ${actual_pickup_schedule_checkbox}

    Register Keyword To Run On Failure    NOTHING
    ${status}=    Set Variable    False

    WHILE    '${status}' == 'False'
        ${status}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${actual_pickup_schedule_checkbox}    2s
        Exit For Loop If    '${status}' == 'True'
        ${nextpage}=    Get Element Attribute    ${b2c_btn_status_next_page_pickup_schedule}    aria-disabled
        Run Keyword If    '${status}' == 'True'    Exit For Loop
        ...    ELSE    common.Click When Ready    ${b2c_btn_next_page_pickup_schedule}
    END

Verify Display Pickup Schedule Data After Canceled
    ${status}=    Set Variable    False
    ${actual_pickup_parcel} =  Replace String    ${b2c_txt_selected_pickup_type}    {value}    ${Booking.pickup_schedule['general_car_pickup']}
    Register Keyword To Run On Failure    NOTHING
    WHILE    '${status}' == 'False'
        ${status}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${actual_pickup_parcel}    timeout=${DEFAULT_TIMEOUT}
        Exit For Loop If    '${status}' == 'True'
        ${nextpage}=    Get Element Attribute    ${b2c_btn_status_next_page_pickup_schedule}    aria-disabled
        ${status_button}=    Run Keyword And Return Status    Should Be Equal As Strings    ${nextpage}    false
        Run Keyword If    '${status_button}' == 'True'    common.Click When Ready    ${b2c_btn_next_page_pickup_schedule}
        ...    ELSE    Fail    There is no selected pickup schedule
    END

Select Parcel Pickup Schedule
    common.Click When Ready    ${actual_pickup_schedule_checkbox}

Click Save Button In Edit Booking List Popup
    ${btn_save_shipping_origin} =  Replace String    ${b2c_btn_save_shipping_origin}    {value}    ${Booking['text_save']}
    Scroll Element Into View    ${btn_save_shipping_origin}
    common.Click When Ready    ${btn_save_shipping_origin}
    Wait Until Element Is Not Visible    ${b2c_img_loading}    timeout=${DEFAULT_TIMEOUT}

Verify Complete Select Parcel Pickup Schedule And Save
    [Arguments]    ${today}    ${company_name}    ${company_address}    ${sub_district}    ${district}    ${province}    ${postcode}
    ${text_booking_time_label}=    Replace String    ${b2c_txt_transaction_date}    {value}    ${booking['text_booking_time_label']}
    ${txt_booking_time_label}=    Replace String    ${text_booking_time_label}    {value2}    ${today}
    ${txt_shipping_origin}=    Replace String    ${b2c_txt_shipping_origin}    {value}    ${booking['text_shipping_origin']}
    ${txt_shipping_origin}    Get Text    ${txt_shipping_origin}
    ${actual_shipping_origin}=    Replace String    ${txt_shipping_origin}    \n    ${SPACE}
    Wait Until Element Is Not Visible    ${b2c_img_loading}    timeout=${DEFAULT_TIMEOUT}
    Wait Until Element Is Visible    ${txt_booking_time_label}    timeout=${DEFAULT_TIMEOUT}
    Should Be Equal As Strings    ${actual_shipping_origin}    ${booking['text_shipping_origin']} ${company_name} ${company_address} ${sub_district} ${district} ${province} ${postcode}

Select Shipping Origin Tab
    [Arguments]    ${aria}
    ${tab_shipping_origin_aria} =  Replace String    ${b2c_tab_shipping_origin_aria}    {value}    ${aria}
    Click When Ready    ${tab_shipping_origin_aria}

Search Shipping Store
    [Arguments]    ${code}
    ${search_result_store} =  Replace String    ${b2c_txt_search_result_store}    {value}    ${code}
    ${select_store_button} =  Replace String    ${b2c_btn_select_store}    {value}    ${Booking['text_select_store_on_map']}
    Wait Until Element Is Visible    ${b2c_txtbox_search_store}    timeout=${DEFAULT_TIMEOUT}
    Scroll Element Into View    ${b2c_txtbox_search_store}
    FOR    ${i}    IN RANGE    0    5
        Input When Ready    ${b2c_txtbox_search_store}    ${code}
        Click When Ready    ${search_result_store}
        ${isvisible}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${select_store_button}    timeout=${DEFAULT_TIMEOUT}
        Exit For Loop If    '${isvisible}' == 'True'    
        common.Clear Value Input Text    ${b2c_txtbox_search_store}
    END
    
Click Select Store On Map
    ${select_store_button} =  Replace String    ${b2c_btn_select_store}    {value}    ${Booking['text_select_store_on_map']}
    common.Scroll Window To Vertical    100
    Wait Until Element Is Visible    ${select_store_button}    timeout=${DEFAULT_TIMEOUT}
    common.Click When Ready    ${select_store_button}

Click Save Shipping Origin Aria
    ${b2c_btn_save_shipping_origin} =  Replace String    ${b2c_btn_save_shipping_origin}    {value}    ${Booking['text_save']}
    common.Click When Ready    ${b2c_btn_save_shipping_origin}
    Wait Until Element Is Not Visible    ${b2c_dialog_create_parcel}    timeout=${DEFAULT_TIMEOUT}

Get Booking ID
    ${txt_booking_id}=    Replace String    ${txt_booking_id}    {value}    ${Booking['text_booking_id_label']}
    Wait Until Element Is Visible    ${txt_booking_id}    timeout=${DEFAULT_TIMEOUT}
    ${booking_id}=    Get Text    ${txt_booking_id}
    RETURN    ${booking_id}

Get Booking Time
    @{booking_time}    Create List
    ${txt_booking_time}=    Replace String    ${txt_booking_time}    {value}    ${Booking['text_booking_time_label']}
    Wait Until Element Is Visible    ${txt_booking_time}    timeout=${DEFAULT_TIMEOUT}
    FOR    ${i}    IN RANGE    0    5
       ${isvisible}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${b2c_crd_list_of_parcels}     timeout=${DEFAULT_TIMEOUT}
        Run Keyword IF  '${isvisible}' == 'True'    Exit For Loop
        Reload Page
    END
    ${booking_time_1}=    Get Text    ${txt_booking_time}
    ${part}=    Split String    ${booking_time_1}    ${SPACE}
    ${day}=    Set Variable    ${part}[0]
    ${time}=    Set Variable    ${part}[1]
    ${part_time}=    Split String    ${time}    :
    ${minute}=    Set Variable    ${part_time}[1]
    ${minute}=    Convert To Integer    ${minute}
    ${new_minute}=    Evaluate    ${minute} + 1
    ${new_minute}=    Convert To String    ${new_minute}
    ${new_minute}=    Set Variable    ${new_minute.zfill(2)}
    ${new_time}=    Set Variable    ${part_time}[0]:${new_minute}
    ${booking_time_2}=    Set Variable    ${day}${SPACE}${new_time}
    Append To List    ${booking_time}    ${booking_time_1}
    Append To List    ${booking_time}    ${booking_time_2}
    RETURN    ${booking_time}
    
Get Booking Name
    ${txt_booking_name}=    Replace String    ${txt_booking_name}    {value}    ${Booking['text_booking_name_label']}
    Wait Until Element Is Visible    ${txt_booking_name}    timeout=${DEFAULT_TIMEOUT}
    ${booking_name}=    Get Text    ${txt_booking_name}
    RETURN    ${booking_name}

Get Parcel ID
    Wait Until Element Is Visible    ${txt_parcel_id}    timeout=${DEFAULT_TIMEOUT}
    ${parcel_id}=    Get Text    ${txt_parcel_id}
    RETURN    ${parcel_id}

Click Booking With Status Select Shipping Origin
    [Arguments]    ${booking_id}
    ${booking_id}=    Replace String    ${b2c_txt_booking_id}    {value}    ${booking_id}
    Wait Until Element Is Visible    ${booking_id}    timeout=${DEFAULT_TIMEOUT}
    Scroll Element Into View    ${booking_id}
    common.Click When Ready    ${booking_id}
    Wait Until Element Is Visible    ${b2c_dialog_create_parcel}    timeout=${DEFAULT_TIMEOUT}
    Wait Until Element Is Not Visible    ${b2c_dialog_create_parcel}    timeout=${DEFAULT_TIMEOUT}
    Scroll Window To Vertical    0

Click Booking With Waiting For Entering Parcel To System
    [Arguments]    ${booking_id}
    ${booking_id}=    Replace String    ${b2c_txt_booking_id}    {value}    ${booking_id}
    Wait Until Element Is Visible    ${booking_id}    timeout=${DEFAULT_TIMEOUT}
    Scroll Element Into View    ${booking_id}
    common.Click When Ready    ${booking_id}
    Wait Until Element Is Visible    ${b2c_dialog_create_parcel}    timeout=${DEFAULT_TIMEOUT}
    Wait Until Element Is Not Visible    ${b2c_dialog_create_parcel}    timeout=${DEFAULT_TIMEOUT}
    Scroll Window To Vertical    0

Verify Booking Detail Page
    [Arguments]    ${title}    ${booking_id}    ${parcel_id}    ${booking_name}    ${booking_time}    ${title_parcel_list}    ${parcel_status}
    ...    ${img_heart_sender}    ${sender_name}    ${sender_phone}
    ...    ${img_heart_receiver}    ${receiver_name}    ${receiver_phone}    ${receiver_address}
    ...    ${receiver_postcode_full}    ${parcel_type}    ${price}    ${insure_value}    ${cod}
    ...    ${booking_summary}    ${discount_amount}    ${discount_value}    ${insurance_fee_amount}    ${insurance_fee_value}
    ...    ${cod_fee_amount}    ${cod_fee_value}    ${total_price_amount}    ${total_price_value}    ${origin_shipping}
    Log    Booking List
    ${b2c_txt_booking_list} =  Replace String    ${b2c_txt_booking_list}    {value}    ${title}
    ${b2c_txt_parcel_list_booking_detail_page} =  Replace String    ${b2c_txt_parcel_list_booking_detail_page}    {value}    ${title_parcel_list}
    ${b2c_txt_booking_summary_booking_detail_page} =  Replace String    ${b2c_txt_booking_summary_booking_detail_page}    {value}    ${booking_summary}
    ${b2c_txt_booking_name_booking_detail_page}=    Replace String    ${b2c_txt_booking_name_booking_detail_page}    {value}    ${Booking['text_booking_name_label']}
    ${text_booking_date_and_time_booking_detail_page}=    Replace String    ${b2c_txt_booking_date_and_time_booking_detail_page}    {value}    ${Booking['text_booking_time_label']}
    ${b2c_txt_shipping_origin_booking_detail_page}=    Replace String    ${b2c_txt_shipping_origin_booking_detail_page}    {value}    ${Booking['text_shipping_origin']}
    ${b2c_txt_parcel_status_booking_detail_page}=    Replace String    ${b2c_txt_parcel_status_booking_detail_page}    {value}    ${parcel_status}
    ${b2c_txt_booking_id_booking_detail_page}=    Replace String    ${b2c_txt_booking_id_booking_detail_page}    {value}    ${Booking['text_booking_id_label']}
    ${b2c_img_red_heart_front_sender}=    Replace String    ${b2c_img_red_heart_front_sender}    {value}    ${Booking['text_sender']}
    ${b2c_img_white_heart_front_sender}=    Replace String    ${b2c_img_white_heart_front_sender}    {value}    ${Booking['text_sender']}
    ${b2c_img_red_heart_front_receiver}=    Replace String    ${b2c_img_red_heart_front_receiver}    {value}    ${Booking['text_receiver']}
    ${b2c_img_white_heart_front_receiver}=    Replace String    ${b2c_img_white_heart_front_receiver}    {value}    ${Booking['text_receiver']}
    Wait Until Element Is Enabled    ${b2c_crd_list_of_parcels}     timeout=60
    Wait Until Element Is Visible    ${b2c_txt_booking_list}    timeout=${DEFAULT_TIMEOUT}
    ${actual_text_title}=    Get text    ${b2c_txt_booking_list}
    ${actual_booking_name}=    Get Text    ${b2c_txt_booking_name_booking_detail_page}
    Verify Date And Time With Time Distortion    ${text_booking_date_and_time_booking_detail_page}    ${booking_time}
    Wait Until Element Is Visible    ${b2c_txt_shipping_origin_booking_detail_page}    timeout=${DEFAULT_TIMEOUT}
    ${actual_txt_shipping_origin_booking_detail_page}=    Get Text    ${b2c_txt_shipping_origin_booking_detail_page}
    Should Be Equal    ${actual_txt_shipping_origin_booking_detail_page}    ${origin_shipping}
    Reload Page
    Wait Until Element Is Visible    ${b2c_txt_parcel_status_booking_detail_page}    timeout=${DEFAULT_TIMEOUT}
    b2c_booking_delivery_page.Verify Booking ID Format And Value    ${b2c_txt_booking_id_booking_detail_page}    ${booking_id}
    b2c_booking_delivery_page.Verify Parcel ID Format And Value    ${booking_txt_parcel_id_booking_detail_page}    ${parcel_id}
    Should Be Equal    ${title}    ${actual_text_title}
    Should Be Equal    ${booking_name}    ${actual_booking_name}
    Log    Parcel List
    Wait Until Element Is Visible    ${b2c_txt_parcel_list_booking_detail_page}    timeout=${DEFAULT_TIMEOUT}
    ${actual_title_parcel_list}=    Get Text    ${b2c_txt_parcel_list_booking_detail_page}
    ${actual_parcel_status}=    Get Text    ${b2c_txt_parcel_status_booking_detail_page}
    ${actual_text_list_of_parcels}=    Get Text    ${b2c_crd_list_of_parcels}
    ${b2c_txt_parcel_status_booking_detail_page}=    Replace String    ${b2c_txt_parcel_status_booking_detail_page}    {value}    ${parcel_status}
    ${actual_text_list_of_parcels} =  Replace String    ${actual_text_list_of_parcels}    \n    ${SPACE}
    Wait Until Element Is Enabled    ${b2c_crd_list_of_parcels}     timeout=60s
    Should Be Equal As Strings    ${actual_text_list_of_parcels}    ผู้ส่ง : ${sender_name} (${sender_phone}) ผู้รับ : ${receiver_name} (${receiver_phone}) ${receiver_address} ${receiver_postcode_full} ประเภทพัสดุ : ${parcel_type} ราคา : ${price}บาท ซื้อประกัน : ${insure_value} บาท COD : ${cod} บาท พิมพ์ใบจ่ายหน้าพัสดุ -
    Should Be Equal    ${title_parcel_list}    ${actual_title_parcel_list}
    Should Be Equal    ${parcel_status}    ${actual_parcel_status}
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
    ${b2c_btn_print_parcel_label}=    Replace String    ${b2c_btn_print_parcel_label}    {value}    ${Booking['text_print_parcel_label']}
    Wait Until Element Is Visible    ${b2c_btn_print_parcel_label}    timeout=${DEFAULT_TIMEOUT}
    Log    Booking Summary
    Wait Until Element Is Visible    ${b2c_txt_booking_summary_booking_detail_page}    timeout=${DEFAULT_TIMEOUT}
    ${actual_txt_title_booking_summary}=    Get Text    ${b2c_txt_booking_summary_booking_detail_page}
    Wait Until Element Is Visible    //*[@class='hidden sm:inline']//span[text()='รวมส่วนลด']/../../..    timeout=${DEFAULT_TIMEOUT}
    Scroll Element Into View    //*[@class='hidden sm:inline']//span[text()='รวมส่วนลด']/../../..
    ${actual_txt_price_detail}=   Get Text    //*[@class='hidden sm:inline']//span[text()='รวมส่วนลด']/../../..
    ${actual_txt_price_detail} =  Replace String    ${actual_txt_price_detail}    \n    ${SPACE}
    Wait Until Element Is Visible    ${b2c_txt_shipping_origin_booking_detail_page}    timeout=${DEFAULT_TIMEOUT}
    Should Be Equal As Strings    ${actual_txt_price_detail}    รวมส่วนลด ${discount_amount} ${discount_value} ค่าธรรมเนียมประกัน ${insurance_fee_amount} ${insurance_fee_value} ค่าธรรมเนียม COD ${cod_fee_amount} ${cod_fee_value} ยอดสุทธิ ${total_price_amount} ${total_price_value}
    Should Be Equal    ${booking_summary}    ${actual_txt_title_booking_summary}

Verify Booking Detail Page When Select 7-ELEVEN Store
    [Arguments]    ${title}    ${booking_id}    ${parcel_id}    ${booking_name}    ${booking_time}    ${title_parcel_list}    ${parcel_status}
    ...    ${img_heart_sender}    ${sender_name}    ${sender_phone}
    ...    ${img_heart_receiver}    ${receiver_name}    ${receiver_phone}    ${store_address}
    ...    ${parcel_type}    ${price}    ${insure_value}    ${cod}
    ...    ${booking_summary}    ${discount_amount}    ${discount_value}    ${insurance_fee_amount}    ${insurance_fee_value}
    ...    ${cod_fee_amount}    ${cod_fee_value}    ${total_price_amount}    ${total_price_value}    ${origin_shipping}
    Log    Booking List
    ${b2c_txt_booking_list} =  Replace String    ${b2c_txt_booking_list}    {value}    ${title}
    ${b2c_txt_parcel_list_booking_detail_page} =  Replace String    ${b2c_txt_parcel_list_booking_detail_page}    {value}    ${title_parcel_list}
    ${b2c_txt_booking_summary_booking_detail_page} =  Replace String    ${b2c_txt_booking_summary_booking_detail_page}    {value}    ${booking_summary}
    ${b2c_txt_booking_name_booking_detail_page}=    Replace String    ${b2c_txt_booking_name_booking_detail_page}    {value}    ${Booking['text_booking_name_label']}
    ${text_booking_date_and_time_booking_detail_page}=    Replace String    ${b2c_txt_booking_date_and_time_booking_detail_page}    {value}    ${Booking['text_booking_time_label']}
    ${b2c_txt_shipping_origin_booking_detail_page}=    Replace String    ${b2c_txt_shipping_origin_booking_detail_page}    {value}    ${Booking['text_shipping_origin']}
    ${b2c_txt_parcel_status_booking_detail_page}=    Replace String    ${b2c_txt_parcel_status_booking_detail_page}    {value}    ${parcel_status}
    ${b2c_txt_booking_id_booking_detail_page}=    Replace String    ${b2c_txt_booking_id_booking_detail_page}    {value}    ${Booking['text_booking_id_label']}
    ${b2c_img_red_heart_front_sender}=    Replace String    ${b2c_img_red_heart_front_sender}    {value}    ${Booking['text_sender']}
    ${b2c_img_white_heart_front_sender}=    Replace String    ${b2c_img_white_heart_front_sender}    {value}    ${Booking['text_sender']}
    ${b2c_img_red_heart_front_receiver}=    Replace String    ${b2c_img_red_heart_front_receiver}    {value}    ${Booking['text_receiver']}
    ${b2c_img_white_heart_front_receiver}=    Replace String    ${b2c_img_white_heart_front_receiver}    {value}    ${Booking['text_receiver']}
    Wait Until Element Is Enabled    ${b2c_crd_list_of_parcels}     timeout=60s
    Wait Until Element Is Visible    ${b2c_txt_booking_list}    timeout=${DEFAULT_TIMEOUT}
    ${actual_text_title}=    Get text    ${b2c_txt_booking_list}
    ${actual_booking_name}=    Get Text    ${b2c_txt_booking_name_booking_detail_page}
    Verify Date And Time With Time Distortion    ${text_booking_date_and_time_booking_detail_page}    ${booking_time}
    Wait Until Element Is Visible    ${b2c_txt_shipping_origin_booking_detail_page}    timeout=${DEFAULT_TIMEOUT}
    ${actual_txt_shipping_origin_booking_detail_page}=    Get Text    ${b2c_txt_shipping_origin_booking_detail_page}
    Should Be Equal    ${actual_txt_shipping_origin_booking_detail_page}    ${origin_shipping}
    Reload Page
    Wait Until Element Is Visible    ${b2c_txt_parcel_status_booking_detail_page}    timeout=${DEFAULT_TIMEOUT}
    b2c_booking_delivery_page.Verify Booking ID Format And Value    ${b2c_txt_booking_id_booking_detail_page}    ${booking_id}
    b2c_booking_delivery_page.Verify Parcel ID Format And Value    ${booking_txt_parcel_id_booking_detail_page}    ${parcel_id}
    Should Be Equal    ${title}    ${actual_text_title}
    Should Be Equal    ${booking_name}    ${actual_booking_name}
    Log    Parcel List
    Wait Until Element Is Visible    ${b2c_txt_parcel_list_booking_detail_page}    timeout=${DEFAULT_TIMEOUT}
    ${actual_title_parcel_list}=    Get Text    ${b2c_txt_parcel_list_booking_detail_page}
    ${actual_parcel_status}=    Get Text    ${b2c_txt_parcel_status_booking_detail_page}
    ${actual_text_list_of_parcels}=    Get Text    ${b2c_crd_list_of_parcels}
    ${b2c_txt_parcel_status_booking_detail_page}=    Replace String    ${b2c_txt_parcel_status_booking_detail_page}    {value}    ${parcel_status}
    ${actual_text_list_of_parcels} =  Replace String    ${actual_text_list_of_parcels}    \n    ${SPACE}
    Wait Until Element Is Enabled    ${b2c_crd_list_of_parcels}     timeout=60
    Should Be Equal As Strings    ${actual_text_list_of_parcels}    ผู้ส่ง : ${sender_name} (${sender_phone}) ผู้รับ : ${receiver_name} (${receiver_phone}) ${store_address} ประเภทพัสดุ : ${parcel_type} ราคา : ${price}บาท ซื้อประกัน : ${insure_value} บาท COD : ${cod} บาท พิมพ์ใบจ่ายหน้าพัสดุ -
    Should Be Equal    ${title_parcel_list}    ${actual_title_parcel_list}
    Should Be Equal    ${parcel_status}    ${actual_parcel_status}
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
    ${b2c_btn_print_parcel_label}=    Replace String    ${b2c_btn_print_parcel_label}    {value}    ${Booking['text_print_parcel_label']}
    Wait Until Element Is Visible    ${b2c_btn_print_parcel_label}    timeout=${DEFAULT_TIMEOUT}
    Log    Booking Summary
    Wait Until Element Is Visible    ${b2c_txt_booking_summary_booking_detail_page}    timeout=${DEFAULT_TIMEOUT}
    ${actual_txt_title_booking_summary}=    Get Text    ${b2c_txt_booking_summary_booking_detail_page}
    Wait Until Element Is Visible    //*[@class='hidden sm:inline']//span[text()='รวมส่วนลด']/../../..    timeout=${DEFAULT_TIMEOUT}
    Scroll Element Into View    //*[@class='hidden sm:inline']//span[text()='รวมส่วนลด']/../../..
    ${actual_txt_price_detail}=   Get Text    //*[@class='hidden sm:inline']//span[text()='รวมส่วนลด']/../../..
    ${actual_txt_price_detail} =  Replace String    ${actual_txt_price_detail}    \n    ${SPACE}
    Wait Until Element Is Visible    ${b2c_txt_shipping_origin_booking_detail_page}    timeout=${DEFAULT_TIMEOUT}
    Should Be Equal As Strings    ${actual_txt_price_detail}    รวมส่วนลด ${discount_amount} ${discount_value} ค่าธรรมเนียมประกัน ${insurance_fee_amount} ${insurance_fee_value} ค่าธรรมเนียม COD ${cod_fee_amount} ${cod_fee_value} ยอดสุทธิ ${total_price_amount} ${total_price_value}
    Should Be Equal    ${booking_summary}    ${actual_txt_title_booking_summary}

Click Print Parcel Label
    Wait Until Element Is Not Visible    ${b2c_img_loading}    timeout=${DEFAULT_TIMEOUT}
    ${print_parcel_labe_button}=    Replace String    ${b2c_btn_print_parcel_label}    {value}    ${Booking['text_print_parcel_label']}
    Click When Ready    ${print_parcel_labe_button}

Verify Parcel Label
    [Arguments]    ${size_a4}    ${size_a5}    ${size_8cm}    ${text_postcode_or_storecode}    ${value_receiver_postcode_or_storecode}    ${parcel_box}    ${parcel_size}    ${sender_name}    ${sender_phone}
    ...    ${sender_address}    ${sender_postcode_full}    ${receiver_name}    ${receiver_phone}    ${receiver_address}    ${receiver_postcode_full}
    ...    ${parcel_cod}    ${parcel_insure}    ${parcel_detail_remark}
    ${parcel_id}    Get Parcel ID
    ${b2c_txt_title_print_label}=    Replace String    ${b2c_txt_title_print_label}    {value}    ${Booking['text_print_parcel_label']}
    Wait Until Element Is Visible    ${b2c_txt_title_print_label}    timeout=${DEFAULT_TIMEOUT}
    ${b2c_txt_paper_size}=    Replace String    ${b2c_txt_paper_size}    {value}    ${Booking.text_paper_size['paper_size']}
    Wait Until Element Is Visible    ${b2c_txt_paper_size}    timeout=${DEFAULT_TIMEOUT}
    ${b2c_cbo_paper_size}=    Replace String    ${b2c_cbo_paper_size}    {value}    ${Booking.text_paper_size['paper_size']}
    Click When Ready    ${b2c_cbo_paper_size}
    ${b2c_txt_list_paper_size}=    Replace String    ${b2c_txt_list_paper_size}    {value}    ${Booking.text_paper_size['paper']}
    ${actual_list_paper_size}    Get Text    ${b2c_txt_list_paper_size}
    ${actual_list_paper_size} =  Replace String    ${actual_list_paper_size}    \n    ${SPACE}
    Should Be Equal As Strings    ${actual_list_paper_size}    ${size_a4} ${size_a5} ${size_8cm}
    ${b2c_img_logo_speed_d}=    Replace String    ${b2c_img_logo_speed_d}    {value}    ${Booking['text_print_parcel_label']}
    Wait Until Element Is Visible    ${b2c_img_logo_speed_d}    timeout=${DEFAULT_TIMEOUT}
    Run Keyword If    '${text_postcode_or_storecode}' == 'รหัสไปรษณีย์ปลายทาง'    Wait Until Element IS Visible    ${b2c_img_logo_home}    timeout=${DEFAULT_TIMEOUT}
    Run Keyword If    '${text_postcode_or_storecode}' == 'รหัสร้าน'    Wait Until Element IS Visible    ${b2c_img_logo_store}    timeout=${DEFAULT_TIMEOUT}
    ${b2c_img_qr_code}=    Replace String    ${b2c_img_qr_code}    {value}    ${Booking['text_print_parcel_label']}
    Wait Until Element Is Visible    ${b2c_img_qr_code}    timeout=${DEFAULT_TIMEOUT}
    ${actual_list_parcel_label_detail}    Get Text    ${b2c_txt_parcel_label_detail}
    ${actual_list_parcel_label_detail} =  Replace String    ${actual_list_parcel_label_detail}    \n    ${SPACE}
    ${parcel_text_size}=    Set Variable    ${EMPTY}
    IF    '${parcel_box}' == 'กล่อง'
        Run Keyword If    '${parcel_size}' == 'XS'    Set Suite Variable    ${parcel_text_size}    ${Booking.dry_parcel['parcel_text_size_XS']}
        Run Keyword If    '${parcel_size}' == 'S'    Set Suite Variable    ${parcel_text_size}    ${Booking.dry_parcel['parcel_text_size_S']}
        Run Keyword If    '${parcel_size}' == 'M'    Set Suite Variable    ${parcel_text_size}    ${Booking.dry_parcel['parcel_text_size_M']}
        Run Keyword If    '${parcel_size}' == 'L'    Set Suite Variable    ${parcel_text_size}    ${Booking.dry_parcel['parcel_text_size_L']}
        Run Keyword If    '${parcel_size}' == 'XL'    Set Suite Variable    ${parcel_text_size}    ${Booking.dry_parcel['parcel_text_size_XL']}
        Run Keyword If    '${parcel_size}' == 'XXL'    Set Suite Variable    ${parcel_text_size}    ${Booking.dry_parcel['parcel_text_size_XXL']}
        Run Keyword If    '${parcel_size}' == 'S0'    Set Suite Variable    ${parcel_text_size}    ${Booking.chilled_parcel['parcel_text_size_S0']}
        Run Keyword If    '${parcel_size}' == 'S1'    Set Suite Variable    ${parcel_text_size}    ${Booking.chilled_parcel['parcel_text_size_S1']}
        Run Keyword If    '${parcel_size}' == 'S2'    Set Suite Variable    ${parcel_text_size}    ${Booking.chilled_parcel['parcel_text_size_S2']}
        Run Keyword If    '${parcel_size}' == 'A1'    Set Suite Variable    ${parcel_text_size}    ${Booking.chilled_parcel['parcel_text_size_A1']}
        Run Keyword If    '${parcel_size}' == 'A2'    Set Suite Variable    ${parcel_text_size}    ${Booking.chilled_parcel['parcel_text_size_A2']}
        Run Keyword If    '${parcel_detail_remark}' == '-'    Should Be Equal As Strings    ${actual_list_parcel_label_detail}  
    ...    ${text_postcode_or_storecode} ${value_receiver_postcode_or_storecode} ${parcel_size} ${parcel_box} ${parcel_size} ${parcel_text_size} ผู้ส่ง : ${sender_name} (${sender_phone}) ${sender_address} ${sender_postcode_full} ผู้รับ : ${receiver_name} (${receiver_phone}) ${receiver_address} ${receiver_postcode_full} COD ${parcel_cod} ${parcel_insure} ${parcel_id}
    ...    ELSE    Should Be Equal As Strings    ${actual_list_parcel_label_detail}
    ...    ${text_postcode_or_storecode} ${value_receiver_postcode_or_storecode} ${parcel_size} ${parcel_box} ${parcel_size} ${parcel_text_size} ผู้ส่ง : ${sender_name} (${sender_phone}) ${sender_address} ${sender_postcode_full} ผู้รับ : ${receiver_name} (${receiver_phone}) ${receiver_address} ${receiver_postcode_full} หมายเหตุ : ${parcel_detail_remark} COD ${parcel_cod} ${parcel_insure} ${parcel_id}
    ELSE
        Run Keyword If    '${parcel_detail_remark}' == '-'    Should Be Equal As Strings    ${actual_list_parcel_label_detail}  
    ...    ${text_postcode_or_storecode} ${value_receiver_postcode_or_storecode} ${parcel_size} ${parcel_box} ${parcel_size} ผู้ส่ง : ${sender_name} (${sender_phone}) ${sender_address} ${sender_postcode_full} ผู้รับ : ${receiver_name} (${receiver_phone}) ${receiver_address} ${receiver_postcode_full} COD ${parcel_cod} ${parcel_insure} ${parcel_id}
    ...    ELSE    Should Be Equal As Strings    ${actual_list_parcel_label_detail}
    ...    ${text_postcode_or_storecode} ${value_receiver_postcode_or_storecode} ${parcel_size} ${parcel_box} ${parcel_size} ผู้ส่ง : ${sender_name} (${sender_phone}) ${sender_address} ${sender_postcode_full} ผู้รับ : ${receiver_name} (${receiver_phone}) ${receiver_address} ${receiver_postcode_full} หมายเหตุ : ${parcel_detail_remark} COD ${parcel_cod} ${parcel_insure} ${parcel_id}
    END

Verify Parcel Label When Select 7-ELEVEN Store
    [Arguments]    ${size_a4}    ${size_a5}    ${size_8cm}    ${text_postcode_or_storecode}    ${value_receiver_postcode_or_storecode}    ${parcel_box}    ${parcel_size}    ${sender_name}    ${sender_phone}
    ...    ${sender_address}    ${sender_postcode_full}    ${receiver_name}    ${receiver_phone}    ${store_address}
    ...    ${parcel_cod}    ${parcel_insure}    ${parcel_detail_remark}
    ${parcel_id}    Get Parcel ID
    ${b2c_txt_title_print_label}=    Replace String    ${b2c_txt_title_print_label}    {value}    ${Booking['text_print_parcel_label']}
    Wait Until Element Is Visible    ${b2c_txt_title_print_label}    timeout=${DEFAULT_TIMEOUT}
    ${b2c_txt_paper_size}=    Replace String    ${b2c_txt_paper_size}    {value}    ${Booking.text_paper_size['paper_size']}
    Wait Until Element Is Visible    ${b2c_txt_paper_size}    timeout=${DEFAULT_TIMEOUT}
    ${b2c_cbo_paper_size}=    Replace String    ${b2c_cbo_paper_size}    {value}    ${Booking.text_paper_size['paper_size']}
    Click When Ready    ${b2c_cbo_paper_size}
    ${b2c_txt_list_paper_size}=    Replace String    ${b2c_txt_list_paper_size}    {value}    ${Booking.text_paper_size['paper']}
    ${actual_list_paper_size}    Get Text    ${b2c_txt_list_paper_size}
    ${actual_list_paper_size} =  Replace String    ${actual_list_paper_size}    \n    ${SPACE}
    Should Be Equal As Strings    ${actual_list_paper_size}    ${size_a4} ${size_a5} ${size_8cm}
    ${b2c_img_logo_speed_d}=    Replace String    ${b2c_img_logo_speed_d}    {value}    ${Booking['text_print_parcel_label']}
    Wait Until Element Is Visible    ${b2c_img_logo_speed_d}    timeout=${DEFAULT_TIMEOUT}
    Run Keyword If    '${text_postcode_or_storecode}' == 'รหัสไปรษณีย์ปลายทาง'    Wait Until Element IS Visible    ${b2c_img_logo_home}    timeout=${DEFAULT_TIMEOUT}
    Run Keyword If    '${text_postcode_or_storecode}' == 'รหัสร้าน'    Wait Until Element IS Visible    ${b2c_img_logo_store}    timeout=${DEFAULT_TIMEOUT}
    ${b2c_img_qr_code}=    Replace String    ${b2c_img_qr_code}    {value}    ${Booking['text_print_parcel_label']}
    Wait Until Element Is Visible    ${b2c_img_qr_code}    timeout=${DEFAULT_TIMEOUT}
    ${actual_list_parcel_label_detail}    Get Text    ${b2c_txt_parcel_label_detail}
    ${actual_list_parcel_label_detail} =  Replace String    ${actual_list_parcel_label_detail}    \n    ${SPACE}
    ${parcel_text_size}=    Set Variable    ${EMPTY}
    IF    '${parcel_box}' == 'กล่อง'
        Run Keyword If    '${parcel_size}' == 'XS'    Set Suite Variable    ${parcel_text_size}    ${Booking.dry_parcel['parcel_text_size_XS']}
        Run Keyword If    '${parcel_size}' == 'S'    Set Suite Variable    ${parcel_text_size}    ${Booking.dry_parcel['parcel_text_size_S']}
        Run Keyword If    '${parcel_size}' == 'M'    Set Suite Variable    ${parcel_text_size}    ${Booking.dry_parcel['parcel_text_size_M']}
        Run Keyword If    '${parcel_size}' == 'L'    Set Suite Variable    ${parcel_text_size}    ${Booking.dry_parcel['parcel_text_size_L']}
        Run Keyword If    '${parcel_size}' == 'XL'    Set Suite Variable    ${parcel_text_size}    ${Booking.dry_parcel['parcel_text_size_XL']}
        Run Keyword If    '${parcel_size}' == 'XXL'    Set Suite Variable    ${parcel_text_size}    ${Booking.dry_parcel['parcel_text_size_XXL']}
        Run Keyword If    '${parcel_size}' == 'S0'    Set Suite Variable    ${parcel_text_size}    ${Booking.chilled_parcel['parcel_text_size_S0']}
        Run Keyword If    '${parcel_size}' == 'S1'    Set Suite Variable    ${parcel_text_size}    ${Booking.chilled_parcel['parcel_text_size_S1']}
        Run Keyword If    '${parcel_size}' == 'S2'    Set Suite Variable    ${parcel_text_size}    ${Booking.chilled_parcel['parcel_text_size_S2']}
        Run Keyword If    '${parcel_size}' == 'A1'    Set Suite Variable    ${parcel_text_size}    ${Booking.chilled_parcel['parcel_text_size_A1']}
        Run Keyword If    '${parcel_size}' == 'A2'    Set Suite Variable    ${parcel_text_size}    ${Booking.chilled_parcel['parcel_text_size_A2']}
        Run Keyword If    '${parcel_detail_remark}' == '-'    Should Be Equal As Strings    ${actual_list_parcel_label_detail}  
    ...    ${text_postcode_or_storecode} ${value_receiver_postcode_or_storecode} ${parcel_size} ${parcel_box} ${parcel_size} ${parcel_text_size} ผู้ส่ง : ${sender_name} (${sender_phone}) ${sender_address} ${sender_postcode_full} ผู้รับ : ${receiver_name} (${receiver_phone}) ${store_address} COD ${parcel_cod} ${parcel_insure} ${parcel_id}
    ...    ELSE    Should Be Equal As Strings    ${actual_list_parcel_label_detail}
    ...    ${text_postcode_or_storecode} ${value_receiver_postcode_or_storecode} ${parcel_size} ${parcel_box} ${parcel_size} ${parcel_text_size} ผู้ส่ง : ${sender_name} (${sender_phone}) ${sender_address} ${sender_postcode_full} ผู้รับ : ${receiver_name} (${receiver_phone}) ${store_address} หมายเหตุ : ${parcel_detail_remark} COD ${parcel_cod} ${parcel_insure} ${parcel_id}
    ELSE
        Run Keyword If    '${parcel_detail_remark}' == '-'    Should Be Equal As Strings    ${actual_list_parcel_label_detail}  
    ...    ${text_postcode_or_storecode} ${value_receiver_postcode_or_storecode} ${parcel_size} ${parcel_box} ${parcel_size} ผู้ส่ง : ${sender_name} (${sender_phone}) ${sender_address} ${sender_postcode_full} ผู้รับ : ${receiver_name} (${receiver_phone}) ${store_address} COD ${parcel_cod} ${parcel_insure} ${parcel_id}
    ...    ELSE    Should Be Equal As Strings    ${actual_list_parcel_label_detail}
    ...    ${text_postcode_or_storecode} ${value_receiver_postcode_or_storecode} ${parcel_size} ${parcel_box} ${parcel_size} ผู้ส่ง : ${sender_name} (${sender_phone}) ${sender_address} ${sender_postcode_full} ผู้รับ : ${receiver_name} (${receiver_phone}) ${store_address} หมายเหตุ : ${parcel_detail_remark} COD ${parcel_cod} ${parcel_insure} ${parcel_id}
    END
    
Click Print Label On Popup
    ${b2c_btn_print_parcel_label_popup}=    Replace String    ${b2c_btn_print_parcel_label_popup}    {value}    ${Booking['text_print_parcel_label']}
    common.Click When Ready    ${b2c_btn_print_parcel_label_popup}

Verify Date And Time With Time Distortion
    [Arguments]    ${locator}    ${booking_time}
    ${actual_booking_time}=    Get Text    ${locator}
    ${match_found}=    Set Variable    False
    FOR    ${time}    IN     @{booking_time}
        ${time_convert}    Convert Date    ${actual_booking_time}    date_format=%d-%m-%Y %H:%M    result_format=%d-%m-%Y %H:%M
        Should Be Equal    ${actual_booking_time}   ${time_convert}
        ${isequal}=    Run Keyword And Return Status    Should Be Equal    ${time}    ${actual_booking_time}
        Run Keyword IF  '${isequal}' == 'True'    Run Keywords    Set Suite Variable    ${match_found}    True
        ...    AND    Exit For Loop
    END
    Run Keyword IF  '${match_found}' == 'False'   Fail    No matching time found in the booking time.

Wait Until Loading Icon Success
    ${isvisible}=    Run Keyword And Ignore Error    Wait Until Page Contains Element    ${b2c_img_loading}    timeout=${DEFAULT_TIMEOUT}
    Wait Until Page Does Not Contain Element    ${b2c_img_loading}    timeout=${DEFAULT_TIMEOUT}
    Sleep    5s

Wait Until Page Loaded After Select Origin Shipping
    Wait Until Element Is Visible    ${b2c_img_loading_in_detail_after_set_origin_shipping}    timeout=${DEFAULT_TIMEOUT}
    Wait Until Element Is Not Visible    ${b2c_img_loading_in_detail_after_set_origin_shipping}    timeout=${DEFAULT_TIMEOUT}
    Sleep   3s
    ${b2c_txt_parcel_status_booking_detail_page}=    Replace String    ${b2c_txt_parcel_status_booking_detail_page}    {value}    ${Booking['text_parcel_status_waiting_entering']}
    Wait Until Element Is Visible    ${b2c_txt_parcel_status_booking_detail_page}    timeout=${DEFAULT_TIMEOUT}
    
Click Import File Button
    ${btn_import_file}=    Replace String    ${b2c_btn_import_file_detail_page}    {value}    ${Booking['text_btn_import']}
    common.Click When Ready    ${btn_import_file}

Click Download Import Error File
    ${b2c_btn_import_error_file}=    Replace String    ${b2c_btn_import_error_file}    {value}    ${Booking['text_import_time']}
    common.Click When Ready    ${b2c_btn_import_error_file}

Import Excel File Of Dry Parcel Template
    [Arguments]    ${excel_file}
    ${excel_file}   Normalize Path    ${excel_file}
    Execute JavaScript    document.getElementById('InputFile').removeAttribute('hidden');
    Wait Until Element is Visible    ${b2c_btn_import_file_in_popup}
    Choose File    ${b2c_btn_import_file_in_popup}    ${excel_file}

Verify Import File Popup
    [Arguments]    ${btn_import}    ${btn_template}    ${txt_importTime}
    ...    ${txt_fileName}    ${txt_importResult}    ${txt_fileImportError}
    ${btn_template_file}=    Replace String    ${b2c_btn_template_in_popup}    {value}    ${btn_template}
    ${b2c_txt_import_time}=    Replace String    ${b2c_txt_import_time}    {value}    ${txt_importTime}
    ${b2c_txt_file_name}=    Replace String    ${b2c_txt_file_name}    {value}    ${txt_fileName}
    ${b2c_txt_import_file_result}=    Replace String    ${b2c_txt_import_file_result}    {value}    ${txt_importResult}
    ${b2c_txt_file_import_error}=    Replace String    ${b2c_txt_file_import_error}    {value}    ${txt_fileImportError}
    Wait Until Page Contains Element    ${b2c_txt_import_file_in_popup}
    Wait Until Element Is Visible    ${btn_template_file}   timeout=${DEFAULT_TIMEOUT}
    Wait Until Element Is Visible    ${b2c_txt_import_time}    timeout=${DEFAULT_TIMEOUT}
    Wait Until Element Is Visible    ${b2c_txt_file_name}    timeout=${DEFAULT_TIMEOUT}
    Wait Until Element Is Visible    ${b2c_txt_import_file_result}    timeout=${DEFAULT_TIMEOUT}
    Wait Until Element Is Visible    ${b2c_txt_file_import_error}    timeout=${DEFAULT_TIMEOUT}
    ${actual_b2c_btn_import_file_in_popup}=    Get Text    ${b2c_txt_import_file_in_popup}
    ${actual_btn_template_file}=    Get Text    ${btn_template_file}
    ${actual_b2c_txt_import_time}=    Get Text    ${b2c_txt_import_time}
    ${actual_b2c_txt_file_name}=    Get Text    ${b2c_txt_file_name}
    ${actual_b2c_txt_import_file_result}=    Get Text    ${b2c_txt_import_file_result}
    ${actual_b2c_txt_file_import_error}=    Get Text    ${b2c_txt_file_import_error}
    Should Be Equal    ${actual_b2c_btn_import_file_in_popup}    ${btn_import}
    Should Be Equal    ${actual_btn_template_file}    ${btn_template}
    Should Be Equal    ${actual_b2c_txt_import_time}    ${txt_importTime}
    Should Be Equal    ${actual_b2c_txt_file_name}    ${txt_fileName}
    Should Be Equal    ${actual_b2c_txt_import_file_result}    ${txt_importResult}
    Should Be Equal    ${actual_b2c_txt_file_import_error}    ${txt_fileImportError}

Click Parcel List With Waiting For Entering Parcel To System Status
    ${crd_parcel_list}=    Replace String    ${b2c_crd_parcel_list}    {value}    ${booking['text_parcel_status_waiting_entering']}
    common.Click When Ready    ${crd_parcel_list}

Click Save Edit Data
    ${btn_edit}=    Replace String    ${b2c_btn_save_edit_created_parcel}    {value}    ${booking['text_btn_save_edit']}
    common.Click When Ready    ${btn_edit}

Click Edit Data
    ${btn_edit}=    Replace String    ${b2c_btn_edit_created_parcel}    {value}    ${booking['text_btn_edit']}
    common.Click When Ready    ${btn_edit}

Verify Can Edit Data Sender
    Wait Until Element Is Visible    ${b2c_btn_clear_sender_phone}    timeout=${DEFAULT_TIMEOUT}
    Wait Until Element Is Visible    ${b2c_btn_clear_sender_name}    timeout=${DEFAULT_TIMEOUT}
    Wait Until Element Is Visible    ${b2c_btn_clear_sender_address}    timeout=${DEFAULT_TIMEOUT}
    Mouse Over    ${b2c_txtbox_sender_postcode_edit}
    Wait Until Element Is Visible    ${b2c_btn_clear_sender_postcode}    timeout=${DEFAULT_TIMEOUT}

Edit Phone Sender
    [Arguments]    ${input_phone_sender}
    common.Click When Ready    ${b2c_btn_clear_sender_phone}
    Input Text    ${txtbox_phone_sender}    ${input_phone_sender}

Edit Name Sender
    [Arguments]    ${input_name_sender}
    common.Click When Ready    ${b2c_btn_clear_sender_name}
    Input Text    ${txtbox_name_sender}    ${input_name_sender}

Edit Address Sender
    [Arguments]    ${input_address_sender}
    common.Click When Ready    ${b2c_btn_clear_sender_address}
    Input Text    ${txtbox_address_sender}    ${input_address_sender}

Edit Postcode Sender
    [Arguments]    ${input_postcode_sender}
    Mouse Over    ${b2c_txtbox_sender_postcode_edit}
    common.Click When Ready    ${b2c_btn_clear_sender_postcode}
    Input Text    ${txtbox_postcode_sender}    ${input_postcode_sender}

Verify Can Edit Data Receiver
    Wait Until Element Is Visible    ${b2c_btn_clear_receiver_phone}    timeout=${DEFAULT_TIMEOUT}
    Wait Until Element Is Visible    ${b2c_btn_clear_receiver_name}    timeout=${DEFAULT_TIMEOUT}
    Wait Until Element Is Visible    ${b2c_btn_clear_receiver_address}    timeout=${DEFAULT_TIMEOUT}
    Mouse Over    ${b2c_txtbox_receiver_postcode_edit}
    Wait Until Element Is Visible    ${b2c_btn_clear_receiver_postcode}    timeout=${DEFAULT_TIMEOUT}

Edit Phone Receiver
    [Arguments]    ${input_phone_receiver}
    common.Click When Ready    ${b2c_btn_clear_receiver_phone}
    common.Input When Ready    ${txtbox_phone_receiver}    ${input_phone_receiver}

Edit Name Receiver
    [Arguments]    ${input_name_receiver}
    common.Click When Ready    ${b2c_btn_clear_receiver_name}
    common.Input When Ready    ${txtbox_name_receiver}    ${input_name_receiver}

Edit Address Receiver
    [Arguments]    ${input_address_receiver}
    common.Click When Ready    ${b2c_btn_clear_receiver_address}
    common.Input When Ready    ${txtbox_address_receiver}    ${input_address_receiver}

Edit Postcode Receiver
    [Arguments]    ${input_postcode_receiver}
    Mouse Over    ${b2c_txtbox_receiver_postcode_edit}
    common.Click When Ready    ${b2c_btn_clear_receiver_postcode}
    common.Input When Ready    ${txtbox_postcode_receiver}    ${input_postcode_receiver}

Verify Can Edit Data Parcel
    ${insure_amount}=    Replace String    ${txtbox_insure_amount}    {value}    ${Booking['parcel_detail_insure_amount']}
    Element Should Be Enabled    ${b2c_btn_increase_cod_value}
    Element Should Be Enabled   ${b2c_btn_increase_insure_value}
    Element Should Be Enabled    ${b2c_btn_clear_parcel_remark_postcode}

Edit Parcel Remark
    [Arguments]    ${value}
    ${txtbox_parcel_remark}=    Replace String    ${txtbox_parcel_remark}    {value}    ${Booking['parcel_detail_remark']}
    common.Click When Ready    ${b2c_btn_clear_parcel_remark_postcode}
    common.Input When Ready    ${txtbox_parcel_remark}    ${value}

Edit Insurance
    [Arguments]    ${value}
    ${txtbox_insure_amount}=    Replace String    ${txtbox_insure_amount}    {value}    ${Booking['parcel_detail_insure_amount']}
    Clear Element Text    ${txtbox_insure_amount}
    common.Input When Ready    ${txtbox_insure_amount}    ${value}
    
Verify Import Excel File Inspection Results
    [Arguments]    ${file_name}    ${import_success}    ${import_fail}
    ${b2c_txt_value_import_time}=    Replace String    ${b2c_txt_value_import_time}    {value}    ${Booking['text_import_time']}
    ${b2c_txt_value_import_file_name_}=    Replace String    ${b2c_txt_value_import_file_name_}    {value}    ${Booking['text_import_time']}
    ${b2c_txt_value_import_success}=    Replace String    ${b2c_txt_value_import_success}    {value}    ${Booking['text_import_time']}
    ${b2c_txt_value_import_fail}=    Replace String    ${b2c_txt_value_import_fail}    {value}    ${Booking['text_import_time']}
    ${b2c_txt_value_import_error_file}=    Replace String    ${b2c_txt_value_import_error_file}    {value}    ${Booking['text_import_time']}
    ${actual_file_name}=    Get Text    ${b2c_txt_value_import_file_name_}
    ${actual_import_success}=    Get Text    ${b2c_txt_value_import_success}
    ${actual_import_success}=  Replace String   ${actual_import_success}   \n   ${SPACE}
    ${actual_import_fail}=    Get Text    ${b2c_txt_value_import_fail}
    ${actual_import_fail}=  Replace String   ${actual_import_fail}   \n   ${SPACE}
    Verify Date Format Of Import Excel File    ${b2c_txt_value_import_time}
    Should Be Equal    ${actual_file_name}    ${file_name}
    Should Be Equal    ${actual_import_success}    ${import_success}
    Should Be Equal    ${actual_import_fail}    ${import_fail}

Verify Date Format Of Import Excel File
    [Arguments]    ${locator}
    Wait Until Element Is Visible    ${locator}
    ${actual_import_time}=    Get Text    ${locator}
    ${time_convert}    Convert Date    ${actual_import_time}    date_format=%d-%m-%Y %H:%M    result_format=%d-%m-%Y %H:%M
    Should Be Equal    ${actual_import_time}   ${time_convert}

Select Booked Pickup Time From List
    [Arguments]    ${round}    ${tomorrow}    ${parcel_num}    ${today}    ${price}
    ${today_pattern}    Set Date Pattern    ${today}
    ${tomorrow_pattern}    Set Date Pattern    ${tomorrow}

    ${actual_round} =  Replace String    ${b2c_txt_pickup_schedule}    {round}    ${round}
    ${actual_pickup_date} =  Replace String    ${actual_round}    {pickup_date}    ${Booking.pickup_schedule['pickup_date']} ${tomorrow_pattern}
    ${actual_parcel} =  Replace String    ${actual_pickup_date}    {parcel_num}    ${Booking.pickup_schedule['parcel_number']} ${parcel_num}
    ${actual_cut_off_time} =  Replace String    ${actual_parcel}    {cut_off_time}    ${Booking.pickup_schedule['cut_off_time']} ${today_pattern}
    ${actual_pickup_schedule_checkbox} =  Replace String    ${actual_cut_off_time}    {price}    ${Booking.pickup_schedule['price']} ${price}
    Set Suite Variable    ${actual_pickup_schedule_checkbox}
    ${status}=    Set Variable    False
    WHILE    '${status}' == 'False'
        ${status}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${actual_pickup_schedule_checkbox}    2s
        Exit For Loop If    '${status}' == 'True'
        ${nextpage}=    Get Element Attribute    ${b2c_btn_status_next_page_pickup_schedule}    aria-disabled
        Run Keyword If    '${status}' == 'True'    Exit For Loop
        ...    ELSE    common.Click When Ready    ${b2c_btn_next_page_pickup_schedule}
    END
    common.Click When Ready    ${actual_pickup_schedule_checkbox}

Verify Booking List In Booking Detail Page
    [Arguments]    ${text_booking_id}    ${text_booking_name}    ${text_booking_time}    ${text_shipping_origin}
    ${actual_text_booking_id}=    Replace String    ${b2c_txt_booking_id_booking_detail_page}    {value}    ${text_booking_id}
    ${actual_text_booking_name}=    Replace String    ${b2c_txt_booking_name_booking_detail_page}    {value}    ${text_booking_name}
    ${actual_text_booking_time}=    Replace String    ${b2c_txt_booking_date_and_time_booking_detail_page}    {value}    ${text_booking_time}
    ${actual_text_shipping_origin}=    Replace String    ${b2c_txt_label_shipping_origin_booking_detail_page}    {value}    ${text_shipping_origin}
    Sleep    3s
    Wait Until Element Is VIsible    ${actual_text_booking_id}    timeout=${DEFAULT_TIMEOUT}
    Wait Until Element Is VIsible    ${actual_text_booking_name}    timeout=${DEFAULT_TIMEOUT}
    Wait Until Element Is VIsible    ${actual_text_booking_time}    timeout=${DEFAULT_TIMEOUT}
    Wait Until Element Is VIsible    ${actual_text_shipping_origin}    timeout=${DEFAULT_TIMEOUT}

Verify Popup To Edit Booking List
    [Arguments]    ${parcel_type}    ${booking_name}    ${shipping_origin}
    ${actual_text_parcel_type}=    Replace String    ${b2c_txt_label_in_edit_popup_booking_list}    {value}        ${parcel_type}
    ${actual_text_booking_name}=    Replace String    ${b2c_txt_label_in_edit_popup_booking_list}    {value}        ${booking_name}
    ${actual_text_shipping_origin}=    Replace String    ${b2c_txt_label_in_edit_popup_booking_list}    {value}        ${shipping_origin}
    Wait Until Element Is VIsible    ${actual_text_parcel_type}    timeout=${DEFAULT_TIMEOUT}
    Wait Until Element Is VIsible    ${actual_text_booking_name}    timeout=${DEFAULT_TIMEOUT}
    Wait Until Element Is VIsible    ${actual_text_shipping_origin}    timeout=${DEFAULT_TIMEOUT}

Verify Booking Detail Page After Import File
    [Arguments]    ${status}    ${parcel_id}    ${parcel_num}
    ${actual_parcel_list_status}=    Replace String    ${b2c_txt_parcel_list}    {status}    ${status}
    ${actual_parcel_list}=    Replace String    ${actual_parcel_list_status}    {value}    ${parcel_id}
    ${actual_parcel_id}=    Replace String    ${b2c_txt_parcel_id}    {id}    ${parcel_id}
    ${count_card}=    Set Variable    0
    Wait Until Page Does Not Contain    ${b2c_txt_import_file_in_popup}
    FOR    ${index}    IN RANGE    ${parcel_num}
        Wait Until Element Is Visible    ${actual_parcel_list}    timeout=60s
        ${boolean_text}=    Get Element Attribute    ${b2c_img_next_page_parcel_list}    aria-disabled
        ${boolean}=    Run Keyword And Return Status    Should Be Equal As Strings    ${boolean_text}    false
        ${count_new_card}=    Get Element Count    ${actual_parcel_list}
        ${count_card}=    Evaluate    ${count_card} + ${count_new_card}
        Exit For Loop If    ${boolean} == False
        common.Click When Ready    ${b2c_btn_next_page_parcel_list}
    END
    Should Be Equal As Strings    ${count_card}    ${parcel_num}
    Scroll Window To Vertical    0
        
Verify Booking Detail Page After Canceled
    [Arguments]    ${status}    ${parcel_id}    ${parcel_num}
    ${actual_parcel_list_status}=    Replace String    ${b2c_txt_parcel_list}    {status}    ${status}
    ${actual_parcel_list}=    Replace String    ${actual_parcel_list_status}    {value}    ${parcel_id}
    ${actual_parcel_id}=    Replace String    ${b2c_txt_parcel_id}    {id}    ${parcel_id}
    ${count_card}=    Set Variable    0
    # Verify number of parcels
    FOR    ${index}    IN RANGE    ${parcel_num}
        Wait Until Element Is Visible    ${actual_parcel_list}    timeout=60s
        ${boolean_text}=    Get Element Attribute    ${b2c_img_next_page_parcel_list}    aria-disabled
        ${boolean}=    Run Keyword And Return Status    Should Be Equal As Strings    ${boolean_text}    false
        ${count_new_card}=    Get Element Count    ${actual_parcel_list}
        ${count_card}=    Evaluate    ${count_card} + ${count_new_card}
        Exit For Loop If    ${boolean} == False
        common.Click When Ready    ${b2c_btn_next_page_parcel_list}
    END
    Should Be Equal As Strings    ${count_card}    ${parcel_num}