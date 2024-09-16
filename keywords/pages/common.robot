*** Keywords ***
Open Chrome Browser
    [Arguments]    ${chrome}
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    #Call Method    ${chrome_options}    add_argument    --disable-extensions
    #Call Method    ${chrome_options}    add_argument    --headless
    Call Method    ${chrome_options}    add_argument    --disable-gpu
    Call Method    ${chrome_options}    add_argument    --no-sandbox
    #Call Method    ${chrome_options}    add_argument    --window-size\=1920,1080
    Open Browser    about:blank    ${chrome}    options=${chrome_options}
    SeleniumLibrary.Set Selenium Speed    0.2

Open URL
    [Arguments]    ${url}
    Go To          ${url}

Click Xpath By JavaScript
    [Arguments]                         ${path}
    Wait Until Page Contains Element    xpath=${path}
    Execute JavaScript                  document.evaluate("${path}", document.body, null, 9, null).singleNodeValue.click()

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
    Capture Fullpage Screenshot   ../results/${FOlDER_RESULT}/${folder}/${img_name}_fullpage1.png
