*** Keywords ***
Verify Tracking Parcel Delivery Page
    Wait Until Element Is Visible    ${b2c_mnu_tracking_parcel_delivery}
    Element Should Be Visible    ${b2c_mnu_tracking_parcel_delivery}

Input Parcel Number In Search Parcel
    [Arguments]    ${input}
    Input When Ready    ${b2c_txtbox_search_parcel_number}    ${input}

Input Name Or Phone In Search Parcel
    [Arguments]    ${input}
    Input When Ready    ${b2c_txtbox_search_name_or_phone}    ${input}

Click Search Parcel Button
    Click When Ready    ${b2c_btn_search_parcel}

Verify Parcel Search Results
    Wait Until Element Is Visible    ${b2c_txt_parcel_search_results}    timeout=10s
    Element Should Be Visible    ${b2c_txt_parcel_search_results}

Click Remove Search Parcel Button
    Click When Ready    ${b2c_btn_remove_search_parcel}

Verify Parcel Search Results When Searching For More Than 1 Parcel
    Wait Until Page Contains Element    ${b2c_txt_amount_of_parcel_search_results}    timeout=10s
    Wait Until Page Contains Element    ${b2c_txt_parcel_search_results}    timeout=10s
    ${text}=    Get Text    ${b2c_txt_amount_of_parcel_search_results}
    ${amount}=    Split String    ${text}     ${SPACE}
    ${number} =    Set Variable    ${amount}[1]
    ${length}=    Get Element Count    ${b2c_txt_parcel_search_results} 
    Should Be Equal As Numbers    ${length}    ${number}

Click Search Type Selection Dropdown
    Click When Ready    ${b2c_cbo_search_type_selection}

Select Search Type In Dropdown
    [Arguments]    ${search_type}
    Click When Ready    //div[text()='${search_type}']
    
Verify Error Message In Modal
    [Arguments]    ${error_msg}
    Wait Until Element Is Visible    ${b2c_msg_error_msg_in_modal}    timeout=10s
    Element Should Be Visible    ${b2c_msg_error_msg_in_modal}
    Element Should Contain    ${b2c_msg_error_msg_in_modal}    ${error_msg}

Verify Search Results When Search More Than 10 Parcels
    Wait Until Element Is Visible    ${b2c_txt_parcel_search_results}    timeout=10s
    Element Should Be Visible    ${b2c_txt_parcel_search_results}
    ${length}=    Get Element Count    ${b2c_txt_parcel_search_results} 
    Should Be Equal As Numbers    ${length}    10

Click Filter Button
    Click When Ready    ${b2c_btn_open_filter} 

Select Filter
    [Arguments]    ${filter}
    Click When Ready    //span[text()='${filter}']

Verify Parcel Status
    [Arguments]    ${status}
    Wait Until Element Is Visible    ${b2c_txt_parcel_search_results}    timeout=10s
    Element Should Be Visible    ${b2c_txt_parcel_status}//div[text()='${status}']