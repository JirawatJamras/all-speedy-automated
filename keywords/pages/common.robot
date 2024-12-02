*** Keywords ***
################### Web Page ###################
Open Chrome Browser
    [Arguments]    ${chrome}
    ${chrome_options}=    Evaluate     sys.modules['selenium.webdriver'].ChromeOptions()     sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    --disable-extensions
    Call Method    ${chrome_options}    add_argument    --disable-infobars
    Call Method    ${chrome_options}    add_argument    --disable-gpu
    Call Method    ${chrome_options}    add_argument    --disable-dev-shm-usage
    Call Method    ${chrome_options}    add_argument    --no-sandbox
    # Call Method    ${chrome_options}    add_argument    --headless\=old
    IF  '${chrome}'=='headlesschrome'
        Call Method     ${chrome_options}      add_argument    --headless\=old
        Call Method    ${chrome_options}    add_argument    --window-size\=1920,1080
    END
    Open Browser    about:blank    Chrome    options=${chrome_options}
    Maximize Browser Window
    SeleniumLibrary.Set Selenium Speed    0.1

Open URL
    [Arguments]    ${url}
    Go To    ${url}

Click Xpath By JavaScript
    [Arguments]    ${path}
    Wait Until Page Contains Element    xpath=${path}
    Execute JavaScript    document.evaluate("${path}", document.body, null, 9, null).singleNodeValue.click()

Input When Ready
    [Arguments]    ${locator}    ${text}
    Wait Until Element Is Visible    ${locator}    ${DEFAULT_TIMEOUT}
    Input Text    ${locator}    ${text}

Click When Ready
    [Arguments]   ${locator}
    Wait Until Element Is Visible   ${locator}   ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

Scroll Window To Vertical
    [Arguments]           ${value}
    Execute JavaScript    window.scrollTo(0,${value})

Scroll Window To Horizontal
    [Arguments]           ${value}
    Execute JavaScript    window.scrollTo(${value},0)

Set Folder Result with date
    ${date_YYYY_MM_DD}   Get Current Date
    ${date_YYYY_MM_DD}   Convert Date  ${date_YYYY_MM_DD}       result_format=%Y-%m-%d
    ${FOlDER_RESULT}=    Set Variable    ../results/${date_YYYY_MM_DD}
    Set Global Variable    ${FOlDER_RESULT}
    Set Current Date in Thai

Set Current Date in Thai
    ${date}=    Get Current Date    result_format=%d
    ${month}=    Get Current Date    result_format=%B
    ${year}=    Get Current Date    result_format=%Y
    ${thai_month}=    Convert Month To Thai    ${month}
    ${current_date_thai}=    Set Variable    ${date} ${thai_month} ${year}
    Set Global Variable    ${current_date_thai}

Convert Month To Thai
    [Arguments]    ${english_month}
    ${thai_month}=    Run Keyword If    '${english_month}' == 'January'    Set Variable    มกราคม
    ...    ELSE IF    '${english_month}' == 'February'    Set Variable    กุมภาพันธ์
    ...    ELSE IF    '${english_month}' == 'March'    Set Variable    มีนาคม
    ...    ELSE IF    '${english_month}' == 'April'    Set Variable    เมษายน
    ...    ELSE IF    '${english_month}' == 'May'    Set Variable    พฤษภาคม
    ...    ELSE IF    '${english_month}' == 'June'    Set Variable    มิถุนายน
    ...    ELSE IF    '${english_month}' == 'July'    Set Variable    กรกฎาคม
    ...    ELSE IF    '${english_month}' == 'August'    Set Variable    สิงหาคม
    ...    ELSE IF    '${english_month}' == 'September'    Set Variable    กันยายน
    ...    ELSE IF    '${english_month}' == 'October'    Set Variable    ตุลาคม
    ...    ELSE IF    '${english_month}' == 'November'    Set Variable    พฤศจิกายน
    ...    ELSE IF    '${english_month}' == 'December'    Set Variable    ธันวาคม
    RETURN    ${thai_month}

Set Date Pattern
    [Arguments]    ${day}
    ${d}    Split String And Select    ${day}    -    0
    ${m}    Split String And Select    ${day}    -    1
    ${y}    Split String And Select    ${day}    -    2
    ${date}    Set Variable    ${d}/${m}/${y}
    RETURN    ${date}

Verify Capture Screenshot
    [Arguments]    ${feature}    ${folder}    ${img_name}
    ${date_YYYY_MM_DD}   Get Current Date
    ${date_YYYY_MM_DD}   Convert Date  ${date_YYYY_MM_DD}       result_format=%Y-%m-%d
    Evaluate    os.makedirs('${FOlDER_RESULT}/${feature}/${folder}', exist_ok=True)    modules=os
    Capture Page Screenshot   ../results/${FOlDER_RESULT}/${feature}/${folder}/${img_name}.png

