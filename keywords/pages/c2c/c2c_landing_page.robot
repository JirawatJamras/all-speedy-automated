**** Keywords ***
Click Menu Seven Store
    Wait Until Element Is Not Visible    ${c2c_img_loading_landing_page}     10s
    common.Click when ready    ${c2c_mnu_seven_store_landing_page}

Click Menu Shipping
    Wait Until Element Is Visible    ${c2c_tab_service_landing_page}
    common.Click when ready    ${c2c_btn_shipping_landing_page}

Click Menu Tracking
    Wait Until Element Is Visible    ${c2c_tab_service_landing_page}
    common.Click when ready    ${c2c_btn_tracking_landing_page}
    Sleep    5s

Verify Login Success
    [Arguments]    ${account_name}
    Wait Until Element Is Not Visible    ${c2c_img_loading_landing_page}     10s
    Element Should Contain    ${c2c_txt_accountname_landing_page}    ${account_name}

Verify Page Should not Redirect
    Wait Until Element Is Not Visible    ${c2c_img_loading_landing_page}     10s
    Wait Until Element Is Visible    ${c2c_txt_accountname_landing_page}