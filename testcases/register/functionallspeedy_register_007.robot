*** Settings ***
Resource          ../../resourses/import.robot
Suite Setup       Run Keywords    Open Browser And Go To Allspeedy B2C Website
                  ...    AND   Set Folder Result with date
Suite Teardown    Close Browser


*** Test Cases ***
FunctionAllSpeedy_Register_007
    [Documentation]                           [ขั้นตอนการเข้าใช้งานระบบ All Speed-D เพื่อลงทะเบียน สำหรับลูกค้าธุรกิจ] กรอก URL ถูกต้อง
    [Tags]                                    FunctionAllSpeedy_Register_007
    common.Open URL                           ${B2C_UAT_URL}
    register_landing_page.Click Go business Tab
    register.Click Register On Button
    Verify All Page Register
    common.Verify Capture Screenshot    FunctionAllSpeedy_Register_007    Enter the correct URL

