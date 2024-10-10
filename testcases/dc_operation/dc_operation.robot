*** Settings ***
Resource          ../../resourses/import.robot
Resource          ../../resourses/init_website.robot
Test Setup        Run Keywords    Open Chrome Browser    chrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result with date
Test Teardown     Close Browser

*** Test Cases ***
#### ระบบเปลี่ยนเวลา cutoff ของรอบรถ 17.00 => 22.30 ####
#### comment code ในส่วนของการยืนยันรอบรถใน dps ####
DC_Operation_002  
    [Tags]    DC_Operation    UAT
    Log    Step No.1 เข้า URL All Speedy
    common.Open URL   ${B2C_UAT_URL}

    Log    Step No.2 เข้าสู่ระบบลูกค้าธุรกิจ
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email                    ${b2c_login_user_01['username']}
    b2c_login_page.Input Password                 ${b2c_login_user_01['password']}
    b2c_login_page.Click Log On Button

    Log    Step No.3 เลือกเมนูู "เรียกรถเข้ารับพัสดุ"
    b2c_home_page.Click Parcel Delivery Service Menu
    b2c_home_page.Select Sub Menu Call Car Pick Up

    Log    Step No.4 คลิกปุ่ม +เพิ่ม
    b2c_call_car_pick_up_parcel_page.Click Add Button

    Log    Step No.5 ระบุข้อมูล
    ##เลือกประเภทพัสดุ
    Click Element    //strong[text()='ประเภทพัสดุ']/../../../..//span[@class='ant-select-selection-item']
    Click Element    //div[@class='ant-select-item-option-content' and text()='พัสดุทั่วไป (Dry)']
    ##เลือกวันที่เข้ารับพัสดุ
    ${date_YYYY_MM_DD}   Get Current Date
    ${date_YYYY_MM_DD}   Convert Date  ${date_YYYY_MM_DD}       result_format=%d-%m-%Y %H
    ${d}    Split String And Select    ${date_YYYY_MM_DD}    -    0
    ${m}    Split String And Select    ${date_YYYY_MM_DD}    -    1
    ${y}    Split String And Select    ${date_YYYY_MM_DD}    -    2
    ${day}    Convert To Integer    ${d}
    ${day}    Evaluate    ${day} + 2
    ${nextDay}    Set Variable    ${day}-${m}
    Click Element    //strong[text()='วันที่รถเข้ารับพัสดุ']/../../../..//div[@class='ant-picker-input']
    Click Element    //div[@class='ant-picker-body']//td[contains(@title,'${nextDay}')]
    ##เลือกเวลาเข้ารับพัสดุ
    Click Element    //strong[text()='เวลารถเข้ารับพัสดุ']/../../../..//span[@class='ant-select-selection-item']
    Click Element    //div[@class='ant-select-item-option-content' and text()='ช่วงเช้า 09:00 - 12:00']
    Click Element    //button//span[text()='บันทึก']
    # Click Element    //button//span[text()='ยกเลิก']
    # Click Element    //button[text()=' ยืนยัน']
    
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
    dps_home_page.Verify Check Receiving Cycle Page    
    ...    ${dc_operaion.title['Check_Receiving_Cycle']}
    ...    ${dc_operaion.Check_Receiving_Cycle_Tab['all_parcels_received']}
        # TBC รอdata#
    common.Verify Capture Screenshot    DC_Operation_002    Verify Check Receiving Cycle Page

    Log    Step No.22 คลิกแท็บ "รายการรอคลังยืนยัน"
    Wait Until Element Is Visible    //div[@role='tab' and text()='รายการรอคลังยืนยัน']    timeout=30s
    Click Element    //div[@role='tab' and text()='รายการรอคลังยืนยัน']
    Wait Until Element Is Visible    //div[@aria-hidden='false']//tr[contains(@class,'ant-table-row ant-table-row-level-0')]

    # Log    Step No.23 คลิกไอคอนรูปดินสอ
    ## เลือกรายการ

    # ${receiving_count}=    Get Element Count    //div[@aria-hidden='false']//tr[contains(@class,'ant-table-row ant-table-row-level-0')]
    # FOR    ${index}    IN RANGE    1    ${receiving_count} + 1
    #     ${item}=    Set Variable    (//div[@aria-hidden='false']//tr[contains(@class,'ant-table-row ant-table-row-level-0')])[${index}]
    #     Scroll Element Into View    ${item}
    #     ${name}=    Run Keyword And Return Status    Element Should Contain    ${item}//td[text()]    บริษัท ไอดีซี พรีเมียร์ จำกัด
    #     Log To console    ${name}
    #     ${day}=    Run Keyword And Return Status    Element Should Contain    ${item}//td[8]    05-10-2567
    #     Log To console    ${day}
    #     ${time}=    Run Keyword And Return Status    Element Should Contain    ${item}//td[9]    09:00
    #     Log To console    ${time}
    #     Set Suite Variable    ${card}    (//div[@aria-hidden='false']//tr[contains(@class,'ant-table-row ant-table-row-level-0')])[${index}]//button
    #     ${all_conditions}=    Evaluate    ${name} and ${day} and ${time}
    #     Exit For Loop If    ${all_conditions}
    # END

    # Click Element    ${card}
    # Log    Step No.24 คลิกปุ่ม Export
    # Wait Until Element Is Visible    //span[text()='รายละเอียดรอบเข้ารับพัสดุ']    timeout=30s
    # Scroll Element Into View    //span[text()='รายละเอียดรอบเข้ารับพัสดุ']/../../..//button//span[text()='Export File']
    # Click Element    //span[text()='รายละเอียดรอบเข้ารับพัสดุ']/../../..//button//span[text()='Export File']

    # Log    Step No.25 คลิกปุ่ม อนุมัติ
    # Click Element    //span[text()='รายละเอียดรอบเข้ารับพัสดุ']/../../..//button//span[text()='อนุมัติ']
    # Reload Page
    # Sleep    10s

    # Log    Step No.26 กลับ Speed D เมนูเรียกรับ
    Switch Window	MAIN
    b2c_home_page.Click Parcel Delivery Service Menu
    b2c_home_page.Select Sub Menu Call Car Pick Up
    Sleep    10s

    # Log    Step No.27 เลือกเมนู "จองการจัดส่งพัสดุ"
     b2c_home_page.Click Book Parcel Delivery
