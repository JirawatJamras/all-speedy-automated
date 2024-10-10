*** Settings ***
Resource          ../../resourses/import.robot
Resource          ../../resourses/init_website.robot
Test Setup       Run Keywords    Open Chrome Browser    chrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result with date
Test Teardown    Close Browser

*** Test Cases ***

AllSpeedy_Register_001_ID_1
    [Documentation]          [ลงทะเบียนด้วย All Member (เชื่อมต่อหรือสมัครสมาชิก All Member) สำหรับลูกค้าทั่วไป] กรอก URL ไม่ถูกต้อง
    [Tags]    AllSpeedy_Register_001    UAT    Medium    Regression
    ${iserror}    Run Keyword And Return Status    common.Open URL    ${AllSpeedy_Register_001_ID_1['wrong_url']}
    register_general_customers_page.Verify This Site Can Not Be Reached Page    ${iserror}
    common.Verify Capture Screenshot    AllSpeedy_Register_001_ID_1    Verify Incorrect Web Page

AllSpeedy_Register_001_ID_2
    [Documentation]          [ลงทะเบียนด้วย All Member (เชื่อมต่อหรือสมัครสมาชิก All Member) สำหรับลูกค้าทั่วไป] ขั้นตอนการเข้าใช้งานระบบ All Speed-D เพื่อไปยังหน้าการลงทะเบียนสำหรับลูกค้าทั่วไป
    [Tags]    AllSpeedy_Register_001    UAT    Medium    Regression
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select General Customers Tab
    register_general_customers_page.Verify General Customers Tab Page    AllSpeedy_Register_001_ID_2
    ### TBC หน้าเว็บมีการเปลี่ยนแปลง ไม่ตรงกับ testcase