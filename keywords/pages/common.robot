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
    Call Method    ${chrome_options}    add_argument    --window-size\=1920,1080
    # Call Method    ${chrome_options}    add_argument    --headless\=old
    IF  '${chrome}'=='headlesschrome'
        Call Method     ${chrome_options}      add_argument    --headless\=old
    END
    Open Browser    about:blank    Chrome    options=${chrome_options}
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
    Create Session    api_session    https://cps-api-uat.allspeedy.co.th/v1/bookings/${booking_id}
    ${response} =    GET On Session    api_session    /
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
  
################### Mobile - Android ###################
Application Teardown
    # Run keyword If Test Failed   Capture page screenshot
    Close All Applications

Open AllSpeedy Application On Android App
    [Documentation]  Open application that already exist in mobile phone
    Open Application   ${REMOTE_URL}
      #...  deviceName=${DEVICE}
      ...  automationName=${AUTOMATION_ANDRIOD_NAME}
      ...  platformName=${ANDROID_PLATFORM_NAME}
      ...  appPackage=${ALLSPEEDY_ANDROID_PACKAGE}
      ...  appActivity=${ALLSPEEDY_ANDROID_ACTIVITY}
      ...  autoGrantPermissions=true

Open POS Online Application On Android App
    [Documentation]  Open application that already exist in mobile phone
    Open Application   ${REMOTE_URL}
      #...  deviceName=${DEVICE}
      ...  automationName=${AUTOMATION_ANDRIOD_NAME}
      ...  platformName=${ANDROID_PLATFORM_NAME}
      ...  appPackage=${POSONLINE_ANDROID_PACKAGE}
      ...  appActivity=${POSONLINE_ANDROID_ACTIVITY}
      ...  autoGrantPermissions=true

Open Chrome On Android Device
    Open Application  ${REMOTE_URL}
    ...    automationName=${AUTOMATION_ANDRIOD_NAME}
    ...    platformName=${PLATFORM_NAME}
    ...    platformVersion=${PLATFORM_VERSION}
    ...    deviceName=${DEVICE_NAME}
    ...    appPackage=${CHROME_ANDROID_PACKAGE}
    ...    appActivity=${CHROME_ANDROID_ACTIVITY}
    ...    autoGrantPermissions=true

Click Back Button
    common.Click when ready    ${btn_back}

Generate Random Mobile Number
    ${random_digits}=  Evaluate   ''.join([str(random.randint(0,9)) for i in range(8)])   random
    ${mobile_number}=  Set Variable   09${random_digits}
    RETURN   ${mobile_number}

Hide Device Keyboard
    Run Keyword If   '${PLATFORM_NAME}' == '${ANDROID_PLATFORM_NAME}'   Hide Keyboard
    Run Keyword If   '${PLATFORM_NAME}' == '${IOS_PLATFORM_NAME}'   Hide Keyboard    key_name=Done

Format Mobile Number
    [Arguments]    ${mobile_number}
    ${formatted_number}=    Set Variable    ${mobile_number[:3]}-${mobile_number[3:6]}-${mobile_number[6:]}
    RETURN    ${formatted_number}

Find Element Vertical
    [Arguments]    ${element}
    FOR    ${index}    IN RANGE    5
        ${element_status}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${element}
        Run keyword if    '${element_status}' == 'False'    Swipe by percent    50  70  50  40
        Exit For Loop If    ${element_status}
    END
    Run keyword if    '${element_status}' == 'False'   Fail   Element not found

Find Element Horizontal
     [Arguments]    ${element}
    FOR    ${index}    IN RANGE    5
        ${element_status}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${element}
        Run keyword if    '${element_status}' == 'False'    Swipe By Percent    70    50    40    50
        Exit For Loop If    ${element_status}
    END
    Run keyword if    '${element_status}' == 'False'   Fail   Element not found

Verify text of element
    [Arguments]   ${locator}   ${value}
    ${locator}=  Replace String   ${locator}   {value}   ${value}
    Wait Until Element Is Visible   ${locator}    ${DEFAULT_TIMEOUT}