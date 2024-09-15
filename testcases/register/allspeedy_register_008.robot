*** Settings ***
Resource          ../../resourses/import.robot
Suite Setup       Run Keywords    Open Chrome Browser    headlesschrome    #chrome    #headlesschrome
                  ...    AND   Set Folder Result with date
Suite Teardown    Close Browser


*** Test Cases ***

AllSpeedy_Register_008_ID_18
    [Documentation]    [ลงทะเบียน (Pre Register) ในส่วนของข้อมูลบริษัท (ข้อมูลทั่วไป) สำหรับลูกค้าธุรกิจ ] ขั้นตอนการระบุข้อมูลบริษัท (ข้อมูลทั่วไป) ประเภทคู่ค้า นิติบุคคล: กรอกข้อมูลถูกต้องครบถ้วน                        
    [Tags]    AllSpeedy_Register_008    UAT    test
    common.Open URL    ${B2C_UAT_URL}
    Click Go business Tab
    Click Register On Button
    Click Checkbox_Partner_Types_Legal 
    Verify Checkbox_Partner_Types_Legal 
    Select Company registration prefix    