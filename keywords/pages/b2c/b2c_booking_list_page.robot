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



