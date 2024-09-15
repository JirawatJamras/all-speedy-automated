*** Settings ***
Resource          ../../resourses/import.robot
Suite Setup       Run Keywords    Open Chrome Browser    headlesschrome    #chrome    #headlesschrome
                  ...    AND   Set Folder Result with date
Suite Teardown    Close Browser



*** Test Cases ***
AllSpeedy_Register_007_ID_1
    [Documentation]    [ขั้นตอนการเข้าใช้งานระบบ All Speed-D เพื่อลงทะเบียน สำหรับลูกค้าธุรกิจ] กรอก URL ถูกต้อง
    [Tags]    FunctionAllSpeedy_Register_007    UAT
    common.Open URL    ${B2C_UAT_URL}
    register_landing_page.Click Go business Tab
    Verify All Page login
    register.Click Register On Button
    Verify All Page Register
    common.Verify Capture Screenshot    AllSpeedy_Register_007_ID_1    Enter the correct URL
