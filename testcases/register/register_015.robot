*** Settings ***
Resource          ../../resourses/init_website.robot
Resource          ../../resourses/import.robot
Test Setup        Run Keywords    Open Chrome Browser    chrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result with date
Test Teardown     Close Browser

*** Test Cases ***
Register_S015
    [Documentation]    RM : อนุมัติคำขอ Full-Register (Inbound) ที่มีการส่งกลับแก้ไข (ลูกค้านิติบุคคล)
    [Tags]    Register    UAT    BEW
    # Register_S015
    Register_S15



*** Keywords ***
Register_S15
    common.Open URL    ${PMS_UAT_URL}
    pms_landing_page.Click Go Login Button
    pms_login_page.Input Email    ${pms_login_user_01['username']}
    pms_login_page.Input Password    ${pms_login_user_01['password']}
    pms_login_page.Click Log On Button
    pms_home_page.Select Role Admin
    common.Open URL    https://pms-uat.allspeedy.co.th/usermanager/requests/fullregister?id=9378293440714588815
    pms_detail_full_register_page.Click Next Page Button
    pms_detail_full_register_page.Click Next Page Button
    
    Log    Step No.11 กดปุ่ม "หน้าถัดไป"
    pms_detail_full_register_page.Click Next Page Button
    #Expected 4
    pms_detail_full_register_page.Verify Supporting Document Page Legal Entity
    common.Verify Capture Screenshot    Register_S015    Verify Supporting Document Page Legal Entity
    
    Log    Step No.12 ระบุความเห็นการแก้ไข #4 : แก้ไขเอกสารหน้าบัญชีธนาคาร
    pms_detail_full_register_page.Input Remark 4    ${Register_S015['remark_4']}

    Log    Step No.13 กดปุ่ม "หน้าถัดไป"
    pms_detail_full_register_page.Click Next Page Button
    #Expected
    #Inprogress
    # pms_detail_full_register_page.Verify Officer Section Page
    common.Verify Capture Screenshot    Register_S015    Verify Officer Section Page
    

    Log    Step No.14 ระบุข้อมูลรายละเอียดเพิ่มเติม
    

    Log    Step No.15 กดปุ่ม "ส่งกลับแก้ไข"
    pms_detail_full_register_page.Click Return Button
    pms_detail_full_register_page.Verify Return Popup    remark_4=${Register_S015['remark_4']}
    common.Verify Capture Screenshot    Register_S015    Verify Return Popup


    Log    Step No.16 กดปุ่ม "ยืนยัน" ที่ Popup ส่งกลับแก้ไข
    #pms_detail_full_register_page.Click Confirm Button
    #Expected


