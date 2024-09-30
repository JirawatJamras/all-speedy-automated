*** Settings ***
Resource          ../../resourses/import.robot
Resource          ../../resourses/init_website.robot
Suite Setup       Run Keywords    Open Chrome Browser    chrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result with date
Suite Teardown    Close Browser

*** Test Cases ***

B2C_AddPickupTime_008_01
    [Documentation]    [เพิ่มรายการรอบรถเข้ารับพัสดุ] กรณี กดปุ่ม "+ เพิ่ม"
    [Tags]    B2C_AddPickupTime_008    UAT    Low
    common.Open URL                           ${B2C_UAT_URL}
    b2c_landing_page.Click Go Login Button
    b2c_login_page.Input Email                    ${b2c_login_user_005['username']}
    b2c_login_page.Input Password                 ${b2c_login_user_005['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Click Parcel Delivery Service Menu
    b2c_home_page.Select Sub Menu Call Car Pick Up