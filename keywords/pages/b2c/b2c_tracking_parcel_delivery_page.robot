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
    [Arguments]    ${option}
    Run Keyword If    '${option}' == 'ค้นหาด้วยหมายเลขพัสดุ'    Click When Ready    ${b2c_cbo_search_by_parcel_number}
    Run Keyword If    '${option}' == 'ค้นหาด้วยชื่อ/เบอร์โทรผู้รับ'    Click When Ready    ${b2c_cbo_search_by_name_or_phone}

Verify Error Message In Modal
    [Arguments]    ${message}    ${path}
    Wait Until Page Contains Element    ${path}    timeout=10s
    Run Keyword If    '${message}' == 'กรุณาระบุหมายเลขพัสดุ'    Element Should Be Visible    ${path}
    Run Keyword If    '${message}' == 'ระบุหมายเลขพัสดุไม่ถูกต้อง'    Element Should Be Visible    ${path}
    Run Keyword If    '${message}' == 'ระบุหมายเลขพัสดุไม่ถูกต้อง'    Element Should Be Visible    ${path}
    Run Keyword If    '${message}' == 'ระบุชื่อหรือเบอร์โทรศัพท์ไม่ถูกต้อง'    Element Should Be Visible    ${path}

Verify Search Results When Search More Than 10 Parcels
    [Arguments]    ${value}
    Wait Until Page Contains Element    ${value}    timeout=10s
    ${length}=    Get Element Count    ${value} 
    Should Be Equal As Numbers    ${length}    10
    Element Should Be Visible    ${value}

# Click Filter Button
#     [Arguments]    ${filter}
#     Click When Ready    ${b2c_btn_filter}
#     Run Keyword If    '${filter}' == 'รับพัสดุเข้าระบบ'    Click When Ready    ${b2c_btn_receive_parcel_into_system_filter}

# Verify Parcel Status
#     [Arguments]    ${status}
#     Wait Until Page Contains Element    ${status}    timeout=10s
#     Run Keyword If    '${status}' == 'รับพัสดุเข้าระบบ'    Element Should Be Visible    ${b2c_txt_receive_parcel_into_system_status}
