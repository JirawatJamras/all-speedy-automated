*** Keywords ***
Verify Tracking Parcel Delivery Page
    Wait Until Element Is Visible    ${b2c_mnu_tracking_parcel_delivery}
    Element Should Be Visible    ${b2c_mnu_tracking_parcel_delivery}

Input Search Parcel Data
    [Arguments]    ${search_type}    ${input}
    Run Keyword If    '${search_type}' == 'ระบุหมายเลขพัสดุ'    Input When Ready    ${b2c_txtbox_search_parcel_number}    ${input}
    Run Keyword If    '${search_type}' == 'ระบุชื่อหรือเบอร์โทรผู้รับ'    Input When Ready    ${b2c_txtbox_search_name_or_phone}    ${input}

Click Search Parcel Button
    Click When Ready    ${b2c_btn_search_parcel}

Verify Parcel Search Results
    [Arguments]    ${value}
    Wait Until Page Contains Element    ${value}    timeout=10s
    Element Should Be Visible    ${value}

Click Remove Search Parcel Button
    Click When Ready    ${b2c_btn_remove_search_parcel}

Verify Parcel Search Results When Searching For More Than 1 Parcel
    [Arguments]    ${result}    ${value}
    Wait Until Page Contains Element    ${result}    timeout=10s
    Wait Until Page Contains Element    ${value}    timeout=10s
    ${length}=    Get Element Count    ${result} 
    ${text}=    Get Text    ${value}
    ${amount}=    Split String    ${text}     ${SPACE}
    ${number} =    Set Variable    ${amount}[1]
    Should Be Equal As Numbers    ${length}    ${number}

Click Search Type Selection Dropdown
    Click When Ready    ${b2c_cbo_search_type_selection}

Select Search Type In Dropdown
    [Arguments]    ${search_type}
    Click When Ready    //div[text()='${search_type}']
    

Verify Error Message In Modal
    [Arguments]    ${errormsg}
    Wait Until Page Contains Element    //div[text()='${errormsg}']    timeout=10s
    Element Should Be Visible    //div[text()='${errormsg}']

Verify Search Results When Search More Than 10 Parcels
    [Arguments]    ${value}
    Wait Until Page Contains Element    ${value}    timeout=10s
    ${length}=    Get Element Count    ${value} 
    Should Be Equal As Numbers    ${length}    10
    Element Should Be Visible    ${value}

Click Filter Button
    Click When Ready    ${b2c_btn_open_filter} 

Select Filter
    [Arguments]    ${filter}
    Click When Ready    //span[text()='${filter}']

Verify Parcel Status
    [Arguments]    ${status}
    Wait Until Page Contains Element    ${b2c_txt_many_parcel_search_results}    timeout=10s
    Element Should Be Visible    ${b2c_txt_parcel_status}//div[text()='${status}']

Click Close Filter Button
    Click When Ready    ${b2c_btn_close_filter}
    
