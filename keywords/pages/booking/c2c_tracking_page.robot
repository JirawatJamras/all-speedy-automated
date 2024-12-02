*** Keywords ***

Verify Page Should Be Tracking Parcel Page
    ${c2c_txt_tracking_parcel_tracking_page}=    Replace String    ${c2c_txt_tracking_parcel_tracking_page}    {value}    ${Booking['text_menu_status_tracking']}
    Wait Until Element Is Visible    ${c2c_txt_tracking_parcel_tracking_page}    timeout=${DEFAULT_TIMEOUT}