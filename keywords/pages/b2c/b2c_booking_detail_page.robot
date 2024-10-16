*** Keywords ***
Click Button
    [Arguments]    ${btn}
    Wait Until Element Is Enabled    ${btn}    
    Click Element    ${btn}

Select Draft Booking
    common.Click When Ready    ${b2c_crd_list_of_parcels}

Verify Booking Detail Page After Draft
    [Arguments]    ${booking_list}    ${status}    ${parcel_id}    ${img_heart_sender}    ${sender_name}    ${sender_phone}
    ...    ${img_heart_receiver}    ${receiver_name}    ${receiver_phone}    ${receiver_address}    ${receiver_postcode_full}    
    ...    ${parcel_size}    ${price_value}    ${buy_insurance}    ${cod_value}
    ${receiver_address}=    Set Variable If    '${receiver_address}' == '-' and '${receiver_postcode_full}' == '-'    -    ${receiver_address} ${receiver_postcode_full}
    ${b2c_txt_booking_list} =  Replace String    ${b2c_txt_booking_list}    {value}    ${booking_list}
    ${b2c_txt_list_of_parcels_status}=    Replace String    ${b2c_txt_list_of_parcels_status}    {value}    ${status}
    Wait Until Element Is Enabled    ${b2c_crd_list_of_parcels}     timeout=60
    Wait Until Page Contains Element    ${b2c_txt_booking_list}
    ${actual_text_list_of_parcels}=    Get Text    ${b2c_crd_list_of_parcels}
    ${actual_text_list_of_parcels} =  Replace String    ${actual_text_list_of_parcels}    \n    ${SPACE}
    Should Be Equal As Strings    ${actual_text_list_of_parcels}    ผู้ส่ง : ${sender_name} (${sender_phone}) ผู้รับ : ${receiver_name} (${receiver_phone}) ${receiver_address} ประเภทพัสดุ : ราคา : ${price_value}บาท ซื้อประกัน : ${buy_insurance} บาท COD : ${cod_value} บาท พิมพ์ใบจ่ายหน้าพัสดุ -
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
    # Wait Until Element Is Not Visible    ${b2c_img_loading}    timeout=${DEFAULT_TIMEOUT}
    ${b2c_btn_edit_booking_list}=    Replace String    ${b2c_btn_edit_booking_list}    {value}    ${Booking['text_booking_list']}
    common.Click When Ready    ${b2c_btn_edit_booking_list}

Verify Edit Booking List Popup
    [Arguments]    ${parcel_type}    ${booking_name}    ${shipping_origin_aria}
    ${text_edit_booking_list}=    Replace String    ${b2c_txt_edit_booking_list}    {value}    ${Booking['text_edit_booking_list']}
    Wait Until Element Is Visible    ${text_edit_booking_list}    timeout=${DEFAULT_TIMEOUT}
    Run Keyword If    '${parcel_type}' != '${EMPTY}'    Run Keywords    
    ...    ${text_parcel_type}=    Replace String    ${b2c_txt_parcel_type}    {value}    ${Booking['text_parcel_type']}
    ...    AND    ${actual_text_parcel_type}    Get Text    ${text_parcel_type}
    ...    AND    ${actual_text_parcel_type} =  Replace String    ${actual_text_parcel_type}    \n    ${SPACE}
    ...    AND    Should Be Equal As Strings    ${actual_text_parcel_type}    ประเภทพัสดุ : ${parcel_type}
    ${text_booking_name}=    Replace String    ${b2c_txt_booking_name}    {value}    ${Booking['text_booking_name']}
    ${actual_text_booking_name}    Get Value    ${text_booking_name}
    ${text_shipping_origin_aria}=    Replace String    ${b2c_txt_shipping_origin_aria}    {value}    ${Booking['text_shipping_origin_aria']}
    ${actual_text_shipping_origin_aria}    Get Text    ${text_shipping_origin_aria}
    Log To Console    ${actual_text_shipping_origin_aria}
    Should Be Equal As Strings    ${actual_text_booking_name}    ${booking_name}
    Should Be Equal As Strings    ${actual_text_shipping_origin_aria}    ${shipping_origin_aria}

