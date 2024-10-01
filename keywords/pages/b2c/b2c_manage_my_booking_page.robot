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

Click Filter Button
    Wait Until Element Is Visible    ${b2c_txt_my_parcel}
    Click When Ready    ${b2c_btn_filter}

Verify Open Filter Form 
    Wait Until Element Is Visible    ${b2c_form_filter}    timeout=10s
    Element Should Be Visible    ${b2c_form_filter}

Verify Close Filter Form
    Element Should Not Be Visible    ${b2c_form_filter}

Input Parcel Number In Filter
    [Arguments]    ${parcel_number}
    Wait Until Element Is Visible    ${b2c_txtbox_parcel_number}    timeout=10s
    Input When Ready    ${b2c_txtbox_parcel_number}    ${parcel_number}

Click Search Button
    Click When Ready    ${b2c_btn_search_filter}

Verify Input Parcel Number In Filter
    Wait Until Element Is Visible    ${b2c_txtbox_parcel_number}    timeout=10s
    ${parcel_number}=    Get Value    ${b2c_txtbox_parcel_number}
    Textfield Should Contain    ${b2c_txtbox_parcel_number}    ${parcel_number}

Verify Parcel Number Search Result   
    Wait Until Element Is Visible    ${b2c_card_parcel_search_results}    timeout=10s
    Element Should Be Visible    ${b2c_card_parcel_search_results}

Click Remove Parcel Number Search Button
    Click When Ready    ${b2c_btn_remove_search}

Verify Input Incorrect Parcel Number Search Result
    Element Should Not Be Visible    ${b2c_card_parcel_search_results}