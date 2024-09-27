*** Settings ***
Resource          ../../resourses/import.robot
Resource          ../../resourses/init_website.robot
Test Setup       Run Keywords    Open Chrome Browser    chrome    #headlesschrome    #chrome
                 ...    AND   Set Folder Result with date
Test Teardown    Close Browser

*** Test Cases ***
B2C_AddFavoriteItem_010_001
    [Documentation]      [เพิ่มรายการโปรด] กรณี กดปุ่ม "+ เพิ่ม"
    [Tags]    B2C_AddFavoriteItem_010    UAT    Low    Regression    In_Review
    common.Open URL                           ${B2C_UAT_URL}
    b2c_landing_page.Click Go Login Button
    b2c_login_page.Input Email                    ${b2c_login_user_06['username']}
    b2c_login_page.Input Password                 ${b2c_login_user_06['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Click Parcel Delivery Service Menu
    b2c_home_page.Select Sub Menu Favorites
    b2c_favorite_page.Select Tab Sender
    b2c_favorite_page.Click Add Button
    b2c_favorite_page.Verify Display Popup Sender Information
    common.Verify Capture Screenshot    B2C_AddFavoriteItem_010_001    Display PopUp Add Sender Information

B2C_AddFavoriteItem_010_002
    [Documentation]      [เพิ่มรายการโปรด] กรอกชื่อรายการโปรด ถูกต้อง
    ...                  กรอกชื่อรายการโปรด เป็นตัวอักษร ภาษาไทย ภาษาอังกฤษ ตัวเลข,
    ...                  กรอกชื่อรายการโปรด ไม่เกิน 50 ตัวอักษร
    [Tags]    B2C_AddFavoriteItem_010    UAT    Medium    Regression    In_Review
    common.Open URL                           ${B2C_UAT_URL}
    b2c_landing_page.Click Go Login Button
    b2c_login_page.Input Email                    ${b2c_login_user_06['username']}
    b2c_login_page.Input Password                 ${b2c_login_user_06['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Click Parcel Delivery Service Menu
    b2c_home_page.Select Sub Menu Favorites
    b2c_favorite_page.Select Tab Sender
    b2c_favorite_page.Click Add Button
    b2c_favorite_page.Input Favorite Name    ${b2c_AddFavoriteItem_010_002['favorite_name']}
    b2c_favorite_page.Verify Input Favorite Name In Field    ${b2c_AddFavoriteItem_010_002['favorite_name']}
    common.Verify Capture Screenshot    B2C_AddFavoriteItem_010_002   Verify Input Favorite Name In Field

B2C_AddFavoriteItem_010_003
    [Documentation]      [เพิ่มรายการโปรด] กรอกชื่อรายการโปรด ไม่ถูกต้อง
    ...                  กรอกชื่อรายการโปรด ไม่เป็นตัวอักษร ภาษาไทย ภาษาอังกฤษ ตัวเลข,
    ...                  กรอกชื่อรายการโปรด เกิน 50 ตัวอักษร
    [Tags]    B2C_AddFavoriteItem_010    UAT    Low    Regression    Failed
    ###The expected results do not match those on the website. The commented code is the actual result on the website.
    common.Open URL                           ${B2C_UAT_URL}
    b2c_landing_page.Click Go Login Button
    b2c_login_page.Input Email                    ${b2c_login_user_06['username']}
    b2c_login_page.Input Password                 ${b2c_login_user_06['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Click Parcel Delivery Service Menu
    b2c_home_page.Select Sub Menu Favorites
    b2c_favorite_page.Select Tab Sender
    b2c_favorite_page.Click Add Button
    b2c_favorite_page.Input Favorite Name    ${b2c_AddFavoriteItem_010_003.favorite_name['special_char']}
    b2c_favorite_page.Verify Error Message When Input Favorite Name Wrong Format    ${b2c_AddFavoriteItem_010_003['errormsg']}
    # b2c_favorite_page.Verify Error Message When Input Favorite Name Special Char    ${b2c_AddFavoriteItem_010_03['errormsg']}
    common.Verify Capture Screenshot    B2C_AddFavoriteItem_010_03    Verify Error Message When Input Favorite Name Special Char
    b2c_favorite_page.Clear Input Favorite Name
    b2c_favorite_page.Input Favorite Name    ${b2c_AddFavoriteItem_010_003.favorite_name['more_than_specified']}
    b2c_favorite_page.Verify Error Message When Input Favorite Name Wrong Format    ${b2c_AddFavoriteItem_010_003['errormsg']}
    # b2c_favorite_page.Verify Can Not Input Favorite Name More Than Specified    ${b2c_AddFavoriteItem_010_03['specified_value']}
    common.Verify Capture Screenshot    B2C_AddFavoriteItem_010_03    Verify Can Not Input Favorite Name More Than Specified


B2C_AddFavoriteItem_010_004
    [Documentation]      [เพิ่มรายการโปรด] กรอกชื่อรายการโปรด ไม่ถูกต้อง
    ...                  ไม่กรอกชื่อ
    [Tags]    B2C_AddFavoriteItem_010    UAT    Low    Regression    In_Review
    common.Open URL                           ${B2C_UAT_URL}
    b2c_landing_page.Click Go Login Button
    b2c_login_page.Input Email                    ${b2c_login_user_06['username']}
    b2c_login_page.Input Password                 ${b2c_login_user_06['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Click Parcel Delivery Service Menu
    b2c_home_page.Select Sub Menu Favorites
    b2c_favorite_page.Select Tab Sender
    b2c_favorite_page.Click Add Button
    b2c_favorite_page.Not Input Favorite Name
    b2c_favorite_page.Verify Error Message When Not Input Favorite Name    ${b2c_AddFavoriteItem_010_004['errormsg']}
    common.Verify Capture Screenshot    B2C_AddFavoriteItem_010_004    Verify Error Message When Not Input Favorite Name

B2C_AddFavoriteItem_010_005
    [Documentation]          [เพิ่มรายการโปรด] กรณี เปิด Toggle ใช้เป็นค่าเริ่มต้น,
    ...                      กรณี ปิด Toggle ใช้เป็นค่าเริ่มต้น
    [Tags]    B2C_AddFavoriteItem_010    UAT    Low    Regression    In_Review
    common.Open URL                           ${B2C_UAT_URL}
    b2c_landing_page.Click Go Login Button
    b2c_login_page.Input Email                    ${b2c_login_user_06['username']}
    b2c_login_page.Input Password                 ${b2c_login_user_06['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Click Parcel Delivery Service Menu
    b2c_home_page.Select Sub Menu Favorites
    b2c_favorite_page.Select Tab Sender
    b2c_favorite_page.Click Add Button
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
    [Tags]    B2C_AddFavoriteItem_010    UAT    Low    Regression    In_Review
    common.Open URL                           ${B2C_UAT_URL}
    b2c_landing_page.Click Go Login Button
    b2c_login_page.Input Email                    ${b2c_login_user_06['username']}
    b2c_login_page.Input Password                 ${b2c_login_user_06['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Click Parcel Delivery Service Menu
    b2c_home_page.Select Sub Menu Favorites
    b2c_favorite_page.Select Tab Sender
    b2c_favorite_page.Click Add Button
    b2c_favorite_page.Input Favorite Name     ${b2c_AddFavoriteItem_010_006['favorite_name']}
    b2c_favorite_page.Input Phone Number     ${b2c_AddFavoriteItem_010_006['phone_no']}
    b2c_favorite_page.Verify Input Phone Number In Field    ${b2c_AddFavoriteItem_010_006['phone_no']}
    common.Verify Capture Screenshot    B2C_AddFavoriteItem_010_006   Verify Input Phone Number In Field

B2C_AddFavoriteItem_010_007
    [Documentation]      [เพิ่มรายการโปรด] กรอกเบอร์โทรศัพท์ ไม่ถูกต้อง
    ...                  กรอกเบอร์โทรศัพท์ ไม่เป็นตัวเลข,
    ...                  กรอกเบอร์โทรศัพท์ เกิน 10 หลัก
    [Tags]    B2C_AddFavoriteItem_010    UAT    Low    Regression    B    ###INPROGRESS
    common.Open URL                           ${B2C_UAT_URL}
    b2c_landing_page.Click Go Login Button
    b2c_login_page.Input Email                    ${b2c_login_user_06['username']}
    b2c_login_page.Input Password                 ${b2c_login_user_06['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Click Parcel Delivery Service Menu
    b2c_home_page.Select Sub Menu Favorites
    b2c_favorite_page.Select Tab Sender
    b2c_favorite_page.Click Add Button
    b2c_favorite_page.Input Favorite Name    ${b2c_AddFavoriteItem_010_007['favorite_name']}
    b2c_favorite_page.Input Phone Number     ${b2c_AddFavoriteItem_010_007.phone_no['character']}
    # b2c_favorite_page.Verify Error Message When Input Phone Number Wrong Format    ${b2c_AddFavoriteItem_010_007['errormsg']}
    b2c_favorite_page.Clear Input Phone Number