Select Pickup Schedule Tab
    ${tab_pickup_Schedule} =  Replace String    ${b2c_tab_pickup_Schedule}    {value}    ${Booking.tab_shipping_origin['car_pickup']}
    common.Click When Ready    ${tab_pickup_Schedule}

Verify Display Pickup Schedule Data
    [Arguments]    ${receiving_type}    ${pickup_date}    ${txt_parcel_number}    ${parcel_number}    ${txt_cut_off_time}    ${cut_off_time}
    ...    ${txt_price}    ${price}
    ${nextDay}    common.Set Next DAY
    ${today}    common.Set Date Pattern
    Wait Until Element Is Visible    ${b2c_crd_list_of_pickup_schedule}    timeout=60s
    ${count}=    Get Element Count    ${b2c_crd_list_of_pickup_schedule}
    FOR    ${index}    IN RANGE    1    ${count} + 1
        ${item}=    Set Variable    (${b2c_crd_list_of_pickup_schedule})[${index}]
        Scroll Element Into View    ${item}
        Register Keyword To Run On Failure    NOTHING
        ${actual_text}=    Get Text    ${item}
        ${actual_text}=    Replace String    ${actual_text}    \n    ${SPACE}
        Log To Console    ${actual_text}
        ${card_text_list}=    Run Keyword And Return Status    Should Be Equal As Strings    ${actual_text}
        ...    ${receiving_type} ${pickup_date} ${nextDay} ${txt_parcel_number} ${parcel_number} ${txt_cut_off_time} ${today} ${cut_off_time} ${txt_price} ${price}
        Set Suite Variable    ${item}
        Exit For Loop If    ${card_text_list}
    END

Select Parcel Pickup Schedule 
    common.Click When Ready    ${item}${b2c_btn_select_pickup_schedule}

Click Save Button In Edit Booking List Popup
    ${b2c_btn_save_shipping_origin} =  Replace String    ${b2c_btn_save_shipping_origin}    {value}    ${Booking['text_save']}
    common.Click When Ready    ${b2c_btn_save_shipping_origin}   

Select Shipping Origin Tab 
    [Arguments]    ${aria}
    ${tab_shipping_origin_aria} =  Replace String    ${b2c_tab_shipping_origin_aria}    {value}    ${aria}
    Click When Ready    ${tab_shipping_origin_aria}

Search Shipping Store
    [Arguments]    ${code}
    ${textbox_search_store}=    Replace String    ${b2c_txtbox_search_store}    {value}    ${Booking['text_search_store_on_map']}
    Wait Until Element Is Visible    ${textbox_search_store}
    Scroll Element Into View    ${textbox_search_store}
    Input When Ready    ${textbox_search_store}    ${code}
    ${search_result_store} =  Replace String    ${b2c_txt_search_result_store}    {value}    ${code}
    Click When Ready    ${search_result_store}

Click Select Store On Map
    ${select_store_button} =  Replace String    ${b2c_btn_select_store}    {value}    ${Booking['text_select_store_on_map']}
    common.Scroll Window To Vertical    100
    Wait Until Element Is Visible    ${select_store_button}    timeout=${DEFAULT_TIMEOUT}
    Click When Ready    ${select_store_button}

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

