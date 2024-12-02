**** Keywords ***
Click Log In Button In Landing Page
    ${login_button}=    Replace String    ${c2c_btn_login_landing_page}    {value}    ${Booking['text_login']}
    common.Click when ready    ${login_button}

Click Menu Seven Store
    ${c2c_mnu_seven_store_landing_page}=    Replace String    ${c2c_mnu_seven_store_landing_page}    {value}    ${Booking['text_7_11_store']}
    Wait Until Element Is Not Visible    ${c2c_img_loading_landing_page}    timeout=${DEFAULT_TIMEOUT}
    common.Click when ready    ${c2c_mnu_seven_store_landing_page}

Click Menu Shipping
    ${c2c_btn_shipping_landing_page}=    Replace String    ${c2c_btn_shipping_landing_page}    {value}    ${Booking['text_send_parcel_speed_d']}
    ${c2c_tab_service_landing_page}=    Replace String    ${c2c_tab_service_landing_page}    {value}    ${Booking['text_service']}
    Wait Until Element Is Visible    ${c2c_tab_service_landing_page}    timeout=${DEFAULT_TIMEOUT}
    common.Click when ready    ${c2c_btn_shipping_landing_page}
    ${isvisible}=    Run Keyword And Ignore Error    Wait Until Page Contains Element    ${b2c_img_loading}    timeout=${DEFAULT_TIMEOUT}
    Wait Until Page Does Not Contain Element    ${b2c_img_loading}    timeout=${DEFAULT_TIMEOUT}

Verify Login Success
    [Arguments]    ${account_name}
    ${isvisible}=    Run Keyword And Ignore Error    Wait Until Page Contains Element    ${c2c_img_loading_landing_page}    timeout=${DEFAULT_TIMEOUT}
    Wait Until Page Does Not Contain Element    ${c2c_img_loading_landing_page}    timeout=${DEFAULT_TIMEOUT}
    Sleep    5s
    Element Should Contain    ${c2c_txt_accountname_landing_page}    ${account_name}