*** Keywords ***
Click Tracking Parcel Delivery Menu Button
    Click When Ready    ${b2c_mnu_tracking_parcel_delivery}

Verify Tracking Parcel Delivery Page
    Wait Until Element Is Visible    ${b2c_mnu_tracking_parcel_delivery}
    Element Should Be Visible    ${b2c_mnu_tracking_parcel_delivery}

Input Search Parcel Data
    [Arguments]    ${Value}
    Input When Ready    ${b2c_txtbox_search_parcel}    ${Value}

Click Search Parcel Button
    Click When Ready    ${b2c_btn_search_parcel}

Verify Parcel Search Results
    [Arguments]    ${Value}
    Wait Until Page Contains Element    ${Value}    timeout=10s
    Element Should Be Visible    ${Value}

Click Remove Search Parcel Button
    Click When Ready    ${b2c_btn_remove_search_parcel}

Verify Parcel Search Results When Searching For More Than 1 Parcel
    [Arguments]    ${Result}    ${Value}
    Wait Until Page Contains Element    ${Result}    timeout=10s
    Wait Until Page Contains Element    ${Value}    timeout=10s
    ${length}=    Get Element Count    ${Result} 
    ${text}=    Get Text    ${Value}
    ${amount}=    Split String    ${text}     ${SPACE}
    ${number} =    Set Variable    ${amount}[1]
    Should Be Equal As Numbers    ${length}    ${number}

Verify 10 Parcels Search Results
    [Arguments]    ${Value}
    Wait Until Page Contains Element    ${Value}    timeout=10s
    ${length}=    Get Element Count    ${Value} 
    Should Be Equal As Numbers    ${length}    10
    Element Should Be Visible    ${Value}
