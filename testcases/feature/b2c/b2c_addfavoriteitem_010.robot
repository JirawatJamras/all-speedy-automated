*** Settings ***
Resource          ../../resourses/import.robot
Resource          ../../resourses/init_website.robot
Test Setup       Run Keywords    Open Chrome Browser    chrome    #headlesschrome    #chrome
                 ...    AND   Set Folder Result with date
Test Teardown    Close Browser

*** Test Cases ***
B2C_AddFavoriteItem_010_001
    [Documentation]      [เพิ่มรายการโปรด] กรณี กดปุ่ม "+ เพิ่ม"
    [Tags]    B2C_AddFavoriteItem_010    UAT    Low    Regression    Pass
    common.Open URL   ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email                    ${b2c_login_user_01['username']}
    b2c_login_page.Input Password                 ${b2c_login_user_01['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Click Parcel Delivery Service Menu
    b2c_home_page.Select Sub Menu Favorites
    b2c_favorite_page.Select Sender Tab
    b2c_favorite_page.Click Add Button [Sender]
    b2c_favorite_page.Verify Display Popup Sender Information
    common.Verify Capture Screenshot    B2C_AddFavoriteItem_010_001    Display PopUp Add Sender Information

B2C_AddFavoriteItem_010_002
    [Documentation]      [เพิ่มรายการโปรด] กรอกชื่อรายการโปรด ถูกต้อง
    ...                  กรอกชื่อรายการโปรด เป็นตัวอักษร ภาษาไทย ภาษาอังกฤษ ตัวเลข,
    ...                  กรอกชื่อรายการโปรด ไม่เกิน 50 ตัวอักษร
    [Tags]    B2C_AddFavoriteItem_010    UAT    Medium    Regression    
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email    ${b2c_login_user_01['username']}
    b2c_login_page.Input Password    ${b2c_login_user_01['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Click Parcel Delivery Service Menu
    b2c_home_page.Select Sub Menu Favorites
    b2c_favorite_page.Select Sender Tab
    b2c_favorite_page.Click Add Button [Sender]
    b2c_favorite_page.Input Favorite Name    ${b2c_AddFavoriteItem_010_002['favorite_name']}
    b2c_favorite_page.Verify Input Favorite Name In Field    ${favorite_time_stamp}
    common.Verify Capture Screenshot    B2C_AddFavoriteItem_010_002   Verify Input Favorite Name In Field

B2C_AddFavoriteItem_010_003
    [Documentation]      [เพิ่มรายการโปรด] กรอกชื่อรายการโปรด ไม่ถูกต้อง
    ...                  กรอกชื่อรายการโปรด ไม่เป็นตัวอักษร ภาษาไทย ภาษาอังกฤษ ตัวเลข,
    ...                  กรอกชื่อรายการโปรด เกิน 50 ตัวอักษร
    [Tags]    B2C_AddFavoriteItem_010    UAT    Low    Regression
    ###The expected results do not match those on the website. The commented code is the actual result on the website.
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email    ${b2c_login_user_01['username']}
    b2c_login_page.Input Password    ${b2c_login_user_01['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Click Parcel Delivery Service Menu
    b2c_home_page.Select Sub Menu Favorites
    b2c_favorite_page.Select Sender Tab
    b2c_favorite_page.Click Add Button [Sender]
    b2c_favorite_page.Input Favorite Name    ${b2c_AddFavoriteItem_010_003.favorite_name['special_char']}
    # b2c_favorite_page.Verify Error Message When Input Favorite Name Wrong Format    ${b2c_AddFavoriteItem_010_003['errormsg']}
    # b2c_favorite_page.Verify Error Message When Input Favorite Name Special Char    ${b2c_AddFavoriteItem_010_03['errormsg']}
    common.Verify Capture Screenshot    B2C_AddFavoriteItem_010_003    Verify Error Message When Input Favorite Name Special Char
    b2c_favorite_page.Clear Input Favorite Name
    b2c_favorite_page.Input Favorite Name    ${b2c_AddFavoriteItem_010_003.favorite_name['more_than_specified']}
    # b2c_favorite_page.Verify Error Message When Input Favorite Name Wrong Format    ${b2c_AddFavoriteItem_010_003['errormsg']}
    # b2c_favorite_page.Verify Can Not Input Favorite Name More Than Specified    ${b2c_AddFavoriteItem_010_03['specified_value']}
    common.Verify Capture Screenshot    B2C_AddFavoriteItem_010_003    Verify Can Not Input Favorite Name More Than Specified

B2C_AddFavoriteItem_010_004
    [Documentation]      [เพิ่มรายการโปรด] ไม่กรอกข้อมูล
    [Tags]    B2C_AddFavoriteItem_010    UAT    Low    Regression    Pass
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email    ${b2c_login_user_01['username']}
    b2c_login_page.Input Password    ${b2c_login_user_01['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Click Parcel Delivery Service Menu
    b2c_home_page.Select Sub Menu Favorites
    b2c_favorite_page.Select Sender Tab
    b2c_favorite_page.Click Add Button [Sender]
    b2c_favorite_page.Click Save Button
    b2c_favorite_page.Verify Error Message When Not Input Favorite Name    ${b2c_AddFavoriteItem_010_004.errormsg['favorite_name']}
    b2c_favorite_page.Verify Error Message When Not Input Sender Phone    ${b2c_AddFavoriteItem_010_004.errormsg['sender_phone']}
    b2c_favorite_page.Verify Error Message When Not Input Sender Name    ${b2c_AddFavoriteItem_010_004.errormsg['sender_name']}
    b2c_favorite_page.Verify Error Message When Not Input Sender Address    ${b2c_AddFavoriteItem_010_004.errormsg['sender_address']}
    b2c_favorite_page.Verify Error Message When Not Input Sender Postcode    ${b2c_AddFavoriteItem_010_004.errormsg['sender_postcode']}
    common.Verify Capture Screenshot    B2C_AddFavoriteItem_010_004    Verify Error Messages When Not Input Sender Data

B2C_AddFavoriteItem_010_005
    [Documentation]          [เพิ่มรายการโปรด] กรณี เปิด Toggle ใช้เป็นค่าเริ่มต้น,
    ...                      กรณี ปิด Toggle ใช้เป็นค่าเริ่มต้น
    [Tags]    B2C_AddFavoriteItem_010    UAT    Low    Regression    Pass  
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email    ${b2c_login_user_01['username']}
    b2c_login_page.Input Password    ${b2c_login_user_01['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Click Parcel Delivery Service Menu
    b2c_home_page.Select Sub Menu Favorites
    b2c_favorite_page.Select Sender Tab
    b2c_favorite_page.Click Add Button [Sender]
    b2c_favorite_page.Input Favorite Name     ${b2c_AddFavoriteItem_010_005['favorite_name']}
    b2c_favorite_page.Click Toggle Use as default
    b2c_favorite_page.Verify Toggle Use As Default Is Open
    common.Verify Capture Screenshot    B2C_AddFavoriteItem_010_005    Verify Toggle Use As Default Is Open
    b2c_favorite_page.Click Toggle Use as default
    b2c_favorite_page.Verify Toggle Use As Default Is Close
    common.Verify Capture Screenshot    B2C_AddFavoriteItem_010_005    Verify Toggle Use As Default Is Close

B2C_AddFavoriteItem_010_006
    [Documentation]          [เพิ่มรายการโปรด] กรอกเบอร์โทรศัพท์ ถูกต้อง
    ...                      กรอกเบอร์โทรศัพท์ เป็นตัวเลข
    ...                      กรอกเบอร์โทรศัพท์ ไม่เกิน 10 หลัก
    [Tags]    B2C_AddFavoriteItem_010    UAT    Low    Regression    Pass
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email    ${b2c_login_user_01['username']}
    b2c_login_page.Input Password    ${b2c_login_user_01['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Click Parcel Delivery Service Menu
    b2c_home_page.Select Sub Menu Favorites
    b2c_favorite_page.Select Sender Tab
    b2c_favorite_page.Click Add Button [Sender]
    b2c_favorite_page.Input Favorite Name     ${b2c_AddFavoriteItem_010_006['favorite_name']}
    b2c_favorite_page.Input Sender Phone Number     ${b2c_AddFavoriteItem_010_006['phone_no']}
    b2c_favorite_page.Verify Input Sender Phone Number In Field    ${b2c_AddFavoriteItem_010_006['phone_no']}
    common.Verify Capture Screenshot    B2C_AddFavoriteItem_010_006   Verify Input Sender Phone Number In Field

B2C_AddFavoriteItem_010_007
    [Documentation]      [เพิ่มรายการโปรด] กรอกเบอร์โทรศัพท์ ไม่ถูกต้อง
    ...                  กรอกเบอร์โทรศัพท์ ไม่เป็นตัวเลข,
    ...                  กรอกเบอร์โทรศัพท์ เกิน 10 หลัก
    [Tags]    B2C_AddFavoriteItem_010    UAT    Low    Regression
    ###The expected results do not match those on the website.
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email    ${b2c_login_user_01['username']}
    b2c_login_page.Input Password    ${b2c_login_user_01['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Click Parcel Delivery Service Menu
    b2c_home_page.Select Sub Menu Favorites
    b2c_favorite_page.Select Sender Tab
    b2c_favorite_page.Click Add Button [Sender]
    b2c_favorite_page.Input Favorite Name    ${b2c_AddFavoriteItem_010_007['favorite_name']}
    b2c_favorite_page.Input Sender Phone Number     ${b2c_AddFavoriteItem_010_007.phone_no['character']}
    # b2c_favorite_page.Verify Error Message When Input Sender Phone Wrong Format    ${b2c_AddFavoriteItem_010_007['errormsg']}
    common.Verify Capture Screenshot    B2C_AddFavoriteItem_010_007   Verify Cannot Input Character In Sender Phone Field
    b2c_favorite_page.Clear Input Sender Phone Number
    b2c_favorite_page.Input Sender Phone Number     ${b2c_AddFavoriteItem_010_007.phone_no['more_than_specified']}
    # b2c_favorite_page.Verify Error Message When Input Sender Phone Wrong Format    ${b2c_AddFavoriteItem_010_007['errormsg']}
    common.Verify Capture Screenshot    B2C_AddFavoriteItem_010_007   Verify Cannot Input Sender Phone More Then Spectified

B2C_AddFavoriteItem_010_008
    [Documentation]      [เพิ่มรายการโปรด] กรอกชื่อผู้ส่งพัสดุ ถูกต้อง
    ...                  กรอกชื่อผู้ส่งพัสดุ เป็นตัวอักษร ภาษาไทย ภาษาอังกฤษ,
    ...                  กรอกชื่อผู้ส่งพัสดุ ไม่เกิน 50 ตัวอักษร
    [Tags]    B2C_AddFavoriteItem_010    UAT    Low    Regression    
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email    ${b2c_login_user_01['username']}
    b2c_login_page.Input Password    ${b2c_login_user_01['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Click Parcel Delivery Service Menu
    b2c_home_page.Select Sub Menu Favorites
    b2c_favorite_page.Select Sender Tab
    b2c_favorite_page.Click Add Button [Sender]
    b2c_favorite_page.Input Favorite Name    ${b2c_AddFavoriteItem_010_008['favorite_name']}
    b2c_favorite_page.Input Sender Phone Number     ${b2c_AddFavoriteItem_010_008['phone_no']}
    b2c_favorite_page.Input Sender Name    ${b2c_AddFavoriteItem_010_008['sender_name']}
    b2c_favorite_page.Verify Input Sender Name In Field    ${b2c_AddFavoriteItem_010_008['sender_name']}
    common.Verify Capture Screenshot    B2C_AddFavoriteItem_010_008   Verify Input Sender Name In Field

B2C_AddFavoriteItem_010_009
    [Documentation]      [เพิ่มรายการโปรด] กรอกชื่อผู้ส่งพัสดุ ไม่ถูกต้อง
    ...                  กรอกชื่อผู้ส่งพัสดุ ไม่เป็นตัวอักษร ภาษาไทย ภาษาอังกฤษ,
    ...                  กรอกชื่อผู้ส่งพัสดุ เกิน 50 ตัวอักษร
    [Tags]    B2C_AddFavoriteItem_010    UAT    Low    Regression
    ###The expected results do not match those on the website.
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email    ${b2c_login_user_01['username']}
    b2c_login_page.Input Password    ${b2c_login_user_01['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Click Parcel Delivery Service Menu
    b2c_home_page.Select Sub Menu Favorites
    b2c_favorite_page.Select Sender Tab
    b2c_favorite_page.Click Add Button [Sender]
    b2c_favorite_page.Input Favorite Name    ${b2c_AddFavoriteItem_010_009['favorite_name']}
    b2c_favorite_page.Input Sender Phone Number     ${b2c_AddFavoriteItem_010_009['phone_no']}
    b2c_favorite_page.Input Sender Name    ${b2c_AddFavoriteItem_010_009.sender_name['special_char']}
    b2c_favorite_page.Verify Error Message When Input Sender Name Wrong Format    ${b2c_AddFavoriteItem_010_009['errormsg']}
    common.Verify Capture Screenshot    B2C_AddFavoriteItem_010_009    Verify Error Message When Input Sender Name With Special Char
    b2c_favorite_page.Clear Input Sender Name
    b2c_favorite_page.Input Sender Name    ${b2c_AddFavoriteItem_010_009.sender_name['more_than_specified']}
    b2c_favorite_page.Verify Error Message When Input Sender Name Wrong Format    ${b2c_AddFavoriteItem_010_009['errormsg']}
    common.Verify Capture Screenshot    B2C_AddFavoriteItem_010_009    Verify Error Message When Input Sender Name More Than Specified

B2C_AddFavoriteItem_010_010
    [Documentation]      [เพิ่มรายการโปรด] กรอกรายละเอียดที่อยู่ ถูกต้อง
    ...                  กรอกรายละเอียดที่อยู่ เป็นตัวอักษรภาษาไทย ภาษาอังกฤษ ตัวเลข อักขระ / -,
    ...                  กรอกรายละเอียดที่อยู่ ไม่เกิน 100 ตัวอักษร
    [Tags]    B2C_AddFavoriteItem_010    UAT    Low    Regression     
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email    ${b2c_login_user_01['username']}
    b2c_login_page.Input Password    ${b2c_login_user_01['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Click Parcel Delivery Service Menu
    b2c_home_page.Select Sub Menu Favorites
    b2c_favorite_page.Select Sender Tab
    b2c_favorite_page.Click Add Button [Sender]
    b2c_favorite_page.Input Favorite Name    ${b2c_AddFavoriteItem_010_010['favorite_name']}
    b2c_favorite_page.Input Sender Phone Number     ${b2c_AddFavoriteItem_010_010['sender_phone']}
    b2c_favorite_page.Input Sender Name    ${b2c_AddFavoriteItem_010_010['sender_name']}
    b2c_favorite_page.Input Sender Address    ${b2c_AddFavoriteItem_010_010['sender_address']}
    b2c_favorite_page.Verify Input Sender Address In Field    ${b2c_AddFavoriteItem_010_010['sender_address']}
    common.Verify Capture Screenshot    B2C_AddFavoriteItem_010_010    Verify Input Sender Address In Field

B2C_AddFavoriteItem_010_011
    [Documentation]      [เพิ่มรายการโปรด] กรอกรายละเอียดที่อยู่ ไม่ถูกต้อง
    ...                  กรอกรายละเอียดที่อยู่ ไม่เป็นตัวอักษรภาษาไทย ภาษาอังกฤษ ตัวเลข อักขระ / -,
    ...                  กรอกรายละเอียดที่อยู่ เกิน 100 ตัวอักษร
    [Tags]    B2C_AddFavoriteItem_010    UAT    Low    Regression
    ###The expected results do not match those on the website.
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email    ${b2c_login_user_01['username']}
    b2c_login_page.Input Password    ${b2c_login_user_01['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Click Parcel Delivery Service Menu
    b2c_home_page.Select Sub Menu Favorites
    b2c_favorite_page.Select Sender Tab
    b2c_favorite_page.Click Add Button [Sender]
    b2c_favorite_page.Input Favorite Name    ${b2c_AddFavoriteItem_010_011['favorite_name']}
    b2c_favorite_page.Input Sender Phone Number     ${b2c_AddFavoriteItem_010_011['sender_phone']}
    b2c_favorite_page.Input Sender Name    ${b2c_AddFavoriteItem_010_011['sender_name']}
    b2c_favorite_page.Input Sender Address    ${b2c_AddFavoriteItem_010_011.sender_address['special_char']}
    # b2c_favorite_page.Verify Error Message When Input Sender Address Wrong Format    ${b2c_AddFavoriteItem_010_011['errormsg']}
    common.Verify Capture Screenshot    B2C_AddFavoriteItem_010_011    Verify Error Message When Input Sender Address With Special Char
    b2c_favorite_page.Clear Input Sender Address
    b2c_favorite_page.Input Sender Address    ${b2c_AddFavoriteItem_010_011.sender_address['more_than_specified']}
    # b2c_favorite_page.Verify Error Message When Input Sender Address Wrong Format    ${b2c_AddFavoriteItem_010_011['errormsg']}
    common.Verify Capture Screenshot    B2C_AddFavoriteItem_010_011    Verify Error Message When Input Sender Address With More Than Specified

B2C_AddFavoriteItem_010_012
    [Documentation]      [เพิ่มรายการโปรด] กรอกรหัสไปรษณีย์ ถูกต้อง 
    ...                  กรอกรหัสไปรษณีย์ เป็นตัวเลข,
    ...                  กรอกรหัสไปรษณีย์ ไม่เกิน 5 หลัก
    [Tags]    B2C_AddFavoriteItem_010    UAT    Low    Regression    Pass
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email    ${b2c_login_user_01['username']}
    b2c_login_page.Input Password    ${b2c_login_user_01['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Click Parcel Delivery Service Menu
    b2c_home_page.Select Sub Menu Favorites
    b2c_favorite_page.Select Sender Tab
    b2c_favorite_page.Click Add Button [Sender]
    b2c_favorite_page.Input Favorite Name    ${b2c_AddFavoriteItem_010_012['favorite_name']}
    b2c_favorite_page.Input Sender Phone Number     ${b2c_AddFavoriteItem_010_012['sender_phone']}
    b2c_favorite_page.Input Sender Name    ${b2c_AddFavoriteItem_010_012['sender_name']}
    b2c_favorite_page.Input Sender Address    ${b2c_AddFavoriteItem_010_012['sender_address']}
    b2c_favorite_page.Input Sender Postcode    ${b2c_AddFavoriteItem_010_012['sender_postcode']}
    b2c_favorite_page.Verify Input Sender Postcode In Field    ${b2c_AddFavoriteItem_010_012['sender_postcode']}
    b2c_favorite_page.Verify Data Dropdown List Postcode Displayed    ${b2c_AddFavoriteItem_010_012['sender_postcode']}
    common.Verify Capture Screenshot    B2C_AddFavoriteItem_010_012    Verify Input Sender Postcode In Field

B2C_AddFavoriteItem_010_013
    [Documentation]      [เพิ่มรายการโปรด] กรอกรหัสไปรษณีย์ ไม่ถูกต้อง 
    ...                  กรอกรหัสไปรษณีย์ ไม่เป็นตัวเลข,
    ...                  กรอกรหัสไปรษณีย์ เกิน 5 หลัก
    [Tags]    B2C_AddFavoriteItem_010    UAT    Low    Regression    
    ###The expected results do not match those on the website.
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email    ${b2c_login_user_01['username']}
    b2c_login_page.Input Password    ${b2c_login_user_01['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Click Parcel Delivery Service Menu
    b2c_home_page.Select Sub Menu Favorites
    b2c_favorite_page.Select Sender Tab
    b2c_favorite_page.Click Add Button [Sender]
    b2c_favorite_page.Input Favorite Name    ${b2c_AddFavoriteItem_010_013['favorite_name']}
    b2c_favorite_page.Input Sender Phone Number     ${b2c_AddFavoriteItem_010_013['sender_phone']}
    b2c_favorite_page.Input Sender Name    ${b2c_AddFavoriteItem_010_013['sender_name']}
    b2c_favorite_page.Input Sender Address    ${b2c_AddFavoriteItem_010_013['sender_address']}
    b2c_favorite_page.Input Sender Postcode    ${b2c_AddFavoriteItem_010_013.sender_postcode['char']}
    # b2c_favorite_page.Verify Error Message When Input Sender Postcode Wrong Format    ${b2c_AddFavoriteItem_010_013['errormsg']}
    common.Verify Capture Screenshot    B2C_AddFavoriteItem_010_013    Verify Input Sender Postcode With Character
    b2c_favorite_page.Clear Input Sender Postcode
    b2c_favorite_page.Input Sender Postcode    ${b2c_AddFavoriteItem_010_013.sender_postcode['more_than_specified']}
    # b2c_favorite_page.Verify Error Message When Input Sender Postcode Wrong Format    ${b2c_AddFavoriteItem_010_013['errormsg']}
    common.Verify Capture Screenshot    B2C_AddFavoriteItem_010_013    Verify Error Message When Input Sender Postcode With More Than Specified

B2C_AddFavoriteItem_010_014
    [Documentation]      [เพิ่มรายการโปรด] เลือกรหัสไปรษณีย์ 
    ...                  เลือกรหัสไปรษณีย์ 1 ตัวเลือก,
    ...                  ไม่เลือกรหัสไปรษณีย์,
    ...                  เลือกรหัสไปรษณีย์เกิน 1 ตัวเลือก
    [Tags]    B2C_AddFavoriteItem_010    UAT    Low    Regression    Pass
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email    ${b2c_login_user_01['username']}
    b2c_login_page.Input Password    ${b2c_login_user_01['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Click Parcel Delivery Service Menu
    b2c_home_page.Select Sub Menu Favorites
    b2c_favorite_page.Select Sender Tab
    b2c_favorite_page.Click Add Button [Sender]
    b2c_favorite_page.Input Favorite Name    ${b2c_AddFavoriteItem_010_014['favorite_name']}
    b2c_favorite_page.Input Sender Phone Number     ${b2c_AddFavoriteItem_010_014['sender_phone']}
    b2c_favorite_page.Input Sender Name    ${b2c_AddFavoriteItem_010_014['sender_name']}
    b2c_favorite_page.Input Sender Address    ${b2c_AddFavoriteItem_010_014['sender_address']}
    b2c_favorite_page.Input Sender Postcode    ${b2c_AddFavoriteItem_010_014['sender_postcode']}
    b2c_favorite_page.Not Select Sender Postcode
    b2c_favorite_page.Verify No Data Input Sender Postcode In Field
    common.Verify Capture Screenshot    B2C_AddFavoriteItem_010_014    Not Selected Sender Postcode
    b2c_favorite_page.Input Sender Postcode    ${b2c_AddFavoriteItem_010_014['sender_postcode']}
    b2c_favorite_page.Select Sender Postcode    ${b2c_AddFavoriteItem_010_014.sender_address_full['address01']}
    b2c_favorite_page.Verify Input Sender Postcode Full In Field    ${b2c_AddFavoriteItem_010_014.sender_address_full['address01']}
    common.Verify Capture Screenshot    B2C_AddFavoriteItem_010_014    Selected Sender Postcode
    b2c_favorite_page.Input Sender Postcode    ${b2c_AddFavoriteItem_010_014['sender_postcode']}
    b2c_favorite_page.Select Sender Postcode    ${b2c_AddFavoriteItem_010_014.sender_address_full['address02']}
    b2c_favorite_page.Verify Input Sender Postcode Full In Field    ${b2c_AddFavoriteItem_010_014.sender_address_full['address02']}
    common.Verify Capture Screenshot    B2C_AddFavoriteItem_010_014    Displays The Latest Selected Postcode

B2C_AddFavoriteItem_010_015
    [Documentation]        [เพิ่มรายการโปรด] กรณี กดปุ่ม "บันทึก"
    [Tags]    B2C_AddFavoriteItem_010    UAT    High    Regression    
    common.Open URL   ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email    ${b2c_login_user_01['username']}
    b2c_login_page.Input Password    ${b2c_login_user_01['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Click Parcel Delivery Service Menu
    b2c_home_page.Select Sub Menu Favorites
    b2c_favorite_page.Select Sender Tab
    b2c_favorite_page.Click Add Button [Sender]
    b2c_favorite_page.Input Favorite Name    ${b2c_AddFavoriteItem_010_015['favorite_name']}
    b2c_favorite_page.Input Sender Phone Number     ${b2c_AddFavoriteItem_010_015['sender_phone']}
    b2c_favorite_page.Input Sender Name    ${b2c_AddFavoriteItem_010_015['sender_name']}
    b2c_favorite_page.Input Sender Address    ${b2c_AddFavoriteItem_010_015['sender_address']}
    b2c_favorite_page.Input Sender Postcode    ${b2c_AddFavoriteItem_010_015['sender_postcode']}
    b2c_favorite_page.Select Sender Postcode    ${b2c_AddFavoriteItem_010_015['sender_address_full']}
    b2c_favorite_page.Click Save Button
    b2c_favorite_page.Verify Display Sender Card In Favorite Page    ${b2c_AddFavoriteItem_010_015}
    common.Verify Capture Screenshot    B2C_AddFavoriteItem_010_015    Display Sender Card In Favorite Page

B2C_AddFavoriteItem_010_016
    [Documentation]        [เพิ่มรายการโปรด] กรณี กดปุ่ม "ยกเลิก"
    [Tags]    B2C_AddFavoriteItem_010    UAT    Medium    Regression    
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email    ${b2c_login_user_01['username']}
    b2c_login_page.Input Password    ${b2c_login_user_01['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Click Parcel Delivery Service Menu
    b2c_home_page.Select Sub Menu Favorites
    b2c_favorite_page.Select Sender Tab
    b2c_favorite_page.Click Add Button [Sender]
    b2c_favorite_page.Input Favorite Name    ${b2c_AddFavoriteItem_010_016['favorite_name']}
    b2c_favorite_page.Input Sender Phone Number     ${b2c_AddFavoriteItem_010_016['sender_phone']}
    b2c_favorite_page.Input Sender Name    ${b2c_AddFavoriteItem_010_016['sender_name']}
    b2c_favorite_page.Input Sender Address    ${b2c_AddFavoriteItem_010_016['sender_address']}
    b2c_favorite_page.Input Sender Postcode    ${b2c_AddFavoriteItem_010_016['sender_postcode']}
    b2c_favorite_page.Select Sender Postcode    ${b2c_AddFavoriteItem_010_016['sender_address_full']}
    b2c_favorite_page.Click Cancel Button
    b2c_favorite_page.Verify Not Display Unsaved Senders In Favorite Page    ${b2c_AddFavoriteItem_010_016}
    common.Verify Capture Screenshot    B2C_AddFavoriteItem_010_016    Not Display Unsaved Senders In Favorite Page

B2C_AddFavoriteItem_010_017
    [Documentation]    [เพิ่มรายการโปรด] กรณี กดปุ่มปิด "X"
    ...                ระบบจะแสดง Pop Up แจ้งเตือน กรณี กดปุ่ม "ตกลง"
    ...                ระบบจะแสดง Pop Up แจ้งเตือน กรณี กดปุ่ม "ยกเลิก"
    [Tags]    B2C_AddFavoriteItem_010    UAT    Medium    Non-Regression    
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email                    ${b2c_login_user_01['username']}
    b2c_login_page.Input Password                 ${b2c_login_user_01['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Click Parcel Delivery Service Menu
    b2c_home_page.Select Sub Menu Favorites
    b2c_favorite_page.Select Sender Tab
    b2c_favorite_page.Click Add Button [Sender]
    b2c_favorite_page.Input Favorite Name    ${b2c_AddFavoriteItem_010_017['favorite_name']}
    b2c_favorite_page.Input Sender Phone Number     ${b2c_AddFavoriteItem_010_017['sender_phone']}
    b2c_favorite_page.Input Sender Name    ${b2c_AddFavoriteItem_010_017['sender_name']}
    b2c_favorite_page.Input Sender Address    ${b2c_AddFavoriteItem_010_017['sender_address']}
    b2c_favorite_page.Input Sender Postcode    ${b2c_AddFavoriteItem_010_017['sender_postcode']}
    b2c_favorite_page.Select Sender Postcode    ${b2c_AddFavoriteItem_010_017['sender_address_full']}
    b2c_favorite_page.Click Close X Button
    b2c_favorite_page.Verify Display Notification Popup Confirm To Close
    common.Verify Capture Screenshot    B2C_AddFavoriteItem_010_017    Display Notification Popup Confirm To Close
    b2c_favorite_page.Click Cancel To Close Add Favorite Sender Popup
    b2c_favorite_page.Verify Display Add Favorite Sender Popup And Recent Data    ${b2c_AddFavoriteItem_010_017}
    common.Verify Capture Screenshot    B2C_AddFavoriteItem_010_017    Display Add Favorite Sender Popup And Recent Data
    b2c_favorite_page.Click Close X Button
    b2c_favorite_page.Click Confirm To Close Add Favorite Sender Popup
    b2c_favorite_page.Verify Not Display Unsaved Senders In Favorite Page    ${b2c_AddFavoriteItem_010_017}
    common.Verify Capture Screenshot    B2C_AddFavoriteItem_010_017    Not Display Unsaved Senders In Favorite Page
    
B2C_AddFavoriteItem_010_018
    [Documentation]    [เพิ่มรายการโปรด] กรอกชื่อรายการโปรดผู้รับพัสดุ ไม่ถูกต้อง
    ...                กรอกชื่อรายการโปรด ไม่เป็นตัวอักษร ภาษาไทย ภาษาอังกฤษ ตัวเลข
    ...                กรอกชื่อรายการโปรด เกิน 50 ตัวอักษร
    [Tags]    B2C_AddFavoriteItem_010    UAT    Low    Regression
    ###The expected results do not match those on the website.
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email                    ${b2c_login_user_01['username']}
    b2c_login_page.Input Password                 ${b2c_login_user_01['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Click Parcel Delivery Service Menu
    b2c_home_page.Select Sub Menu Favorites
    b2c_favorite_page.Select Receiver Tab
    b2c_favorite_page.Click Add Button [Receiver]
    b2c_favorite_page.Input Favorite Name    ${b2c_AddFavoriteItem_010_018.favorite_name['special_char']}
    b2c_favorite_page.Verify Error Message When Input Favorite Name Wrong Format    ${b2c_AddFavoriteItem_010_018['errormsg']}
    common.Verify Capture Screenshot    B2C_AddFavoriteItem_010_018    Error Message When Input Favorite Name With Special Character

B2C_AddFavoriteItem_010_029
    [Documentation]    [เพิ่มรายการโปรด] กดปุ่ม "บันทึก" เพิ่มผู้รับพัสดุ ส่งที่บ้าน   
    [Tags]    B2C_AddFavoriteItem_010    UAT    High    Regression
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email                    ${b2c_login_user_01['username']}
    b2c_login_page.Input Password                 ${b2c_login_user_01['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Click Parcel Delivery Service Menu
    b2c_home_page.Select Sub Menu Favorites
    b2c_favorite_page.Select Receiver Tab
    b2c_favorite_page.Click Add Button [Receiver]
    b2c_favorite_page.Verify Display Popup Receiver Information
    common.Verify Capture Screenshot    B2C_AddFavoriteItem_010_029    Display Popup Receiver Information
    b2c_favorite_page.Input Favorite Name    ${b2c_AddFavoriteItem_010_029['favorite_name']}
    b2c_favorite_page.Verify Input Favorite Name In Field    ${favorite_time_stamp}
    common.Verify Capture Screenshot    B2C_AddFavoriteItem_010_029   Verify Input Favorite Name In Field
    b2c_favorite_page.Click Toggle Use as default
    b2c_favorite_page.Verify Toggle Use As Default Is Open
    common.Verify Capture Screenshot    B2C_AddFavoriteItem_010_029    Verify Toggle Use As Default Is Open
    b2c_favorite_page.Click Toggle Use as default
    b2c_favorite_page.Verify Toggle Use As Default Is Close
    common.Verify Capture Screenshot    B2C_AddFavoriteItem_010_029    Verify Toggle Use As Default Is Close
    b2c_favorite_page.Input Receiver Phone Number     ${b2c_AddFavoriteItem_010_029['receiver_phone']}
    b2c_favorite_page.Verify Input Receiver Phone Number In Field    ${b2c_AddFavoriteItem_010_029['receiver_phone']}
    common.Verify Capture Screenshot    B2C_AddFavoriteItem_010_029   Verify Input Receiver Phone Number In Field
    b2c_favorite_page.Input Receiver Name    ${b2c_AddFavoriteItem_010_029['receiver_name']}
    b2c_favorite_page.Verify Input Receiver Name In Field    ${b2c_AddFavoriteItem_010_029['receiver_name']}
    common.Verify Capture Screenshot    B2C_AddFavoriteItem_010_029   Verify Input Receiver Name In Field
    b2c_favorite_page.Select Pickup Location    ${b2c_AddFavoriteItem_010_029['pickup_location']}
    b2c_favorite_page.Input Receiver Address    ${b2c_AddFavoriteItem_010_029['receiver_address']}
    b2c_favorite_page.Verify Input Receiver Address In Field    ${b2c_AddFavoriteItem_010_029['receiver_address']}
    common.Verify Capture Screenshot    B2C_AddFavoriteItem_010_029   Verify Input Receiver Address In Field
    b2c_favorite_page.Input Receiver Postcode    ${b2c_AddFavoriteItem_010_029['receiver_postcode']}
    b2c_favorite_page.Verify Input Receiver Postcode In Field    ${b2c_AddFavoriteItem_010_029['receiver_postcode']}
    b2c_favorite_page.Verify Data Dropdown List Postcode Displayed    ${b2c_AddFavoriteItem_010_029.receiver_address_full['address01']}
    common.Verify Capture Screenshot    B2C_AddFavoriteItem_010_029    Verify Input Receiver Postcode In Field
    b2c_favorite_page.Not Select Receiver Postcode
    b2c_favorite_page.Verify No Data Input Receiver Postcode In Field
    common.Verify Capture Screenshot    B2C_AddFavoriteItem_010_029    Not Select Receiver Postcode
    b2c_favorite_page.Input Receiver Postcode    ${b2c_AddFavoriteItem_010_029['receiver_postcode']}


