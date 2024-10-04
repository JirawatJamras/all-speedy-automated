*** Settings ***
Resource             ../../resourses/import.robot
Resource             ../../resourses/init_mobile.robot
Test Setup           Run Keywords    Open Chrome On Android Device
                     ...    AND   Set Folder Result with date
Test Teardown        Application Teardown

*** Test Cases ***

S012
    [Documentation]    สร้างรายการ  C-Booking (พัสดุไซส์ A4) จัดส่งที่บ้าน (พัสดุไซส์ A4)(ไม่มีประกัน)
    [Tags]    UAT

    #### Check continue as exist account question page - Click use without an account ####
    ${isvisible}=    Run Keyword And Return Status    Wait Until Element Is Visible    xpath=//android.widget.Button[@resource-id="com.android.chrome:id/signin_fre_dismiss_button"]    timeout=5s
    Run Keyword IF  '${isvisible}' == 'True'    Click When Ready    xpath=//android.widget.Button[@resource-id="com.android.chrome:id/signin_fre_dismiss_button"]

    ### Check Enhanced ad privacy in Chrome page - Click got it ####
    ${isvisible}=    Run Keyword And Return Status    Wait Until Element Is Visible    xpath=//android.widget.Button[@resource-id="com.android.chrome:id/ack_button"]    timeout=5s
    Run Keyword IF  '${isvisible}' == 'True'    Click When Ready    xpath=//android.widget.Button[@resource-id="com.android.chrome:id/ack_button"]


    #### Open website AllSpeedy and login business customer ####
    Go To Url    https://www-uat.allspeedy.co.th/booking
    Click When Ready    xpath=//android.widget.TabWidget/android.view.View/android.view.View/android.view.View[2]
    Click When Ready    xpath=//android.widget.EditText[@resource-id="emailBusiness"]
    Input When Ready    xpath=//android.widget.EditText[@resource-id="emailBusiness"]    idc@gmail.com
    Click When Ready    xpath=//android.widget.EditText[@resource-id="passwordBusiness"]
    Input When Ready    xpath=//android.widget.EditText[@resource-id="passwordBusiness"]    P@ssw0rd
    Click When Ready    xpath=//android.widget.Button[@text="เข้าสู่ระบบ"]

    #### Step 1 - กด Tab "จองการจัดส่งพัสดุ" ####
    Click When Ready    xpath=//android.widget.Button[@text="menu"]
    Click When Ready    xpath=//android.view.View[@content-desc="จองการจัดส่งพัสดุ"]

    #### Step 2 - กดปุ่ม "+ เพิ่ม" #####
    Click When Ready    xpath=//android.widget.Button[@text="plus-circle"]

    #### Step 3 - กดปุ่ม "ยอมรับเงื่อนไขการใช้บริการ" ####
  
    #### Step 4 - ขั้นตอนข้อมูลผู้ส่งพัสดุ ####

    #### Step 5 - กดปุ่ม "ถัดไป" ####

    #### Step 6 - ขั้นตอนข้อมูลผู้รับพัสดุ ####

    #### Step 7 - กดปุ่ม "ถัดไป" ####

    ####  Step 8 - ขั้นตอนรายละเอียดพัสดุ ####

    #### Step 9 - กดปุ่ม "ถัดไป" ####

    #### Step 10 - กดปุ่ม "จองเลขพัสดุ" ####

    #### Step 11 - เเสดงหน้า "รายการบุ๊คกิ้ง" ตรวจสอบ สรุปรายการบุ๊คกิ้ง ####

    #### Step 12 - กดปุ่ม "พิมพ์ใบจ่ายหน้าพัสดุ" กับพัสดุที่ต้องการ ####


