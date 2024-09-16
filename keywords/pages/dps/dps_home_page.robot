*** Keywords ***
Select DPS Menu
    [Arguments]    ${tabname}
    Wait Until Element Is Not Visible    ${dps_btn_log_on}    30s
    Wait Until Element Is Visible    //a[@href='/${tabname}']
    Mouse Over    //a[@href='/${tabname}']
    Wait Until Element Is Visible    //a[@href='/${tabname}']
    Click Element    //a[@href='/${tabname}']
    Mouse Out    //a[@href='/${tabname}']

Verify Parcels Into The Warehouse
    [Arguments]    ${test_scenario}
    Verify Parcels Into The Warehouse Store    ${${test_scenario}}.daily_work_overview.parcel_into_warehouse['store']}
    Verify Parcels Into The Warehouse House    ${${test_scenario}.daily_work_overview.parcel_into_warehouse['house']}
    Verify Parcels Into The Warehouse Warehouse    ${${test_scenario}.daily_work_overview.parcel_into_warehouse['warehouse']}
    Verify Admission Task    ${${test_scenario}.daily_work_overview.parcel_into_warehouse['admission']}

Verify Parcels Into The Warehouse Store
    [Arguments]    ${value}
    Wait Until Element Is Visible    ${dps_txt_parcel_into_warehouse_store_home_page}    timeout=10s
    Element Should Be Visible    ${dps_txt_parcel_into_warehouse_store_home_page}    ${value}
    ${number}    Get Text    //div[@class='ant-col ant-col-5 css-1x1kih3']//div[contains(@class,'ant-col bg-white')][1]//div[contains(@class,'h-2/3')]
    Set Suite Variable    ${into_warehouse_store_number}    ${number}

Verify Parcels Into The Warehouse House
    [Arguments]    ${value}
    Wait Until Element Is Visible    ${dps_txt_parcel_into_warehouse_house_home_page}    timeout=10s
    Element Should Be Visible    ${dps_txt_parcel_into_warehouse_house_home_page}    ${value}
    ${number}    Get Text    //div[@class='ant-col ant-col-5 css-1x1kih3']//div[contains(@class,'ant-col bg-white')][2]//div[contains(@class,'h-2/3')]
    Set Suite Variable    ${into_warehouse_house_number}    ${number}

Verify Parcels Into The Warehouse Warehouse
    [Arguments]    ${value}
    Wait Until Element Is Visible    ${dps_txt_parcel_into_warehouse_warehouse_home_page}    timeout=10s
    Element Should Be Visible    ${dps_txt_parcel_into_warehouse_warehouse_home_page}    ${value}
    ${number}    Get Text    //div[@class='ant-col ant-col-5 css-1x1kih3']//div[contains(@class,'ant-col bg-white')][3]//div[contains(@class,'h-2/3')]
    Set Suite Variable    ${into_warehouse_warehouse_number}    ${number}

Verify Admission Task
    [Arguments]    ${value}
    Wait Until Element Is Visible    ${dps_txt_admission_task_home_page}
    Element Should Be Visible    ${dps_txt_admission_task_home_page}    ${value}
    ${sum_number}    Re Format And Sum Number    ${into_warehouse_store_number}    ${into_warehouse_house_number}    ${into_warehouse_warehouse_number}
    Element Should Be Visible    ${dps_txt_admission_task_number_home_page}    ${sum_number}

Re Format And Sum Number
    [Arguments]    ${number1}    ${number2}    ${number3}
    ${number1}=    Convert To Integer    ${number1}
    ${number2}=    Convert To Integer    ${number2}
    ${number3}=    Convert To Integer    ${number3}
    ${sum_number}=    Set Variable    ${number1}    +    ${number2}    +    ${number3}
    ${sum_number}=    Convert To String    ${sum_number}
    RETURN     ${sum_number}

Verify Current Date
    Sleep    3s
    Wait Until Element Is Visible    ${dps_txt_date}    180s
    ${Web_Date}    Get Text    ${dps_txt_date}  
    ${Web_Date}    Split String And Select    ${Web_Date}    ${space}    3
    ${current_date}    Get Current DateTime Thai Format
    Should Be Equal    ${Web_Date}    ${current_date}

Split String And Select
    [Arguments]    ${value}    ${separator}   ${index}
    ${value} =    Split String    ${value}    ${separator}
    ${value} =    Set Variable    ${value}[${index}]
    RETURN    ${value}

Get Current DateTime Thai Format
    ${current_date} =    Get Current Date    result_format=%d/%m/%Y
    ${day}    Split String And Select    ${current_date}    /    0
    ${month}    Split String And Select    ${current_date}    /    1
    ${year}    Split String And Select    ${current_date}    /    2
    ${year} =    Evaluate    int(${year}) + 543
    ${year} =    Convert To String    ${year}
    ${current_date}    Catenate    SEPARATOR=/    ${day}    ${month}    ${year}
    RETURN    ${current_date}
