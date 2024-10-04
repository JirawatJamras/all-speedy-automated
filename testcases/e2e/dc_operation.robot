*** Settings ***
Resource          ../../resourses/import.robot
Resource          ../../resourses/init_website.robot
Test Setup        Run Keywords    Open Chrome Browser    chrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result with date
Test Teardown     Close Browser

*** Test Cases ***
#### Inprogress step สุดท้าย ####
DC Operation 002
    common.Open URL   ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email                    ${b2c_login_user_01['username']}
    b2c_login_page.Input Password                 ${b2c_login_user_01['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Click Parcel Delivery Service Menu
    b2c_home_page.Select Sub Menu Call Car Pick Up
    b2c_call_car_pick_up_parcel_page.Click Add Button

    ## step 5 ระบุข้อมูล
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
    # Click Element    //button//span[text()='บันทึก']
    Click Element    //button//span[text()='ยกเลิก']
    Click Element    //button[text()=' ยืนยัน']
    
    ## step 6 - 9
    Wait Until Element Is Not Visible    //div[@class='ant-modal-body']//img[@alt='my gif']    timeout=30s
    b2c_home_page.Click Book Parcel Delivery
    # Wait Until Element Is Not Visible    //div[@class='ant-modal-body']//img[@alt='my gif']    timeout=30s
    Sleep    10s
    Wait Until Element Is Visible    //button//span[text()='เพิ่ม']    timeout=30s
    Click Element    //button//span[text()='เพิ่ม']
    Wait Until Element Is Visible    //span[contains(text(),'ข้อกำหนดและเงื่อนไขการใช้บริการขนส่งพัสดุ')]
    Click Element    //button//span[text()='ยอมรับเงื่อนไขการใช้บริการ']
    Wait Until Element Is Visible    //img[@alt='Dry']    timeout=30s

    ${date_YYYY_MM_DD}   Get Current Date
    Click Element    //img[@alt='Dry']
    ${date_time_stamp}   Convert Date  ${date_YYYY_MM_DD}       result_format=%d-%m %H
    ${d_time_stamp}    Split String And Select    ${date_time_stamp}    ${SPACE}    0
    ${time_stamp}    Split String And Select    ${date_time_stamp}    ${SPACE}    1
    log to console    ${time_stamp}

    ## step 10
    Wait Until Element Is Visible    //div[text()='สร้างพัสดุ']/../../..//button//span[@aria-label='close']    timeout=30s
    Click Element    //div[text()='สร้างพัสดุ']/../../..//button//span[@aria-label='close']
    Click Element    //button[contains(text(),'ยืนยัน')]

    # step 11
    Wait Until Element Is Visible    //div[@class='ant-card-body']//span[contains(text(),'${d_time_stamp}') and contains(text(),'${time_stamp}')]    timeout=30s
    Click Element    //div[@class='ant-card-body']//span[contains(text(),'${d_time_stamp}') and contains(text(),'${time_stamp}')]
  

    Wait Until Element Is Visible    //strong[text()='สรุปรายการบุ๊คกิ้ง']    timeout=30s
    Wait Until Element Is Not Visible    //img[@alt='my gif']    timeout=30s
    Wait Until Element Is Enabled    //strong[text()='รายการบุ๊คกิ้ง']/../../../..//button    timeout=30s
    Click Element    //strong[text()='รายการบุ๊คกิ้ง']/../../../..//button
    Wait Until Element Is Visible    //div[@class='ant-modal-content']    timeout=30s
    
    ## step 12
    Click Element    //div[@role='tab']//div[text()='รอบรถเข้ารับพัสดุ']
    Wait Until Element Is Visible    //div[@aria-hidden='false']//div[@class='ant-spin-container']//ul//li     timeout=30s

    ## step 13
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

    ## step 13
    Wait Until Element Is Not Visible    //img[@alt='my gif']    timeout=30s
    Wait Until Element Is Visible     //button//span[text()='Import File']    timeout=30s  
    Click Element    //button//span[text()='Import File']

    ## step 14-15
    Wait Until Element Is Visible    //button//label[@for='InputFile' and text()='Import']    timeout=30s
    # Click Element    //input[@id='InputFile']/..

    ## step 16-17
    ##TBC
    ## step 18-19
    common.Open URL    ${DPS_UAT_URL}
    dps_landing_page.Click Go Login Button
    dps_login_page.Input Email                testloginspeedyldap03@cpall.store
    dps_login_page.Input Password             id711711711711
    dps_login_page.Click Log On Button

    Wait Until Element Is Not Visible    //img[@alt='my gif']    timeout=30s
    Wait Until Element Is Visible    //span[@class='anticon anticon-user']
    Click Element    //a[@class='ant-dropdown-trigger']//span[@aria-label='down-circle']
    Wait Until Element Is Visible    //div[contains(@class,'ant-dropdown')]//li[@role='menuitem']//button[text()='แอดมินคลัง']
    Click Element    //div[contains(@class,'ant-dropdown')]//li[@role='menuitem']//button[text()='แอดมินคลัง']

    ## step 20
    Mouse Over    //a[@href='/check-receiving-cycle']
    Wait Until Location Does Not Contain    //a[@href='/check-receiving-cycle']//span[contains(@class,'hidden')]
    Click Element    //a[@href='/check-receiving-cycle']
    Mouse Out    //a[@href='/check-receiving-cycle']

    ## step 21
    Wait Until Element Is Visible    //div[@role='tab' and text()='รายการรอคลังยืนยัน']    timeout=30s
    Click Element    //div[@role='tab' and text()='รายการรอคลังยืนยัน']
    Wait Until Element Is Visible    //div[@aria-hidden='false']//tr[contains(@class,'ant-table-row ant-table-row-level-0')]

    ## step 22
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
    # ##step 23
    # Wait Until Element Is Visible    //span[text()='รายละเอียดรอบเข้ารับพัสดุ']    timeout=30s
    # Scroll Element Into View    //span[text()='รายละเอียดรอบเข้ารับพัสดุ']/../../..//button//span[text()='Export File']
    # Click Element    //span[text()='รายละเอียดรอบเข้ารับพัสดุ']/../../..//button//span[text()='Export File']

    # Click Element    //span[text()='รายละเอียดรอบเข้ารับพัสดุ']/../../..//button//span[text()='อนุมัติ']
    # Reload Page
    # Sleep    10s

    common.Open URL   ${B2C_UAT_URL}
    Wait Until Element Is Visible    //div[text()='ลูกค้าธุรกิจ'][@id='rc-tabs-2-tab-business']/..    timeout=30s
    Click Element    //div[text()='ลูกค้าธุรกิจ'][@id='rc-tabs-2-tab-business']/..
    b2c_login_page.Input Email                    ${b2c_login_user_01['username']}
    b2c_login_page.Input Password                 ${b2c_login_user_01['password']}
    b2c_login_page.Click Log On Button
    Wait Until Element Is Not Visible    //img[@alt='my gif']    timeout=30s
    b2c_home_page.Click Book Parcel Delivery
    Sleep    10s
    

