*** Settings ***
Resource          ../../resourses/init_website.robot
Resource          ../../resourses/import.robot

Test Setup        Run Keywords    Open Chrome Browser    headlesschrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result with date
Test Teardown     Close Browser

*** Test Cases ***
Register_S047
    [Documentation]    Customer : ตรวจสอบข้อมูลบริษัท
    [Tags]    Register    Customer_Login    UAT
    skip
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email    idc@gmail.com
    b2c_login_page.Input Password    P@ssw0rd
    b2c_login_page.Click Log On Button

    #Step 1 Company Admin : กดปุ่ม "โปรไฟล์บริษัท"
    register_business_profile_business.Click Profile Icon
    register_business_profile_business.Click Profile Business
    #Step 2 กดแท็บ "แท็บข้อมูลบริการ" และ แท็บ "พัสดุทั่วไป"
    register_business_profile_business.Click Menu Service Information
    register_business_profile_business.Click Menu General Parcel
    #Step 3 กดแท็บ "พัสดุควบคุมอุณหภูมิ"
    register_business_profile_business.Click Menu Temperature Controlled Parcels
    #Step 4 กดแท็บ "Return Business"
    register_business_profile_business.Click Menu Return Business
    #Step 5 กดแท็บ "ข้อมูลผู้ติดต่อและข้อมูลธนาคาร"
    register_business_profile_business.Click Menu Contact and Bank Information
    #Step 6 กดแท็บ "เอกสารประกอบ"
    register_business_profile_business.Click Menu Supporting Documents
    #Step 7 กดแท็บ "จัดการผู้ใช้งาน"
    register_business_profile_business.Click Menu Manage Users 
    #Step 8 กดแท็บ "Super User"
    register_business_profile_business.Click Menu Super User 
    #Step 9 กดแท็บ "User"
    register_business_profile_business.Click Menu User 
    #Step 10 กดแท็บ "จัดการสาขา"
    register_business_profile_business.Click Menu Manage Branches  
    #Step 11 กดแท็บ "ติดตามรายการคำขอ"
    register_business_profile_business.Click Menu Tracking Request List 
    #Step 12 กดแท็บ "ใบแจ้งหนี้"
    register_business_profile_business.Click Menu Invoice