Register_S015
    common.Open URL    ${PMS_UAT_URL}
    pms_landing_page.Click Go Login Button
    pms_login_page.Input Email    ${pms_login_user_01['username']}
    pms_login_page.Input Password    ${pms_login_user_01['password']}
    pms_login_page.Click Log On Button
    pms_home_page.Select Role Admin
    pms_home_page.Select Manage Customer Menu
    pms_home_page.Select Manage Request Sub-Menu
    pms_requests_page.Click Tab Full-Register
    pms_requests_page.Select Pending Tab

    Log    Step No.1 กดปุ่ม "ดำเนินการ" สถานะคำขอ "รอตรวจสอบ"
    Go To    https://pms-uat.allspeedy.co.th/usermanager/requests/fullregister?id=240404338080107385
    # pms_requests_page.Select Request With Waiting For Confirm Status [legal entity]
    # ...    ${Register_S001['checkbox_partner_types']}
    # ...    ${Register_S001['company_name']}
    # ...    ${Register_S001['first_name']}
    # ...    ${Register_S001['last_name']}
    # ...    ${Register_S001['mobile_no']}
    # ...    ${Register_S001['mobile_ext']}
    # ...    ${Register_S007['rm_name']}
    # pms_detail_full_register_page.Verify Full Register Detail Page With Waiting For Confirm Status [legal entity]
    # ...    ${Register_S001['first_name']}
    # ...    ${Register_S001['last_name']}
    # ...    ${Register_S015['request_type']}
    # ...    ${Register_S001['checkbox_partner_types']}
    # ...    ${Register_S001['company_title_name']}
    # ...    ${Register_S001['company_name']}
    # ...    ${Register_S013['mobile_company']}
    # ...    ${Register_S013['mobile_company_ext']}
    # ...    ${Register_S001['company_address']}
    # ...    ${Register_S001['select_company_address_full']}
    # ...    ${Register_S001['title_name']}
    # ...    ${Register_S001['email']}
    # ...    ${Register_S001['mobile_no']}
    # ...    ${Register_S001['mobile_ext']}
    common.Verify Capture Screenshot    Register_S015    Verify Request Full Register Detail Page
    common.Scroll Window To Vertical    500
    common.Verify Capture Screenshot    Register_S015    Verify Request Full Register Detail Page 2

    Log    Step No.2 กดปุ่ม "หน้าถัดไป"
    pms_detail_full_register_page.Click Next Page Button
    pms_detail_full_register_page.Click Dry Parcel Tab
    # pms_detail_full_register_page.Verify Dry Parcel Tab Full Register Detail Page
    # ...    ${Register_S015.dry_parcel['selected_cod']}
    # ...    ${Register_S015.dry_parcel['selected_insure']}
    # ...    ${Register_S013.dry_parcel['type_product']}
    # ...    ${Register_S013.dry_parcel['number_by_day']}
    # ...    ${Register_S013.dry_parcel['sale_channel']}
    # ...    ${Register_S013.dry_parcel['vat']}
    # ...    ${Register_S013.dry_parcel['remark']}
    # ...    ${Register_S015.dry_parcel['branch']}
    # ...    ${Register_S015.dry_parcel['address']}
    # ...    ${Register_S015.dry_parcel['address_full']}
    # ...    ${rm.full_regis['latitude_longitude']}
    # ...    ${rm.full_regis.text_pickup_schedule['not_determined']}
    # common.Verify Capture Screenshot    Register_S015    Verify Dry Parcel Tab Full Register Detail Page
    pms_detail_full_register_page.Click Chill Parcel Tab
    # pms_detail_full_register_page.Verify Chill Parcel Tab Full Register Detail Page
    # ...    ${Register_S015.chill_parcel['selected_cod']}
    # ...    ${Register_S013.chill_parcel['type_product']}
    # ...    ${Register_S013.chill_parcel['number_by_day']}
    # ...    ${Register_S013.chill_parcel['sale_channel']}
    # ...    ${Register_S013.chill_parcel['vat']}
    # ...    ${Register_S013.chill_parcel['remark']}
    # ...    ${Register_S015.chill_parcel['branch']}
    # ...    ${Register_S015.chill_parcel['address']}
    # ...    ${Register_S015.chill_parcel['address_full']}
    # ...    ${rm.full_regis['latitude_longitude']}
    # ...    ${rm.full_regis.text_pickup_schedule['not_determined']}
    common.Verify Capture Screenshot    Register_S015    Verify Chill Parcel Tab Full Register Detail Page
    pms_detail_full_register_page.Click Return Business Tab
    # pms_detail_full_register_page.Verify Return Business Tab Full Register Detail Page
    # ...    ${Register_S015.return_business['selected_express']}
    # ...    ${Register_S015.return_business['selected_insure']}
    # ...    ${Register_S013.return_business['type_product']}
    # ...    ${Register_S013.return_business['number_by_day']}
    # ...    ${Register_S013.return_business['sale_channel']}
    # ...    ${Register_S013.return_business['vat']}
    # ...    ${Register_S013.return_business['remark']}
    # ...    ${Register_S015.return_business['branch']}
    # ...    ${Register_S015.return_business['address']}
    # ...    ${Register_S015.return_business['address_full']}
    # ...    ${rm.full_regis['latitude_longitude']}
    # ...    ${rm.full_regis.text_pickup_schedule['not_determined']}
    common.Verify Capture Screenshot    Register_S015    Verify Return Business Tab Full Register Detail Page

    Log    Step No.3 ระบุข้อมูล แท็บพัสดุทั่วไป
    # pms_detail_full_register_page.Click Dry Parcel Tab
    # pms_detail_full_register_page.Input Information In The Dry Parcel Tab
    # ...    ${Register_S015.dry_parcel['price_scheme']}
    # ...    ${Register_S015.dry_parcel['price_scheme_date']}
    # ...    ${Register_S015.dry_parcel['cod_scheme']}
    # ...    ${Register_S015.dry_parcel['cod_scheme_date']}
    # ...    ${Register_S015.dry_parcel['insure_scheme']}
    # ...    ${Register_S015.dry_parcel['insure_scheme_date']}
    # ...    ${Register_S015.dry_parcel['first_mile_start_date']}
    # ...    ${Register_S015.dry_parcel['first_mile_end_date']}
    # ...    ${Register_S015.dry_parcel['bounce_fee_start_date']}
    # ...    ${Register_S015.dry_parcel['bounce_fee_end_date']}
    # ...    ${Register_S015.dry_parcel['rebate_item']}
    # ...    ${Register_S015.dry_parcel['rebate_percen']}
    # ...    ${Register_S015.dry_parcel['rebate_item_2']}
    # ...    ${Register_S015.dry_parcel['rebate_percen_2']}
    # pms_detail_full_register_page.Verify Set Pickup Point Popup
    # ...    ${Register_S015.dry_parcel['branch']}
    # ...    ${Register_S015.dry_parcel['branch_id']}
    # ...    ${Register_S015.dry_parcel['address']}
    # ...    ${Register_S015.dry_parcel['address_full']}
    # common.Verify Capture Screenshot    Register_S015    Verify Set Pickup Point Popup Dry Parcel Tab

    Log    Step No.4 ระบุจุดเรียกรถเข้ารับ แท็บพัสดุทั่วไป
    # pms_detail_full_register_page.Input Set Pickup Point Popup
    # ...    ${Register_S015.dry_parcel['parcel_type']}
    # ...    ${Register_S015.dry_parcel['pickup_day']}
    # ...    ${Register_S015.dry_parcel['pickup_time']}
    # # pms_detail_full_register_page.Verify Input Set Pickup Point
    # # ...    ${Register_S015.dry_parcel['branch']}
    # # ...    ${Register_S015.dry_parcel['address']}
    # # ...    ${Register_S015.dry_parcel['address_full']}
    # # ...    ${rm.full_regis['latitude_longitude']}
    # # ...    ${rm.full_regis.text_pickup_schedule['determined']}
    # common.Verify Capture Screenshot    Register_S015    Verify Pickup Schedule After Set Pickup Point [Dry Parcel Tab]

    Log    Step No.5 ระบุข้อมูล แท็บพัสดุควบคุมอุณหภูมิ
    # pms_detail_full_register_page.Click Chill Parcel Tab
    # pms_detail_full_register_page.Input Information In The Chill Parcel Tab
    # ...    ${Register_S015.chill_parcel['price_scheme']}
    # ...    ${Register_S015.chill_parcel['price_scheme_date']}
    # ...    ${Register_S015.chill_parcel['cod_scheme']}
    # ...    ${Register_S015.chill_parcel['cod_scheme_date']}
    # ...    ${Register_S015.chill_parcel['first_mile_start_date']}
    # ...    ${Register_S015.chill_parcel['first_mile_end_date']}
    # ...    ${Register_S015.chill_parcel['bounce_fee_start_date']}
    # ...    ${Register_S015.chill_parcel['bounce_fee_end_date']}
    # ...    ${Register_S015.chill_parcel['rebate_item']}
    # ...    ${Register_S015.chill_parcel['rebate_percen']}
    # ...    ${Register_S015.chill_parcel['rebate_item_2']}
    # ...    ${Register_S015.chill_parcel['rebate_percen_2']}
    # pms_detail_full_register_page.Verify Set Pickup Point Popup
    # ...    ${Register_S015.chill_parcel['branch']}
    # ...    ${Register_S015.chill_parcel['branch_id']}
    # ...    ${Register_S015.chill_parcel['address']}
    # ...    ${Register_S015.chill_parcel['address_full']}
    # common.Verify Capture Screenshot    Register_S015    Verify Set Pickup Point Popup Chill Parcel Tab

    Log    Step No.6 ระบุจุดเรียกรถเข้ารับ แท็บพัสดุควบคุมอุณหภูมิ
    # pms_detail_full_register_page.Input Set Pickup Point Popup
    # ...    ${Register_S015.chill_parcel['parcel_type']}
    # ...    ${Register_S015.chill_parcel['pickup_day']}
    # ...    ${Register_S015.chill_parcel['pickup_time']}
    # # pms_detail_full_register_page.Verify Input Set Pickup Point
    # # ...    ${Register_S015.chill_parcel['branch']}
    # # ...    ${Register_S015.chill_parcel['address']}
    # # ...    ${Register_S015.chill_parcel['address_full']}
    # # ...    ${rm.full_regis['latitude_longitude']}
    # # ...    ${rm.full_regis.text_pickup_schedule['determined']}
    # common.Verify Capture Screenshot    Register_S015    Verify Pickup Schedule After Set Pickup Point [Chill Parcel Tab]

    Log    Step No.7 ระบุข้อมูล แท็บ Return Business
    # pms_detail_full_register_page.Click Return Business Tab
    # pms_detail_full_register_page.Input Information In The Return Business Tab
    # ...    ${Register_S015.return_business['price_scheme']}
    # ...    ${Register_S015.return_business['price_scheme_date']}
    # ...    ${Register_S015.return_business['insure_scheme']}
    # ...    ${Register_S015.return_business['insure_scheme_date']}
    # common.Verify Capture Screenshot    Register_S015    Verify Input Information In The Return Business Tab

    Log    Step No.8 กดปุ่ม "หน้าถัดไป"
    pms_detail_full_register_page.Click Next Page Button
    pms_detail_full_register_page.Verify Request Detail Contact And Bank Information
    ...    ${Register_S013.bank['bank_id']}
    ...    ${Register_S013.bank['bank_name']}
    ...    ${Register_S013.bank['bank_branch']}
    ...    ${Register_S013.bank['bank_account_name']}
    ...    ${Register_S013.bank['bank_account_no']}
    ...    ${Register_S013.bank['bank_account_type']}

    Log    Step No.9 กดปุ่ม "เพิ่ม" ข้อมูลผู้ติดต่อ
    