############################ เตรียมลบ - แต่รอรันเช็คหลังจากระบบใช้ได้ก่อน
# Verify Booking Detail Page
#     [Arguments]    ${title}    ${booking_id}    ${booking_name}    ${bookig_time}    ${title_parcel_list}    ${parcel_status}
#     ...    ${img_heart_sender}    ${sender_name}    ${sender_phone}
#     ...    ${img_heart_receiver}    ${receiver_name}    ${receiver_phone}    ${receiver_address}    ${receiver_postcode_full}    ${parcel_type}    ${price}    ${buy_insurance}    ${cod}    
#     ...    ${booking_summary}    ${discount_amount}    ${discount_value}    ${insurance_fee_amount}    ${insurance_fee_value}
#     ...    ${cod_fee_amount}    ${cod_fee_value}    ${total_price_amount}    ${total_price_value}
#     Log    Booking List
#     Wait Until Element Is Visible    ${b2c_txt_booking_list}    timeout=${DEFAULT_TIMEOUT}
#     ${actual_text_title}=    Get text    ${b2c_txt_booking_list}
#     ${actaul_bookig_id}=    Get Text    ${b2c_txt_booking_id_booking_detail_page}
#     ${actaul_booking_name}=    Get Text    ${b2c_txt_booking_name_booking_detail_page}
#     Verify Date And Time With Time Distortion    ${b2c_txt_booking_date_and_time_booking_detail_page}    ${bookig_time}
#     ${actaul_shipping_origin}=    Get Text    ${b2c_txt_shipping_origin_booking_detail_page}
#     Should Be Equal    ${title}    ${actual_text_title}
#     Should Be Equal    ${booking_id}    ${actaul_bookig_id}
#     Should Be Equal    ${booking_name}    ${actaul_booking_name}
#     Should Be Empty    ${actaul_shipping_origin}
#     Log    Parcel List
#     Wait Until Element Is Visible    ${b2c_txt_parcel_list_booking_detail_page}    timeout=${DEFAULT_TIMEOUT}
#     ${actual_title_parcel_list}=    Get Text    ${b2c_txt_parcel_list_booking_detail_page}
#     ${b2c_txt_parcel_status_booking_detail_page}=    Replace String    ${b2c_txt_parcel_status_booking_detail_page}    {value}    ${parcel_status}
#     ${actaul_parcel_status}=    Get Text    ${b2c_txt_parcel_status_booking_detail_page}
#     Wait Until Element Is Enabled    ${b2c_crd_list_of_parcels}     timeout=60
#     ${actual_text_list_of_parcels}=    Get Text    ${b2c_crd_list_of_parcels}
#     ${actual_text_list_of_parcels} =  Replace String    ${actual_text_list_of_parcels}    \n    ${SPACE}
#     Should Be Equal As Strings    ${actual_text_list_of_parcels}    ผู้ส่ง : ${sender_name} (${sender_phone}) ผู้รับ : ${receiver_name} (${receiver_phone}) ${receiver_address} ${receiver_postcode_full} ประเภทพัสดุ : ${parcel_type} ราคา : ${price}บาท ซื้อประกัน : ${buy_insurance} บาท COD : ${cod} บาท พิมพ์ใบจ่ายหน้าพัสดุ -
#     Should Be Equal    ${title_parcel_list}    ${actual_title_parcel_list}
#     Should Be Equal    ${parcel_status}    ${actaul_parcel_status}
#     #Sender Heart
#     IF         '${img_heart_sender}' == 'รูปหัวใจไม่มีสี'
#         Wait Until Page Contains Element    ${b2c_img_white_heart_front_sender}     
#     ELSE IF    '${img_heart_sender}' == 'รูปหัวใจสีแดง'
#         Wait Until Page Contains Element    ${b2c_img_red_heart_front_sender}
#     END
#     #Receiver Heart
#     IF         '${img_heart_receiver}' == 'รูปหัวใจไม่มีสี'
#         Wait Until Page Contains Element    ${b2c_img_white_heart_front_receiver}  
#     ELSE IF    '${img_heart_receiver}' == 'รูปหัวใจสีแดง'
#         Wait Until Page Contains Element    ${b2c_img_red_heart_front_receiver} 
#     END
#     Wait Until Element Is Enabled    ${b2c_ico_trash_red}
#     Wait Until Element Is Visible    ${b2c_btn_print_parcel_label}    timeout=${DEFAULT_TIMEOUT}
#     Log    Booking Summary
#     Wait Until Element Is Visible    ${b2c_txt_booking_summary_booking_detail_page}    timeout=${DEFAULT_TIMEOUT}
#     ${actual_txt_title_booking_summary}=    Get Text    ${b2c_txt_booking_summary_booking_detail_page}
#     Wait Until Element Is Visible    //*[@class='hidden sm:inline']//span[text()='รวมส่วนลด']/../../..    timeout=${DEFAULT_TIMEOUT}
#     Scroll Element Into View    //*[@class='hidden sm:inline']//span[text()='รวมส่วนลด']/../../..
#     ${acrual_txt_price_detail}=   Get Text    //*[@class='hidden sm:inline']//span[text()='รวมส่วนลด']/../../..
#     ${acrual_txt_price_detail} =  Replace String    ${acrual_txt_price_detail}    \n    ${SPACE}
#     Should Be Equal As Strings    ${acrual_txt_price_detail}    รวมส่วนลด ${discount_amount} ${discount_value} ค่าธรรมเนียมประกัน ${insurance_fee_amount} ${insurance_fee_value} ค่าธรรมเนียม COD ${cod_fee_amount} ${cod_fee_value} ยอดสุทธิ ${total_price_amount} ${total_price_value}
#     Should Be Equal    ${booking_summary}    ${actual_txt_title_booking_summary}

