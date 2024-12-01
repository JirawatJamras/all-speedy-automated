*** Keywords ***
Click Search Parcel Button
    ${btn} =  Replace String    ${b2c_btn_search_parcel}    {value}    ${Booking['text_btn_search']}
    Click When Ready    ${btn}

Click Remove Search Parcel Button
    Click When Ready    ${b2c_btn_remove_search_parcel}

Click Search Type Selection Dropdown
    Click When Ready    ${b2c_cbo_search_type_selection}

Select Search Type In Dropdown
    [Arguments]    ${search_type}
    Click When Ready    //div[text()='${search_type}']

Verify Search Results When Search More Than 10 Parcels
    Wait Until Element Is Visible    ${b2c_txt_parcel_search_results}    timeout=${DEFAULT_TIMEOUT}
    Element Should Be Visible    ${b2c_txt_parcel_search_results}
    ${length}=    Get Element Count    ${b2c_txt_parcel_search_results} 
    Should Be Equal As Numbers    ${length}    10

Select Filter
    [Arguments]    ${filter}
    Click When Ready    //span[text()='${filter}']

Verify Parcel Status
    [Arguments]    ${status}
    Wait Until Element Is Visible    ${b2c_txt_parcel_search_results}    timeout=${DEFAULT_TIMEOUT}
    Element Should Be Visible    ${b2c_txt_parcel_status}//div[text()='${status}']