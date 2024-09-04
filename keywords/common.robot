*** Keywords ***
Open Browser And Go To Allspeedy Website
    Open Browser    ${DPS_UAT_URL}    Chrome    options=add_experimental_option("detach", True)
    Maximize Browser Window

Open URL
    [Arguments]    ${url}
    Go To    ${url}