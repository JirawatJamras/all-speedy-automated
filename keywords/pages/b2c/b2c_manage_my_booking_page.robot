*** Keywords ***
Verify My Parcel Page
    Wait Until Element Is Visible    ${b2c_txt_my_parcel}    timeout=10s
    Element Should Be Visible    ${b2c_txt_my_parcel}

Click Delivered Parcel Button
    Wait Until Element Is Visible    ${b2c_txt_my_parcel}    timeout=10s
    Click When Ready    ${b2c_btn_delivered_parcel}

Verify Activate Delivered Parcel Button
    Wait Until Element Is Visible    ${b2c_txt_my_parcel}    timeout=10s
    ${checked}=    Get Element Attribute    ${b2c_btn_delivered_parcel}    aria-selected
    Should Be Equal As Strings    ${checked}    true

Click In Transit Button
    Click When Ready    ${b2c_btn_in_transit}

Verify Activate In Transit Button
    Wait Until Element Is Visible    ${b2c_btn_in_transit}    timeout=10s
    ${checked}=    Get Element Attribute    ${b2c_btn_in_transit}    aria-selected
    Should Be Equal As Strings    ${checked}    true

Verify Parcels In Tab Is In Transit
    Wait Until Element Is Visible    ${b2c_txt_parcels_in_tab_is_in_transit}    timeout=10s
    ${checked}=    Get Element Attribute    ${b2c_txt_parcels_in_tab_is_in_transit}    aria-hidden
    Should Be Equal As Strings    ${checked}    false