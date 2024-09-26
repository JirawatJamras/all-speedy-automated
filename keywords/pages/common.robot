*** Keywords ***
################### Web Page ###################
Open Chrome Browser
    [Arguments]    ${chrome}
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    --disable-extensions
    Call Method    ${chrome_options}    add_argument    --disable-gpu
    Call Method    ${chrome_options}    add_argument    --no-sandbox
    Call Method    ${chrome_options}    add_argument    --window-size\=1920,1080
    Open Browser    about:blank    ${chrome}    options=${chrome_options}
    SeleniumLibrary.Set Selenium Speed    0.2

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
    Sleep    2s

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

Verify Capture Screenshot
    [Arguments]    ${folder}    ${img_name}
    ${date_YYYY_MM_DD}   Get Current Date
    ${date_YYYY_MM_DD}   Convert Date  ${date_YYYY_MM_DD}       result_format=%Y-%m-%d
    Capture Page Screenshot   ../results/${FOlDER_RESULT}/${folder}/${img_name}.png

Clear Value Input Text
    [Arguments]    ${locator}
    Wait Until Page Contains Element    ${locator}
    Execute JavaScript    document.evaluate("${locator}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.value = '';    

################### Mobile - Android ###################
AllSpeedy Teardown
    # Run keyword If Test Failed   Capture page screenshot
    Close Application

Open AllSpeedy Application
    [Documentation]  Open application that already exist in mobile phone
    Run Keyword If   '${PLATFORM_NAME}' == '${ANDROID_PLATFORM_NAME}'   Open AllSpeedy On Android App
    Run Keyword If   '${PLATFORM_NAME}' == '${IOS_PLATFORM_NAME}'   Open AllSpeedy On IOS App

Open AllSpeedy On Android App
    Open Application   ${REMOTE_URL}
      #...  deviceName=${DEVICE}
      ...  automationName=${AUTOMATION_ANDRIOD_NAME}
      ...  platformName=${ANDROID_PLATFORM_NAME}
      ...  appPackage=${ANDROID_PACKAGE}
      ...  appActivity=${ANDROID_ACTIVITY}
      ...  autoGrantPermissions=true
    
Open AllSpeedy On IOS App
    Open Application  ${REMOTE_URL}
      ...  automationName=${AUTOMATION_IOS_NAME}
    ...    deviceName=iPhone 15 Pro Max
      ...  platformName=${IOS_PLATFORM_NAME}
      ...  bundleId=${IOS_BUNDLE_ID}
      ...  autoGrantPermissions=true

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
