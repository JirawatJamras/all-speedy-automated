*** Settings ***
Resource          ../../resourses/init_website.robot
Resource          ../../resourses/import.robot
Test Setup        Run Keywords    Open Chrome Browser    chrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result with date
Test Teardown     Close Browser

*** Test Cases ***
Register_S015
    [Documentation]    RM : อนุมัติคำขอ Full-Register (Inbound) ที่มีการส่งกลับแก้ไข (ลูกค้านิติบุคคล)
    [Tags]    Register    UAT    BEW
    Register_S015


*** Keywords ***
Register_S015
    common.Open URL    ${PMS_UAT_URL}
    pms_landing_page.Click Go Login Button
    pms_login_page.Input Email    ${pms_login_user_01['username']}
    pms_login_page.Input Password    ${pms_login_user_01['password']}
    pms_login_page.Click Log On Button
    pms_home_page.Select Role Admin
    pms_home_page.Select Manage Customer Menu
    pms_home_page.Select Manage Request Sub-Menu
    pms_requests_page.Click Tab Full-Register
    pms_requests_page.Select Pending Tab
    pms_requests_page.Select Request With Waiting For Confirm Status [legal entity]
    ...    ${Register_S001['checkbox_partner_types']}
    ...    ${Register_S001['company_name']}
    ...    ${Register_S001['first_name']}
    ...    ${Register_S001['last_name']}
    ...    ${Register_S001['mobile_no']}
    ...    ${Register_S001['mobile_ext']}
    ...    ${Register_S007['rm_name']}
    pms_detail_full_register_page.Verify Full Register Detail Page With Waiting For Confirm Status [legal entity]
    ...    ${Register_S001['first_name']}
    ...    ${Register_S001['last_name']}
    ...    ${Register_S015['request_type']}
    common.Verify Capture Screenshot    Register_S015    Verify Request Full Register Detail Page
    pms_detail_full_register_page.Click Next Page Button
    pms_detail_full_register_page.Click Dry Parcel Tab
    common.Verify Capture Screenshot    Register_S015    Verify Dry Parcel Tab Full Register Detail Page
    pms_detail_full_register_page.Click Chill Parcel Tab
    common.Verify Capture Screenshot    Register_S015    Verify Chill Parcel Tab Full Register Detail Page
    pms_detail_full_register_page.Click Return Business Tab
    common.Verify Capture Screenshot    Register_S015    Verify Return Business Tab Full Register Detail Page