*** Settings ***
Resource          ../../resourses/init_website.robot
Resource          ../../resourses/import.robot

Test Setup        Run Keywords    Open Chrome Browser    headlesschrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result with date
Test Teardown     Close Browser

*** Test Cases ***
Register_S026
    [Documentation]    Customer : จัดการสาขา
    [Tags]    Register    Customer_Login    UAT
    skip
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email    idc@gmail.com
    b2c_login_page.Input Password    P@ssw0rd
    b2c_login_page.Click Log On Button
    register_business_profile_business.Click Profile Icon
    register_business_profile_business.Click Profile Business
    register_business_profile_business.Click Menu Manage Branches
    register_business_profile_business.Click Checkbox User    พิชิต สุริยัน
