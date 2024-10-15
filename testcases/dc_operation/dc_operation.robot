*** Settings ***
Resource          ../../resourses/import.robot
Resource          ../../resourses/init_website.robot
Test Setup        Run Keywords    Open Chrome Browser    chrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result with date
Test Teardown     Close Browser

*** Test Cases ***
DC_Operation_002  
    [Tags]    DC_Operation    UAT
    Log    Step No.1 เข้า URL All Speedy
    common.Open URL   ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    common.Verify Capture Screenshot    DC_Operation_002    Verify Login Page

    Log    Step No.2 เข้าสู่ระบบลูกค้าธุรกิจ
    b2c_login_page.Input Email                    ${b2c_login_user_01['username']}
    b2c_login_page.Input Password                 ${b2c_login_user_01['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Verify My Profile Page
    ...    ${Booking['text_company_profile']}
    ...    ${Booking['text_profile']}
    ...    ${Booking['text_profile_name']}
    ...    ${Booking['text_profile_phone']}
    ...    ${Booking['text_profile_mail']}
    ...    ${Booking['text_profile_position']}
    ...    ${Booking_S001['sir_name']}
    ...    ${Booking_S001['company_name']}
    ...    ${Booking_S001['name']}
    ...    ${Booking_S001['phone']}
    ...    ${Booking_S001['email']}
    ...    ${Booking_S001['position']}
    common.Verify Capture Screenshot    DC_Operation_002   Verify Home Page

    Log    Step No.3 เลือกเมนูู "เรียกรถเข้ารับพัสดุ"
    b2c_home_page.Click Parcel Delivery Service Menu
    b2c_home_page.Select Sub Menu Call Car Pick Up
    b2c_call_car_pick_up_parcel_page.Verify Call Car Pick Up Page    ${call_car_pick_up['text_call_car_pick_up']}
    common.Verify Capture Screenshot    DC_Operation_002   Verify Call Car Pick Up Page

    Log    Step No.4 คลิกปุ่ม +เพิ่ม
    b2c_call_car_pick_up_parcel_page.Click Add Button
    b2c_call_car_pick_up_parcel_page.Verify Popup Parcel Pickup Schedule
    common.Verify Capture Screenshot    DC_Operation_002   Verify Parcel Pickup Schedule Popup

    Log    Step No.5 ระบุข้อมูล
    ##เลือกประเภทพัสดุ
    b2c_call_car_pick_up_parcel_page.Select Parcel Type    ${call_car_pick_up.parcel_type['dry']}
    b2c_call_car_pick_up_parcel_page.Select Parcel Pickup Date
    b2c_call_car_pick_up_parcel_page.Select Parcel Pickup Time    ${call_car_pick_up.parcel_pickup_time['morning']}
    b2c_call_car_pick_up_parcel_page.Click Save Button    ${call_car_pick_up['button_save']}
    b2c_call_car_pick_up_parcel_page.Verify Add Special Pickup Round Success   ##TBC##
    ...    ${call_car_pick_up.car_round_name['special']}
    ...    ${dc_operaion_002['text_parcel_pickup_time']}
    common.Verify Capture Screenshot    DC_Operation_002   Verify Add Special Pickup Round Success
    
    Log    Step No.6 เลือกเมนู "จองการจัดส่งพัสดุ"
    Wait Until Element Is Not Visible    //div[@class='ant-modal-body']//img[@alt='my gif']    timeout=30s
    b2c_home_page.Click Book Parcel Delivery
    
    Log    Step No.7 คลิกปุ่ม "+ เพิ่ม"
    Sleep    10s
    Wait Until Element Is Visible    //button//span[text()='เพิ่ม']    timeout=50s
    Click Element    //button//span[text()='เพิ่ม']

    Log    Step No.8 กดปุ่ม "ยอมรับเงื่อนไขการใช้บริการ"
    Wait Until Element Is Visible    //span[contains(text(),'ข้อกำหนดและเงื่อนไขการใช้บริการขนส่งพัสดุ')]
    Click Element    //button//span[text()='ยอมรับเงื่อนไขการใช้บริการ']
    Wait Until Element Is Visible    //img[@alt='Dry']    timeout=30s

    Log    Step No.9 กดปุ่ม "พัสดุทั่วไป"
    Click Element    //img[@alt='Dry']
    ${date_YYYY_MM_DD}   Get Current Date
    ${date_time_stamp}   Convert Date  ${date_YYYY_MM_DD}       result_format=%d-%m %H
    ${d_time_stamp}    Split String And Select    ${date_time_stamp}    ${SPACE}    0
    ${time_stamp}    Split String And Select    ${date_time_stamp}    ${SPACE}    1
    log to console    ${time_stamp}

    Log    Step No.10 คลิกปุ่ม x เพื่อปิด popup
    Wait Until Element Is Visible    //div[text()='สร้างพัสดุ']/../../..//button//span[@aria-label='close']    timeout=30s
    Click Element    //div[text()='สร้างพัสดุ']/../../..//button//span[@aria-label='close']
    Click Element    //button[contains(text(),'ยืนยัน')]

    Log    Step No.11 คลิกไอคอนรูปดินสอ ด้านข้างข้อความรายการบุ๊คกิ้ง
    Wait Until Element Is Visible    //div[@class='ant-card-body']//span[contains(text(),'${d_time_stamp}') and contains(text(),'${time_stamp}')]    timeout=30s
    Click Element    //div[@class='ant-card-body']//span[contains(text(),'${d_time_stamp}') and contains(text(),'${time_stamp}')]
  
    Wait Until Element Is Visible    //strong[text()='สรุปรายการบุ๊คกิ้ง']    timeout=30s
    Wait Until Element Is Not Visible    //img[@alt='my gif']    timeout=30s
    Wait Until Element Is Enabled    //strong[text()='รายการบุ๊คกิ้ง']/../../../..//button    timeout=30s
    Click Element    //strong[text()='รายการบุ๊คกิ้ง']/../../../..//button
    Wait Until Element Is Visible    //div[@class='ant-modal-content']    timeout=30s
    
    Log    Step No.12 คลิกแท็บ "รอบรถเข้ารับพัสดุ"
    Click Element    //div[@role='tab']//div[text()='รอบรถเข้ารับพัสดุ']
    Wait Until Element Is Visible    //div[@aria-hidden='false']//div[@class='ant-spin-container']//ul//li     timeout=30s

    Log    Step No.13 เลือกรายการรอบรถที่สร้างไว้ใน Step 5 และกดปุ่มบันทึก
    ##เลือก card 
    ${count}=    Get Element Count    //div[@aria-hidden='false']//div[@class='ant-spin-container']//ul//li
    FOR    ${index}    IN RANGE    1    ${count} + 1
        ${item}=    Set Variable    (//div[@aria-hidden='false']//div[@class='ant-spin-container']//ul//li)[${index}]
        ${day}=    Run Keyword And Return Status    Element Should Contain    ${item}//p[contains(text(),'วันที่รถเข้ารับพัสดุ')]    ${day}/${m}
        ${parcel}=    Run Keyword And Return Status    Element Should Contain    ${item}//p[contains(text(),'จำนวนพัสดุ')]    0
        ${cutoff}=    Run Keyword And Return Status    Element Should Contain    ${item}//p[contains(text(),'Cut Off')]    22:30:00
        Set Suite Variable    ${index}
        ${all_conditions}=    Evaluate    ${day} and ${parcel} and ${cutoff}
        Exit For Loop If    ${all_conditions}
    END
    Click Element    (//div[@aria-hidden='false']//div[@class='ant-spin-container']//ul//li//input[@class='ant-radio-input']/..)[${index}]
    Sleep    5s
    Click Element    //button//span[text()='บันทึก']

    Log    Step No.14 คลิกปุ่ม Import File
    Wait Until Element Is Not Visible    //img[@alt='my gif']    timeout=30s
    Wait Until Element Is Visible     //button//span[text()='Import File']    timeout=30s  
    Click Element    //button//span[text()='Import File']

    Log    Step No.15 คลิกปุ่ม Import 
    Wait Until Element Is Visible    //button//label[@for='InputFile' and text()='Import']    timeout=30s
    # Click Element    //input[@id='InputFile']/..

    ## step 16-17
    ##TBC
    
    ### รอหลัง cut off time ###
    Log    Step No.18 เปิด URL DPS
    Open Chrome Browser    chrome
    common.Open URL    ${DPS_UAT_URL}
    Log    Step No.19 เข้าสู่ระบบ
    dps_landing_page.Click Go Login Button
    dps_login_page.Input Email    ${dps_login_user_04['username']}
    dps_login_page.Input Password    ${dps_login_user_04['password']}
    dps_login_page.Click Log On Button
    # expected
    # dps_home_page.dps_login_page.Verify Homepage Title    ${dc_operaion['homepage']}
    # common.Verify Capture Screenshot    DC_Operation_002    Verify Homepage Title

    Log    Step No.20 เลือก role แอดมินคลัง
    dps_home_page.Click Dropdown For Select role
    dps_home_page.Select Role    ${dc_operaion.role['admin']}
    dps_home_page.Verify Role Change In Profile    ${dc_operaion.role['admin']}
    common.Verify Capture Screenshot    DC_Operation_002    Verify Role Change In Profile

    Log    Step No.21 เลือกเมนู "ตรวจสอบรอบเข้ารับพัสดุ"
    dps_home_page.Select DPS Menu    ${dc_operaion.dps_menu['Check_Receiving_Cycle']}
    # expected
    dps_check_receiving_cycle.Verify Check Receiving Cycle Page    
    ...    ${dc_operaion.title['Check_Receiving_Cycle']}
    ...    ${dc_operaion.Check_Receiving_Cycle_Tab['all_parcels_received']}
    ...    ${dc_operaion_002.receiving_cycle['company_name']}
    ...    ${dc_operaion_002.receiving_cycle['branch']}
    ...    ${dc_operaion_002.receiving_cycle['company_address']}
    ...    ${dc_operaion_002.receiving_cycle['sub_district']}
    ...    ${dc_operaion_002.receiving_cycle['district']}
    ...    ${dc_operaion_002.receiving_cycle['province']}
    ...    ${dc_operaion_002.receiving_cycle['postcode']}
    ...    ${dc_operaion_002.receiving_cycle['receiving_time']}
    ...    ${dc_operaion_002.receiving_cycle['receiving_type']}
    ...    ${dc_operaion_002.receiving_cycle['courier']}
    ...    ${dc_operaion_002.receiving_cycle['number_of_parcel']}
    ...    ${dc_operaion_002.receiving_cycle['status']}
    common.Verify Capture Screenshot    DC_Operation_002    Verify Check Receiving Cycle Page

    Log    Step No.22 คลิกแท็บ "รายการรอคลังยืนยัน"
    dps_check_receiving_cycle.Select Check Receiving Cycle Tab    ${dc_operaion.Check_Receiving_Cycle_Tab['inventory_confirm_list']}
    # expected
    dps_check_receiving_cycle.Verify Inventory Confirm List Tab
    ...    ${dc_operaion.title['Check_Receiving_Cycle']}
    ...    ${dc_operaion.Check_Receiving_Cycle_Tab['inventory_confirm_list']}
    ...    ${dc_operaion_002.receiving_cycle['company_name']}
    ...    ${dc_operaion_002.receiving_cycle['company_address']}
    ...    ${dc_operaion_002.receiving_cycle['sub_district']}
    ...    ${dc_operaion_002.receiving_cycle['district']}
    ...    ${dc_operaion_002.receiving_cycle['province']}
    ...    ${dc_operaion_002.receiving_cycle['postcode']}
    ...    ${dc_operaion_002.receiving_cycle['receiving_time']}
    ...    ${dc_operaion_002.receiving_cycle['receiving_type']}
    ...    ${dc_operaion_002.receiving_cycle['courier']}
    ...    ${dc_operaion_002.receiving_cycle['number_of_parcel']}
    ...    ${dc_operaion_002.receiving_cycle['status']}
    common.Verify Capture Screenshot    DC_Operation_002    Verify Inventory Confirm List Tab

    Log    Step No.23 คลิกปุ่ม Export
    dps_check_receiving_cycle.Click Pencil Icon
    # Expected
    dps_check_receiving_cycle.Verify Parcel Pickup Details Popup
    ...    ${dc_operaion['parcel_pickup_details']}
    ...    ${dc_operaion['button_export']}
    ...    ${dc_operaion['vehicle_type']}
    ## เหลือ Verify รายละเอียด ##
    common.Verify Capture Screenshot    DC_Operation_002    Verify Parcel Pickup Details Popup
    Log    Step No.24 คลิกปุ่ม Export
    dps_check_receiving_cycle.Click Button On Parcel Pickup Details Popup    ${dc_operaion['button_export']}
    # expected

    Log    Step No.25 คลิกปุ่ม อนุมัติ
    dps_check_receiving_cycle.Click Button On Parcel Pickup Details Popup    ${dc_operaion['button_approve']}
    # expected

    Log    Step No.26 กลับ Speed D "เรียกรถเข้ารับพัสดุ"
    Switch Window	MAIN
    b2c_home_page.Click Parcel Delivery Service Menu
    b2c_home_page.Select Sub Menu Call Car Pick Up
    Sleep    10s

    # Log    Step No.27 เลือกเมนู "จองการจัดส่งพัสดุ"
    b2c_home_page.Click Book Parcel Delivery