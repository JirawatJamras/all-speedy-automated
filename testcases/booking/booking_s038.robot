*** Settings ***
Resource          ../../resources/init_website.robot
Resource          ../../resources/import.robot

Test Setup        Run Keywords    Open Chrome Browser    headlesschrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result with date
Test Teardown     Close Browser

*** Test Cases ***
Booking_S038
    [Documentation]    ลูกค้า B - สร้างพัสดุ (ทั่วไป) - ข้อมูลผู้ส่งต้องการใช้ที่อยู่ผู้ส่งพัสดุเดียวกันทั้งบุ๊คกิ้ง
    [Tags]    Booking    Business_To_Customer    Regression
    skip
    # Log    Pre condition
    # Open Chrome Browser   chrome      #headlesschrome   
    # Set Folder Result with date
    # c2c_login.Input Email And Password    ${c2c_login_user_01['username']}    ${c2c_login_user_01['password']}
    # b2c_login_page.Click Log On Button
    # Go To    https://www-uat.allspeedy.co.th/booking/detail/B2410004883
    # b2c_booking_detail_page.Wait Until Loading Icon Success
    # Log    Step No. 3 กดปุ่ม "Import File"
    # b2c_booking_detail_page.Click Import File Button
    # # Expected
    # b2c_booking_detail_page.Verify Import File Popup
    # ...    ${Booking['text_import']}
    # ...    ${Booking['text_btn_template']}
    # ...    ${Booking['text_import_time']}
    # ...    ${Booking['text_file_name']}
    # ...    ${Booking['text_import_result']}
    # ...    ${Booking['text_file_import_error']}
    # common.Verify Capture Screenshot    booking    Booking_S038    Verify Import File Popup

    # Log    Step No. 4 กดปุ่ม "Import" เเละเลือกไฟล์ชื่อ "Excel Template พัสดุทั่วไป" ที่ได้กรอกข้อมูลไว้เเล้ว
    # b2c_booking_detail_page.Import Excel File Of Dry Parcel Template    ${path_excel_dry_parcel}
    # b2c_booking_detail_page.Wait Until Loading Icon Success
    # #Expected
    # b2c_booking_detail_page.Verify Import Excel File Inspection Results    # Have commented code, stuck at Defect108. Waiting for resolve.
    # ...    ${Booking.import_file['dry_parcel_file_name']}
    # ...    ${Booking.import_file['dry_parcel_import_success_amount']}
    # ...    ${Booking.import_file['dry_parcel_import_fail_amount']}
    # common.Verify Capture Screenshot    booking    Booking_S038    Verify Import Excel File Inspection Results
    # Log    Step No. 5 กด Download ไฟล์ Error เเละตรวจสอบไฟล์

    # #b2c_booking_detail_page.Click Download Import Error File
    # Wait Until Element Is Enabled    xpath=(//tbody/tr[@class="ant-table-row ant-table-row-level-0 text-center"]/td[@class="ant-table-cell"]/a[contains(text(),'Error Report')])[1]  
    # Wait Until Element Is Enabled    xpath=//span[@aria-label='close']
    # FOR    ${i}    IN RANGE    5
    #     ${verify}=  Run Keyword And Return Status   Click Element   xpath=//span[@aria-label='close']
    #     Exit For Loop IF   '${verify}'=='True'
    #     Sleep   2s
    # END    
    # Wait Until Element Is Enabled    xpath=//span[normalize-space()='Import File']
    # Click Element   xpath=//span[normalize-space()='Import File']
    # Sleep   5s
    # Wait Until Page Contains Element    xpath=(//tbody/tr[@class="ant-table-row ant-table-row-level-0 text-center"]/td[@class="ant-table-cell"]/a[contains(text(),'Error Report')])[1]  
    # Wait Until Element Is Enabled    xpath=(//tbody/tr[@class="ant-table-row ant-table-row-level-0 text-center"]/td[@class="ant-table-cell"]/a[contains(text(),'Error Report')])[1]  
    # Sleep   5s
    # ${error_report_xlsx}=    Get Text    xpath=(//tbody/tr[@class="ant-table-row ant-table-row-level-0 text-center"]/td[@class="ant-table-cell"]/a[contains(text(),'Error Report')])[1]
    # Wait Until Element Is Visible   xpath=//a[normalize-space()='${error_report_xlsx}']
    # Click Element    xpath=//a[normalize-space()='${error_report_xlsx}']
    # Sleep   5s
    # ${error_report_xlsx}=    Replace String    ${error_report_xlsx}    :    _
    # Log    ${error_report_xlsx}
    # ${profile}=    Evaluate    os.path.join(os.environ['USERPROFILE'], *['Downloads'])    modules=os
    # ${files}=    List Files In Directory    ${profile}
    # ${profile}=    Set Variable    ${profile}\\${error_report_xlsx}.xlsx  
    # Sleep    10s
    
    # Open Excel Document    	filename=${path_excel_error_report}    doc_id=doc1   keep_vba=True
    # FOR    ${row}    IN RANGE    3    9999
    #     Log   ${row}
    #     ${no}=   Read Excel Cell     row_num=${row}    col_num=1
    #     ${annotation}=   Read Excel Cell     row_num=${row}    col_num=18
    #     ${error_message}=   Read Excel Cell     row_num=${row}    col_num=16
    #     Should Be Equal    ${annotation}    ${error_message}
    #     Log   ${no}. หมายเหตุ: ${annotation} = Error Messages: ${error_message}
    #     IF    '${annotation}' == 'None'
    #         Log to Console    "Reached empty cell at row ${row}. Stopping the loop."
    #         Exit For Loop
    #     END
    # END