*** Keywords ***
Click Book Parcel Delivery
    Wait Until Element Is Visible    //a[@href='/profile-business/profiles' and contains(text(), 'หน้าแรก')]    timeout=30s
    Click Element        ${b2c_menu_book_parcel_delivery}

Verify My Profile PageBusiness
    [Arguments]    ${name}
    Wait Until Element Is Visible    ${b2c_personal_information_txtbox}
    ${expected_emailtxtbox} =    Get value    ${b2c_personal_information_txtbox}
    Should Be Equal    ${name}    ${expected_emailtxtbox}

Click Button To Add
    Wait Until Element Is Visible    ${b2c_btn_add}    timeout=30s
    Click Element        ${b2c_btn_add}

Click Tracking Parcel Delivery Menu Button
    Click When Ready    ${b2c_mnu_tracking_parcel_delivery}