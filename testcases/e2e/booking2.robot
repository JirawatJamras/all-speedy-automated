*** Settings ***
Resource          ../../resourses/import.robot
Resource          ../../resourses/init_website.robot
Test Setup        Run Keywords    Open Chrome Browser    chrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result with date
Test Teardown     Close Browser

*** Test Cases ***
Booking_S001
    [Documentation]    Log-In เข้าใช้งานระบบ สำหรับ ลูกค้า Business    
    [Tags]    Booking    UAT
    # Login
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email    ${b2c_login_user_01['username']}
    b2c_login_page.Input Password    ${b2c_login_user_01['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Verify My Profile Page  
    ...    ${Booking_S001['company_profile']}
    ...    ${Booking_S001['sir_name']}
    ...    ${Booking_S001['company_name']}
    ...    ${Booking_S001['profile']}
    ...    ${Booking_S001['name']}
    ...    ${Booking_S001['phone']}
    ...    ${Booking_S001['email']}
    ...    ${Booking_S001['position']}
    common.Verify Capture Screenshot    Booking_S001    Verify Home Page

Booking_S002_NEW
    [Documentation]    ลูกค้า B - สร้างพัสดุ (ทั่วไป) - ข้อมูลผู้ส่ง (ไม่เพิ่มเป็นรายการโปรด) - ข้อมูลผู้รับพัสดุ (ส่งที่บ้าน > ไม่เพิ่มเป็นรายการโปรด)(บันทึกร่าง) - รายละเอียดพัสดุ เลือก A4 (ไม่มีประกัน ไม่มี COD เเละไม่ใส่หมายเหตุ) - Promotion (ไม่มี)    
    [Tags]    Booking    UAT
    # Login
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email    ${b2c_login_user_01['username']}
    b2c_login_page.Input Password    ${b2c_login_user_01['password']}
    b2c_login_page.Click Log On Button
    #Step No.1 กดเมนู "จองการจัดส่งพัสดุ"
    b2c_home_page.Click Book Parcel Delivery
    #Expected
    b2c_booking_delivery_page.Verify Booking Page    ${Booking['text_title_booking']}
    common.Verify Capture Screenshot    Booking_S002    Verify Booking Page
    #Step No.2 กดปุุ่่ม "+ เพิ่ม"
    b2c_booking_delivery_page.Click Button To Add
    #Expected
    b2c_booking_delivery_page.Verify Term & Condition    ${txt_term_and_condition}    ${Booking['text_term_and_condition']}
    common.Verify Capture Screenshot    Booking_S002    Verify Term & Condition
    #Step No.3 กดปุุ่่ม "ยอมรับเงื่อนไขการใช้บริการ"
    b2c_booking_delivery_page.Click Accept Terms of Service
    #Expected   
    b2c_booking_delivery_page.Verify Select Parcel Type
    common.Verify Capture Screenshot    Booking_S002    Verify Select Parcel Type
    #Step No.4 กดปุุ่่ม "พัสดุทั่วไป"
    b2c_booking_delivery_page.Select Parcel Type    ${Booking_S002['parcel_type']}
    #Expected
    b2c_booking_delivery_page.Verify Create Parcel Page Sender Step
    ...    ${Booking['text_title']}
    ...    ${Booking['text_parcel_sender_information']}
    ...    ${Booking['text_phone_sender']}
    ...    ${Booking['text_name_sender']}
    ...    ${Booking['text_address_sender']}
    ...    ${Booking['text_postcode_sender']}
    common.Verify Capture Screenshot    Booking_S002    Verify Create Parcel Page Sender Step
    #Step No.5 ขั้นตอนข้อมูลผู้ส่งพัสดุ
    b2c_booking_delivery_page.Input Phone Sender    ${Booking_S002['sender_phone']}
    b2c_booking_delivery_page.Input Name Sender    ${Booking_S002['sender_name']}    
    b2c_booking_delivery_page.Input Address Sender    ${Booking_S002['sender_address']}
    b2c_booking_delivery_page.Input Postcode Sender    ${Booking_S002['sender_postcode_5_digits']}
    b2c_booking_delivery_page.Click Postcode Sender Lists    ${Booking_S002['sender_postcode_full']}
    #Expected
    common.Verify Capture Screenshot    Booking_S002    Verify After Create Parcel Page Sender Step
    #Step No.6 กดปุ่ม "ถัดไป"
    b2c_booking_delivery_page.Click Button  ${btn_next_to_receiver}
    #Expected
    b2c_booking_delivery_page.Verify Create Parcel Page Receiver Step   
    ...    ${Booking['text_title']}
    ...    ${Booking['text_parcel_receiver_information']}
    ...    ${Booking['text_phone_receiver']}
    ...    ${Booking['text_name_receiver']}
    ...    ${Booking['text_location_receiver']}
    ...    ${Booking['text_address_receiver']}
    ...    ${Booking['text_postcode_receiver']}
    common.Verify Capture Screenshot    Booking_S002    Verify Create Parcel Page Receiver Step
    #Step No.7 ขั้นตอนข้อมูลผู้รับพัสดุ
    b2c_booking_delivery_page.Input Phone Receiver    ${Booking_S002['receiver_phone']}
    b2c_booking_delivery_page.Input Name Receiver    ${Booking_S002['receiver_name']}
    b2c_booking_delivery_page.Click Button    ${tab_send_to_home}
    b2c_booking_delivery_page.Input Address Receiver    ${Booking_S002['receiver_address']}
    b2c_booking_delivery_page.Input Postcode Receiver    ${Booking_S002['receiver_postcode_5_digits']}
    b2c_booking_delivery_page.Click Postcode Receiver Lists    ${Booking_S002['receiver_postcode_full']}
    #Expected
    common.Verify Capture Screenshot    Booking_S002    Verify After Create Parcel Page Receiver Step
    #Step No.8 กดปุ่ม "บันทึกร่าง"
    b2c_booking_delivery_page.Click Button  ${btn_save_draft}
    #Expected
    b2c_booking_detail_page.Verify Booking list Page
    ...    ${Booking['text_booking_list']}
    ...    ${Booking['text_draft_status']}
    ...    ${Booking_S002['img_sender_heart']}
    ...    ${Booking_S002['sender_name']}
    ...    ${Booking_S002['sender_phone']}
    ...    ${Booking_S002['img_receiver_heart']}
    ...    ${Booking_S002['receiver_name']}
    ...    ${Booking_S002['receiver_phone']}
    ...    ${Booking_S002['receiver_address']}
    ...    ${Booking_S002['receiver_postcode_full']}
    common.Verify Capture Screenshot    Booking_S002    Verify Draft Paecel
    #Step No.9 กดที่รายการพัสดุที่มีสถานะ "ร่าง"
    b2c_booking_detail_page.Click Button    ${b2c_crd_list_of_parcels}
    #Expected
    b2c_booking_delivery_page.Verify Create Parcel Page Sender Step
    ...    ${Booking['text_title']}
    ...    ${Booking['text_parcel_sender_information']}
    ...    ${Booking['text_phone_sender']}
    ...    ${Booking['text_name_sender']}
    ...    ${Booking['text_address_sender']}
    ...    ${Booking['text_postcode_sender']}
    b2c_booking_delivery_page.Verify Draft Paecel Sender
    ...    ${Booking_S002['sender_phone']}
    ...    ${Booking_S002['sender_name']}
    ...    ${Booking_S002['sender_address']}
    ...    ${Booking_S002['sender_postcode_full']}
    common.Verify Capture Screenshot    Booking_S002    Verify Draft Paecel Sender
    #Step No.10 กดปุ่ม "ถัดไป"
    b2c_booking_delivery_page.Click Button    ${btn_next}  
    #Expected
    b2c_booking_delivery_page.Verify Phone Receiver Value    ${Booking_S002['receiver_phone']}
    b2c_booking_delivery_page.Verify Name Receiver Value    ${Booking_S002['receiver_name']}
    b2c_booking_delivery_page.Verify Address Receiver Value    ${Booking_S002['receiver_address']}
    b2c_booking_delivery_page.Verify Full Post Code Value    ${Booking_S002['receiver_postcode_full']}
    common.Verify Capture Screenshot    Booking_S002    Verify Draft Paecel Receiver
   

aaaaaaaaaaaaaaaaaaa
    # กดปุ่ม "ถัดไป"
    Wait Until Element Is Visible    xpath=//div[@class='ant-space-item' and text()='ถัดไป']/../../../button    timeout=10s
    Click Element   xpath=//div[@class='ant-space-item' and text()='ถัดไป']/../../../button
    #Expected
    ${detail_A4}=    Get Text    xpath=//strong[text()= 'A4']/../../../div[@class='ant-card-body']
    Should Be Equal    ${detail_A4}    A4${\n}ซอง A4${\n}ขนาดวัดตามสายวัด${\n}กว้าง + ยาว + สูง ไม่เกิน 51 ชม.
    ${detail_A3}=    Get Text    xpath=//strong[text()= 'A3']/../../../div[@class='ant-card-body']
    Should Be Equal    ${detail_A3}    A3${\n}ซอง A3${\n}ขนาดวัดตามสายวัด${\n}กว้าง + ยาว + สูง ไม่เกิน 72 ชม.
    ${detail_XS}=    Get Text    xpath=//strong[contains(text(), 'XS')]/../../../div[@class='ant-card-body']
    Should Be Equal    ${detail_XS}    XS${\n}กล่อง XS (เล็กพิเศษ)${\n}ขนาดวัดตามสายวัด${\n}กว้าง + ยาว + สูง ไม่เกิน 40 ชม.
    ${detail_S}=    Get Text    xpath=//strong[text()= 'S']/../../../div[@class='ant-card-body']
    Should Be Equal    ${detail_S}    S${\n}กล่อง S (เล็ก)${\n}ขนาดวัดตามสายวัด${\n}กว้าง + ยาว + สูง ไม่เกิน 60 ชม.
    ${detail_M}=    Get Text    xpath=//strong[text()= 'M']/../../../div[@class='ant-card-body']
    Should Be Equal    ${detail_M}    M${\n}กล่อง M (กลาง)${\n}ขนาดวัดตามสายวัด${\n}กว้าง + ยาว + สูง ไม่เกิน 90 ชม.
    ${detail_L}=    Get Text    xpath=//strong[text()= 'L']/../../../div[@class='ant-card-body']
    Should Be Equal    ${detail_L}    L${\n}กล่อง L (ใหญ่)${\n}ขนาดวัดตามสายวัด${\n}กว้าง + ยาว + สูง ไม่เกิน 120 ชม.
    ${detail_XL}=    Get Text    xpath=//strong[text()= 'XL']/../../../div[@class='ant-card-body']
    Should Be Equal    ${detail_XL}    XL${\n}กล่อง XL (ใหญ่มาก)${\n}ขนาดวัดตามสายวัด${\n}กว้าง + ยาว + สูง ไม่เกิน 150 ชม.
    ${detail_XXL}=    Get Text    xpath=//strong[text()= 'XXL']/../../../div[@class='ant-card-body']
    Should Be Equal    ${detail_XXL}    XXL${\n}กล่อง XXL (ใหญ่พิเศษ)${\n}ขนาดวัดตามสายวัด${\n}กว้าง + ยาว + สูง ไม่เกิน 200 ชม.
    ${insure_amount}=    Get Text    xpath=//label[@title='จำนวนเงินซื้อประกัน']
    Should Be Equal    ${insure_amount}    จำนวนเงินซื้อประกัน
    ${cod}=    Get Text    xpath=//label[@title='เก็บเงินปลายทาง']
    Should Be Equal    ${cod}    เก็บเงินปลายทาง
    ${remark}=    Get Text    xpath=//label[@title='หมายเหตุ']
    Should Be Equal    ${remark}    หมายเหตุ
    common.Verify Capture Screenshot    Booking_S002    Verify Paecel Detail

    # "ขั้นตอนรายละเอียดพัสดุ
    # กรอกข้อมูล
    # เลือกขนาดพัสดุ : ซอง A4"
    Wait Until Element Is Visible    xpath=//strong[text()= 'A4']/../../../div[@class='ant-card-body']/../../../../../div[1]    timeout=10s
    Click Element   xpath=//strong[text()= 'A4']/../../../div[@class='ant-card-body']/../../../../../div[1]

    # กดปุ่ม "ถัดไป"
    Wait Until Element Is Visible    xpath=//div[@class='ant-space-item' and text()='ถัดไป']/../../../button    timeout=10s
    Click Element   xpath=//div[@class='ant-space-item' and text()='ถัดไป']/../../../button
    #Expected
    ${selected_coupon_and_code}=    Get Text    xpath=//*[@id="create_parcel_form_promotion"]/div[2]/div/div[1]/div/div/span
    Should Be Equal    ${selected_coupon_and_code}    คูปองและโค้ดส่วนลดที่เลือก
    ${my_coupon_and_code}=    Get Text    xpath=//*[@id="create_parcel_form_promotion"]/div[2]/div/div[2]/div/div/span
    Should Be Equal    ${my_coupon_and_code}    คูปองและโค้ดส่วนลดของฉัน
    common.Verify Capture Screenshot    Booking_S002    Verify Promotion


    # "ขั้นตอน Promotion
    # - ไม่เลือก Promotion
    
    # กดปุ่ม ""จองเลขพัสดุ"""
    Wait Until Element Is Visible    xpath=//span[contains(text(),'จองเลขพัสดุ')]    timeout=10s
    Click Element   xpath=//span[contains(text(),'จองเลขพัสดุ')]

    # กดเมนู "จองการจัดส่งพัสดุ"
    b2c_home_page.Click Book Parcel Delivery
    b2c_booking_delivery_page.Verify Booking Page    ${Booking_S002['text_title_booking']}

    # กดรายการบุ๊คกิ้งที่มีสถานะ "เลือกต้นทางจัดส่ง"
    Wait Until Element Is Visible    xpath=//span[normalize-space()='${booking_id}']    timeout=10s
    Click Element   xpath=//span[normalize-space()='${booking_id}']
    Wait Until Element Is Visible    xpath=(//strong[contains(text(),'ผู้ส่ง :')])[1]    timeout=10s
    Click Element   xpath=(//strong[contains(text(),'ผู้ส่ง :')])[1]

    # กดปุ่ม "เเก้ไขรายการบุ๊คกิ้ง"
    Wait Until Element Is Visible    xpath=//span[contains(text(),'แก้ไข')]    timeout=10s
    Click Element   xpath=//span[contains(text(),'แก้ไข')]

    Wait Until Element Is Visible    xpath=(//div[contains(text(),'ถัดไป')])[1]    timeout=10s
    Click Element   xpath=(//div[contains(text(),'ถัดไป')])[1]

    # "กรอกข้อมูลเพื้นที่ต้นทางการจัดส่ง
    # 1. Tap เลือกร้าน 7-11 ต้นทาง
    # 2. ค้นหาร้าน 15888
    # 3. กดปุ่ม ""เลือกร้าน""
    # 4. กดปุ่ม ""บันทึก"""
    Wait Until Element Is Visible    xpath=(//div[contains(@data-node-key,'store')])[1]
    Click Element   xpath=(//div[contains(@data-node-key,'store')])[1]
    common.Input When Ready    xpath=//*[@id="create_parcel_form_receiver_placeType-panel-store"]/div[2]/div[1]/div/div[2]/div/div/span/input    15888
    Wait Until Element Is Visible    xpath=//div[@class='ant-select-item-option-content'][contains(text(),'15888 สาขา CP TOWER สีลม สีลม บางรัก กรุงเทพมหานคร 10500')]
    Click Element   xpath=//div[@class='ant-select-item-option-content'][contains(text(),'15888 สาขา CP TOWER สีลม สีลม บางรัก กรุงเทพมหานคร 10500')]
    Wait Until Element Is Visible    xpath=//*[@id="create_parcel_form_receiver_placeType-panel-store"]/div[2]/div[1]/div/div[1]/div[3]/div[1]/div[2]/div/div[4]/div/div/div/div[1]/div[2]/div/div/div[2]/div[2]/div/div[2]/button
    Click Element    xpath=//*[@id="create_parcel_form_receiver_placeType-panel-store"]/div[2]/div[1]/div/div[1]/div[3]/div[1]/div[2]/div/div[4]/div/div/div/div[1]/div[2]/div/div/div[2]/div[2]/div/div[2]/button
    Wait Until Element Is Visible    xpath=//span[contains(text(),'บันทึกแก้ไข')]
    Click Element   xpath=//span[contains(text(),'บันทึกแก้ไข')]

    # กดปุ่ม "พิมพ์ใบจ่ายหน้าพัสดุ"
    Wait Until Element Is Visible    xpath=//*[@id="__next"]/div/div[3]/main/div[1]/div/div[2]/div/div[1]/div/div[4]/div/div[2]/div/div/div/div/div/div/div/div/div/div[2]/div[2]/div/div/div[1]/button    timeout=10s
    Click Element   xpath=//*[@id="__next"]/div/div[3]/main/div[1]/div/div[2]/div/div[1]/div/div[4]/div/div[2]/div/div/div/div/div/div/div/div/div/div[2]/div[2]/div/div/div[1]/button

    # กดปุ่ม "พิมพ์ใบจ่ายหน้าพัสดุ" ใน PopUp "พิมพ์ใบจ่ายหน้าพัสดุ"
    Wait Until Element Is Visible    xpath=/html/body/div[17]/div/div[2]/div/div[1]/div/div[3]/div/button    timeout=10s
    Click Element   xpath=/html/body/div[17]/div/div[2]/div/div[1]/div/div[3]/div/button

    # กดปุ่ม "พิมพ์" ของ Web browser