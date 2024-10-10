*** Keywords ***
Verify Check Receiving Cycle Page
    [Arguments]    ${title}    ${tab}
    dps_home_page.Verify Page Title    ${title}
    dps_home_page.Verify Tab Selected    ${tab}