Clear Value Input Text
    [Arguments]    ${locator}
    Wait Until Page Contains Element    ${locator}
    Execute JavaScript    document.evaluate("${locator}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.value = '';    

Scroll Into View By Xpath
    [Arguments]    ${xpath}    ${boolean}
    Wait Until Page Contains Element    xpath=${xpath}    50
    Execute JavaScript    dom:document.evaluate("${xpath}",document.body,null,9,null).singleNodeValue.scrollIntoView(${boolean})

Scroll To vertical By Xpath
    [Arguments]    ${xpath}    ${value}
    Wait Until Page Contains Element    xpath=${xpath}
    Execute JavaScript    document.evaluate("${xpath}",document.body,null,9,null).singleNodeValue.scrollTo(${value},0)

Split String And Select
    [Arguments]    ${value}    ${separator}   ${index}
    ${value} =    Split String    ${value}    ${separator}
    ${value} =    Set Variable    ${value}[${index}]
    RETURN    ${value}

Get Access Token
    Create Session    auth_session    ${CPS_API_UAT_URL}
    &{auth_payload}    Create Dictionary    email=${b2c_login_user_01['username']}    password=${b2c_login_user_01['password']}
    ${response}    POST On Session    auth_session    /users/b2c/login    json=${auth_payload}
    Should Be Equal As Numbers    ${response.status_code}    200    Failed to authenticate and obtain token
    ${access_token}    Get From Dictionary    ${response.json()}    token
    RETURN    ${access_token}

Delete API Booking By Booking ID
    [Arguments]    ${booking_id}
    ${access_token}=    Get Access Token
    Create Session    allspeedy_api    ${CPS_API_UAT_URL}
    &{headers}    Create Dictionary    token=${access_token}    Accept=application/json, text/plain, */*
    ${response}    DELETE On Session    allspeedy_api    /bookings/${booking_id}    headers=${headers}
    Log    ${response.status_code}
    Log    ${response.content}

Get Parcels And Sender Names
    [Documentation]    Retrieve parcels' codes and sender's names from the API response
    [Arguments]    ${booking_id}
    ${access_token}=    Get Access Token
    &{headers}    Create Dictionary    token=${access_token}    Accept=application/json, text/plain, */*
    Create Session    api_session    https://cps-api-uat.allspeedy.co.th/v1
    ${response} =    GET On Session    api_session    /bookings/${booking_id}    headers=${headers}
    ${status_code} =    Convert To Integer    ${response.status_code}
    Should Be Equal As Integers    ${status_code}    200    API request failed
    ${json_response} =    Convert String To Json    ${response.content}
    ${ParcelsData} =    Create List

    FOR    ${item}    IN    @{json_response['data']}
        FOR    ${parcel}    IN    @{item['parcels']}
            ${parcel_code} =    Get From Dictionary    ${parcel}    code
            ${sender_name} =    Get From Dictionary    ${parcel['sender']}    name
            ${parcel_entry} =    Create List    ${parcel_code}    ${sender_name}
            Append To List    ${ParcelsData}    ${parcel_entry}
        END
    END
    RETURN    ${ParcelsData}

Get Parcel Codes By Sender Name
    [Arguments]    ${ParcelsData}    ${sender_name}
    FOR    ${item}    IN    @{ParcelsData}
        ${current_parcel_code} =    Get From List    ${item}    0
        ${current_sender} =    Get From List    ${item}    1
        Run Keyword If    '${current_sender}' == '${sender_name}'    Set Suite Variable    ${filtered_parcels_matched_with_sender_name}    ${current_parcel_code}
    END
    RETURN    ${filtered_parcels_matched_with_sender_name}

Get Parcel ID By Sender Name
    [Arguments]    ${list_data}    ${sender_name}
    ${parcel_id}    Get From Dictionary    ${list_data}    ${sender_name}
    RETURN    ${parcel_id}

Robot Skip Step Print Label
    Sleep    5s
    Switch Window    NEW
    ${os} =    Evaluate    platform.system().lower()    modules=platform
    Run Keyword If    'darwin' == '${os}'    Press Keys    None    ESC  # macOS
    ...               ELSE IF    'windows' == '${os}'    Press Keys    None    TAB+SPACE  # Windows
    ...               ELSE    Log    Unsupported OS
    Switch Window    MAIN

################### Manage Excel ###################    
Read Row From Excel
    [Arguments]    ${file_path}    ${sheet_name}    ${row_number}
    ${workbook}=   Evaluate    openpyxl.load_workbook(r"${file_path}")
    ${sheet}=    Set Variable    ${workbook}[${sheet_name}]
    ${row_values}=    Create List
    FOR    ${cell}    IN    @{sheet[${row_number}]}
        Append To List    ${row_values}    ${cell.value}
    END    
    RETURN   ${row_values}

Set Tracking Information from excel
    [Arguments]    ${tracking_info}
    # Classify data
    ${create_date}    Get From List    ${tracking_info}    0
    ${tracking_number}    Get From List    ${tracking_info}    1
    ${customer_id}    Get From List    ${tracking_info}    2
    ${size_cm}    Get From List    ${tracking_info}    3
    ${size}    Get From List    ${tracking_info}    4
    ${courier}    Get From List    ${tracking_info}    5
    ${origin_warehoues}    Get From List    ${tracking_info}    6
    ${send_parcel_to}    Get From List    ${tracking_info}    7
    ${sender_name}    Get From List    ${tracking_info}    8
    ${sender_phone}    Get From List    ${tracking_info}    9
    ${sender_shipping_origin}    Get From List    ${tracking_info}    10
    ${sender_address}    Get From List    ${tracking_info}    11
    ${receiver_name}    Get From List    ${tracking_info}    12
    ${receiver_phone}    Get From List    ${tracking_info}    13
    ${receiver_shipping_destination}    Get From List    ${tracking_info}    14
    ${receiver_address}    Get From List    ${tracking_info}    15

    ${courier_label}    Get From List    ${tracking_info}    20
    ${zipcode_label}    Get From List    ${tracking_info}    21
    ${province_label}    Get From List    ${tracking_info}    22
    ${customer_label}    Get From List    ${tracking_info}    23
    ${phone_label}    Get From List    ${tracking_info}    24
    ${tracking_label}=     Set Variable    ${tracking_number}
    
    Set Suite Variable    ${create_date}
    Set Suite Variable    ${tracking_number}
    Set Suite Variable    ${customer_id}
    Set Suite Variable    ${size_cm}
    Set Suite Variable    ${size}
    Set Suite Variable    ${courier}
    Set Suite Variable    ${origin_warehoues}
    Set Suite Variable    ${send_parcel_to}
    Set Suite Variable    ${sender_name}
    Set Suite Variable    ${sender_phone}
    Set Suite Variable    ${sender_shipping_origin}
    Set Suite Variable    ${sender_address}
    Set Suite Variable    ${receiver_name}
    Set Suite Variable    ${receiver_phone}
    Set Suite Variable    ${receiver_shipping_destination}
    Set Suite Variable    ${receiver_address}
    Set Suite Variable    ${courier_label} 
    Set Suite Variable    ${zipcode_label} 
    Set Suite Variable    ${province_label} 
    Set Suite Variable    ${customer_label}
    Set Suite Variable    ${phone_label}
    Set Suite Variable    ${tracking_label}
    
Delete Row In Excel
    [Arguments]    ${file_path}    ${sheet_name}    ${row_to_delete}
    ${workbook}=    Evaluate    openpyxl.load_workbook(r"${file_path}")
    ${sheet}=    Set Variable    ${workbook}[${sheet_name}]
    ${row_to_delete_int}=    Convert To Integer    ${row_to_delete}
    Run Keyword    Call Method    ${sheet}    delete_rows    ${row_to_delete_int}
    Run Keyword    Call Method    ${workbook}    save    ${file_path}
    Run Keyword    Call Method    ${workbook}    close

Set Tomorrow Date
    ${today}=    Get Current Date    result_format=%Y-%m-%d
    ${tomorrow_day}=    Add Time To Date    ${today}    1 days    result_format=%d-%m-%Y
    ${day}    Split String And Select    ${tomorrow_day}    -    0
    ${month}    Split String And Select    ${tomorrow_day}    -    1
    ${year}    Split String And Select    ${tomorrow_day}    -    2
    ${year_be}    Evaluate    int(${year}) + 543
    ${tomorrow}    Set Variable    ${day}-${month}-${year_be}
    Set Suite Variable    ${tomorrow}

Set Today
    ${date_YYYY_MM_DD}   Get Current Date
    ${date_YYYY_MM_DD}   Convert Date  ${date_YYYY_MM_DD}       result_format=%d-%m-%Y
    ${d}    Split String And Select    ${date_YYYY_MM_DD}    -    0
    ${m}    Split String And Select    ${date_YYYY_MM_DD}    -    1
    ${y}    Split String And Select    ${date_YYYY_MM_DD}    -    2
    ${year}    Convert To Integer    ${y}
    ${year}    Evaluate    ${y} + 543
    ${today}    Set Variable    ${d}-${m}-${year}
    Set Suite Variable    ${today}

Set Yesterday
    ${today}=    Get Current Date    result_format=%Y-%m-%d
    ${yester_day}=    Subtract Time From Date	    ${today}    1 days    result_format=%d-%m-%Y
    ${day}    Split String And Select    ${yester_day}    -    0
    ${month}    Split String And Select    ${yester_day}    -    1
    ${year}    Split String And Select    ${yester_day}    -    2
    ${year_be}    Evaluate    int(${year}) + 543
    ${yesterday}    Set Variable    ${day}-${month}-${year_be}
    Set Suite Variable    ${yesterday}