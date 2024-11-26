*** Settings ***
Resource          ../../resourses/init_website.robot
Resource          ../../resourses/import.robot

Test Setup        Run Keywords    Open Chrome Browser    headlesschrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result with date
Test Teardown     Close Browser

*** Test Cases ***
Register_S023
    [Documentation]    Customer : การ Login เข้าใช้งานระบบสำหรับลูกค้าธุรกิจ
    [Tags]    Register    Customer_Login    UAT
    skip
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email      ${Register['email']}
    b2c_login_page.Input Password      ${Register['password_allspeedy']}
    b2c_login_page.Click Log On Button