Verify Booking Detail Page
    [Arguments]    ${title}    ${booking_id}    ${parcel_id}    ${booking_name}    ${bookig_time}    ${title_parcel_list}    ${parcel_status}
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
    ${b2c_txt_shipping_origin_booking_detail_page}=    Replace String    ${b2c_txt_shipping_origin_booking_detail_page}    {value}    ${Booking['text_shipping_origin_aria']}
    ${b2c_txt_parcel_status_booking_detail_page}=    Replace String    ${b2c_txt_parcel_status_booking_detail_page}    {value}    ${parcel_status}
    ${b2c_txt_booking_id_booking_detail_page}=    Replace String    ${b2c_txt_booking_id_booking_detail_page}    {value}    ${Booking['text_booking_id_label']}
    Wait Until Element Is Enabled    ${b2c_crd_list_of_parcels}     timeout=60
    Wait Until Element Is Visible    ${b2c_txt_booking_list}    timeout=${DEFAULT_TIMEOUT}
    ${actual_text_title}=    Get text    ${b2c_txt_booking_list}
    ${actaul_booking_name}=    Get Text    ${b2c_txt_booking_name_booking_detail_page}
    Verify Date And Time With Time Distortion    ${text_booking_date_and_time_booking_detail_page}    ${bookig_time}
    Wait Until Element Is Visible    ${b2c_txt_shipping_origin_booking_detail_page}    timeout=${DEFAULT_TIMEOUT}
    Element Should Contain    ${b2c_txt_shipping_origin_booking_detail_page}    ${origin_shipping}
    Wait Until Element Is Visible    ${b2c_txt_parcel_status_booking_detail_page}    timeout=${DEFAULT_TIMEOUT}
    b2c_booking_delivery_page.Verify Booking ID Format And Value    ${b2c_txt_booking_id_booking_detail_page}    ${booking_id}
    b2c_booking_delivery_page.Verify Parcel ID Format And Value    ${booking_txt_parcel_id_booking_detail_page}    ${parcel_id}
    Should Be Equal    ${title}    ${actual_text_title}
    Should Be Equal    ${booking_name}    ${actaul_booking_name}
    Log    Parcel List
    Wait Until Element Is Visible    ${b2c_txt_parcel_list_booking_detail_page}    timeout=${DEFAULT_TIMEOUT}
    ${actual_title_parcel_list}=    Get Text    ${b2c_txt_parcel_list_booking_detail_page}
    ${actaul_parcel_status}=    Get Text    ${b2c_txt_parcel_status_booking_detail_page}
    ${actual_text_list_of_parcels}=    Get Text    ${b2c_crd_list_of_parcels}
    ${b2c_txt_parcel_status_booking_detail_page}=    Replace String    ${b2c_txt_parcel_status_booking_detail_page}    {value}    ${parcel_status}
    ${actual_text_list_of_parcels} =  Replace String    ${actual_text_list_of_parcels}    \n    ${SPACE}
    Wait Until Element Is Enabled    ${b2c_crd_list_of_parcels}     timeout=60
    Should Be Equal As Strings    ${actual_text_list_of_parcels}    ผู้ส่ง : ${sender_name} (${sender_phone}) ผู้รับ : ${receiver_name} (${receiver_phone}) ${receiver_address} ${receiver_postcode_full} ประเภทพัสดุ : ${parcel_type} ราคา : ${price}บาท ซื้อประกัน : ${insure_value} บาท COD : ${cod} บาท พิมพ์ใบจ่ายหน้าพัสดุ -
    Should Be Equal    ${title_parcel_list}    ${actual_title_parcel_list}
    Should Be Equal    ${parcel_status}    ${actaul_parcel_status}
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
    Wait Until Element IS Visible    ${b2c_ico_location_receiver}    timeout=${DEFAULT_TIMEOUT}
    ${b2c_img_qr_code}=    Replace String    ${b2c_img_qr_code}    {value}    ${Booking['text_print_parcel_label']}
    Wait Until Element Is Visible    ${b2c_img_qr_code}    timeout=${DEFAULT_TIMEOUT}
    ${actual_list_parcel_label_detail}    Get Text    ${b2c_txt_parcel_label_detail}
    ${actual_list_parcel_label_detail} =  Replace String    ${actual_list_parcel_label_detail}    \n    ${SPACE}
    Run Keyword If    '${parcel_detail_remark}' == '-'    Should Be Equal As Strings    ${actual_list_parcel_label_detail}  
    ...    ${text_postcode_or_storecode} ${value_receiver_postcode_or_storecode} ${parcel_size} ${parcel_box} ${parcel_size} ผู้ส่ง : ${sender_name} (${sender_phone}) ${sender_address} ${sender_postcode_full} ผู้รับ : ${receiver_name} (${receiver_phone}) ${receiver_address} ${receiver_postcode_full} COD ${parcel_cod} ${parcel_insure} ${parcel_id}
    ...    ELSE    Should Be Equal As Strings    ${actual_list_parcel_label_detail}
    ...    ${text_postcode_or_storecode} ${value_receiver_postcode_or_storecode} ${parcel_size} ${parcel_box} ${parcel_size} ผู้ส่ง : ${sender_name} (${sender_phone}) ${sender_address} ${sender_postcode_full} ผู้รับ : ${receiver_name} (${receiver_phone}) ${receiver_address} ${receiver_postcode_full} หมายเหตุ ${parcel_detail_remark} COD ${parcel_cod} ${parcel_insure} ${parcel_id}

