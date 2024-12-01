*** Keywords ***
Click Delivery Completed
    Click When Ready    ${b2c_btn_delivery_completed}

Click Other
    Click When Ready    ${b2c_btn_other}

Verify Activate In Transit Button
    Wait Until Element Is Visible    ${b2c_btn_in_transit}    timeout=${DEFAULT_TIMEOUT}
    ${checked}=    Get Element Attribute    ${b2c_btn_in_transit}    aria-selected
    Should Be Equal As Strings    ${checked}    true

Verify Parcels In Tab Is In Transit
    Wait Until Element Is Visible    ${b2c_txt_parcels_in_tab_is_in_transit}    timeout=${DEFAULT_TIMEOUT}
    ${checked}=    Get Element Attribute    ${b2c_txt_parcels_in_tab_is_in_transit}    aria-hidden
    Should Be Equal As Strings    ${checked}    false

Verify Open Filter Form 
    Wait Until Element Is Visible    ${b2c_form_filter}    timeout=${DEFAULT_TIMEOUT}
    Element Should Be Visible    ${b2c_form_filter}

Verify Close Filter Form
    Element Should Not Be Visible    ${b2c_form_filter}

Input Parcel Number In Filter
    [Arguments]    ${parcel_number}
    Wait Until Element Is Visible    ${b2c_txtbox_parcel_number}    timeout=${DEFAULT_TIMEOUT}
    Input When Ready    ${b2c_txtbox_parcel_number}    ${parcel_number}

Verify Input Parcel Number In Filter
    Wait Until Element Is Visible    ${b2c_txtbox_parcel_number}    timeout=${DEFAULT_TIMEOUT}
    ${parcel_number}=    Get Value    ${b2c_txtbox_parcel_number}
    Textfield Should Contain    ${b2c_txtbox_parcel_number}    ${parcel_number}

Verify Parcels In Search Result   
    Wait Until Element Is Visible    ${b2c_card_parcel_search_results}    timeout=${DEFAULT_TIMEOUT}
    Element Should Be Visible    ${b2c_card_parcel_search_results}

Click Remove Data In Search Button
    Click When Ready    ${b2c_btn_remove_search}

Input Name In Filter
    [Arguments]    ${name}
    Wait Until Element Is Visible    ${b2c_txtbox_name}    timeout=${DEFAULT_TIMEOUT}
    Input When Ready    ${b2c_txtbox_name}    ${name}

Verify Input Name In Filter
    Wait Until Element Is Visible    ${b2c_txtbox_name}    timeout=${DEFAULT_TIMEOUT}
    ${name}=    Get Value    ${b2c_txtbox_name}
    Textfield Should Contain    ${b2c_txtbox_name}    ${name}

Input Address In Filter
    [Arguments]    ${address}
    Wait Until Element Is Visible    ${b2c_txtbox_address}    timeout=${DEFAULT_TIMEOUT}
    Input When Ready    ${b2c_txtbox_address}    ${address}

Verify Input Address In Filter
    Wait Until Element Is Visible    ${b2c_txtbox_address}    timeout=${DEFAULT_TIMEOUT}
    ${address}=    Get Value    ${b2c_txtbox_address}
    Textfield Should Contain    ${b2c_txtbox_address}    ${address}