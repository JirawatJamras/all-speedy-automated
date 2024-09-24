*** Settings ***
Resource          ../../resourses/import.robot
Suite Setup       Run Keywords    Open Chrome Browser    chrome    #headlesschrome
                  ...    AND   Set Folder Result with date
Suite Teardown    Close Browser


*** Test Cases ***

AllSpeedy_Register_001_ID_1
    [Documentation]          [ลงทะเบียนด้วย All Member (เชื่อมต่อหรือสมัครสมาชิก All Member) สำหรับลูกค้าทั่วไป] กรอก URL ไม่ถูกต้อง
    [Tags]    AllSpeedy_Register_001    UAT    Medium    Regression
    ${iserror}    Run Keyword And Return Status    common.Open URL    ${AllSpeedy_Register_001_ID_1['wrong_url']}
    register_landing_page.Verify This Site Can Not Be Reached Page    ${iserror}
    common.Verify Capture Screenshot    AllSpeedy_Register_001_ID_1    Verify Incorrect Web Page