Click Print Label On Popup
    ${b2c_btn_print_parcel_label_popup}=    Replace String    ${b2c_btn_print_parcel_label_popup}    {value}    ${Booking['text_print_parcel_label']}
    common.Click When Ready    ${b2c_btn_print_parcel_label_popup}

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

Wait Until Edit Complete Popup And Page Loading Success
    ${b2c_txt_edit_complete}=    Replace String    ${b2c_txt_edit_complete}    {value}    ${Booking['text_edit_complete']}
    Wait Until Element Is Visible    ${b2c_txt_edit_complete}    timeout=${DEFAULT_TIMEOUT}
    Wait Until Element Is Not Visible    ${b2c_txt_edit_complete}    timeout=${DEFAULT_TIMEOUT}
    Wait Until Element Is Visible    ${b2c_img_loading}    timeout=${DEFAULT_TIMEOUT}
    Wait Until Element Is Not Visible    ${b2c_img_loading}    timeout=${DEFAULT_TIMEOUT}
    
Wait Until Page Loaded After Select Origin Shipping
    [Arguments]    ${parcel_status}
    ${b2c_txt_parcel_status_booking_detail_page}=    Replace String    ${b2c_txt_parcel_status_booking_detail_page}    {value}    ${parcel_status}
    Wait Until Element Is Visible    ${b2c_txt_parcel_status_booking_detail_page}    timeout=${DEFAULT_TIMEOUT}
