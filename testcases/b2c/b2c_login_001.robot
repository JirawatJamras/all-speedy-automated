*** Settings ***
Resource          ../../resourses/import.robot
Test Setup       Run Keywords    Open Chrome Browser    chrome    #chrome    #headlesschrome
                  ...    AND   Set Folder Result with date
Test Teardown    Close Browser

*** Test Cases ***
B2C_Login_001_01
    [Documentation]     [Login เข้าสู่ระบบ] กรอก E-mail ไม่ถูกต้อง กรณีกรอก E-mail ไม่เป็นภาษาอังกฤษ ตัวเลข อักขระพิเศษ ในรูปแบบอีเมล์
    ...                 , กรณีกรอก E-mail เป็นภาษาอังกฤษ ตัวเลข อักขระพิเศษ ไม่ใช่ในรูปแบบอีเมล์
    [Tags]    B2C_Login_001    UAT    Low    UAT    Regression
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email                    ${b2c_login_user_02['username']}
    b2c_login_page.Input Password                 ${b2c_login_user_02['password']}
    ### ติด defect error message ไม่ถูกต้อง