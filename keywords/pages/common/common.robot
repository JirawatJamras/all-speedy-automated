*** Keywords ***
Open Browser And Go To Allspeedy DPS Website
    Open Browser               ${DPS_UAT_URL}    Chrome    options=add_experimental_option("detach", True)
    Maximize Browser Window

Open Browser And Go To Allspeedy B2C Website
    Open Browser               ${B2C_UAT_URL}    Chrome    options=add_experimental_option("detach", True)
    Maximize Browser Window

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