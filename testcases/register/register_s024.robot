*** Settings ***
Resource          ../../resourses/init_website.robot
Resource          ../../resourses/import.robot

Test Setup        Run Keywords    Open Chrome Browser    headlesschrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result with date
Test Teardown     Close Browser

*** Test Cases ***
Register_S024
    [Documentation]    Customer : จัดการผู้ใช้งาน Super User
    [Tags]    Register    Customer_Login    UAT
    skip
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email    idc@gmail.com
    b2c_login_page.Input Password    P@ssw0rd
    b2c_login_page.Click Log On Button
    [Documentation]    Customer : จัดการผู้ใช้งาน Super User
    #Step 1
    register_business_profile_business.Click Profile Icon
    register_business_profile_business.Click Profile Business
    register_business_profile_business.Click Menu Manage Users
    register_business_profile_business.Click Menu Super User
    register_business_profile_business.Click Add User
    #Step 2
    register_business_profile_business.Input User Name    Automate
    register_business_profile_business.Input User Last Name    Superuser
    register_business_profile_business.Input User Email    allspeedy.superuser@yopmail.com
    register_business_profile_business.Input User Mobile No    0931234567
    #register_business_profile_business.Input User Mobile Ext    0
    register_business_profile_business.Input User Position    พนักงานแพคสินค้า
