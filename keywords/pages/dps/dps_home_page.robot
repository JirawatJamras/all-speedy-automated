<<<<<<< HEAD
*** Keywords ***
Verify Parcels Into The Warehouse
    Verify Parcels Into The Warehouse Store    ${daily_work_overview.parcel_into_warehouse['store']}
    Verify Parcels Into The Warehouse House    ${daily_work_overview.parcel_into_warehouse['house']}
    Verify Parcels Into The Warehouse Warehouse    ${daily_work_overview.parcel_into_warehouse['warehouse']}
    Verify Admission Task    ${daily_work_overview.parcel_into_warehouse['admission']}

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
=======
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
    ${sum_number}    Re Format And Sum Number of Admission Task    ${into_warehouse_store_number}    ${into_warehouse_house_number}    ${into_warehouse_warehouse_number}
    Element Should Be Visible    ${dps_txt_admission_task_number_home_page}    ${sum_number}

Re Format And Sum Number of Admission Task
    [Arguments]    ${number1}    ${number2}    ${number3}
    ${number1}=    Convert To Integer    ${number1}
    ${number2}=    Convert To Integer    ${number2}
    ${number3}=    Convert To Integer    ${number3}
    ${sum_number}=    Set Variable    ${number1}    +    ${number2}    +    ${number3}
    ${sum_number}=    Convert To String    ${sum_number}
    RETURN     ${sum_number}

Re Format And Sum Number of Export Work
    [Arguments]    ${number1}    ${number2}    ${number3}    ${number4}    ${number5}
    ${number1}=    Convert To Integer    ${number1}
    ${number2}=    Convert To Integer    ${number2}
    ${number3}=    Convert To Integer    ${number3}
    ${number4}=    Convert To Integer    ${number4}
    ${number5}=    Convert To Integer    ${number5}
    ${sum_number}=    Set Variable    ${number1}    +    ${number2}    +    ${number3}    +    ${number4}    +    ${number5}
    ${sum_number}=    Convert To String    ${sum_number}
    RETURN     ${sum_number}

Re Format And Sum Number of Delivery Work
    [Arguments]    ${number1}    ${number2}    ${number3}
    ${number1}=    Convert To Integer    ${number1}
    ${number2}=    Convert To Integer    ${number2}
    ${number3}=    Convert To Integer    ${number3}
    ${sum_number}=    Set Variable    ${number1}    +    ${number2}    +    ${number3}
    ${sum_number}=    Convert To String    ${sum_number}
    RETURN     ${sum_number}

Re Format And Sum Number of In Warehouse Parcels
    [Arguments]    ${number1}    ${number2}
    ${number1}=    Convert To Integer    ${number1}
    ${number2}=    Convert To Integer    ${number2}
    ${sum_number}=    Set Variable    ${number1}    +    ${number2}
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

Verify In Warehouse Parcels
    [Arguments]    ${test_scenario}
    Verify Export Work Of CP All    ${${test_scenario}}.daily_work_overview.in_warehouse_parcels.export_work['cap_all']}
    Verify Export Work Of J&T    ${${test_scenario}}.daily_work_overview.in_warehouse_parcels.export_work['j&t']}
    Verify Export Work Of DHL    ${${test_scenario}}.daily_work_overview.in_warehouse_parcels.export_work['dhl']}
    Verify Export Work Of Flash    ${${test_scenario}}.daily_work_overview.in_warehouse_parcels.export_work['flash']}
    Verify Export Work Of Kerry    ${${test_scenario}}.daily_work_overview.in_warehouse_parcels.export_work['kerry']}
    Verify Sum number of Export Work
    Verify Delivery Work Of Store    ${${test_scenario}}.daily_work_overview.in_warehouse_parcels.delivery_work['store']}
    Verify Delivery Work Of House    ${${test_scenario}}.daily_work_overview.in_warehouse_parcels.delivery_work['house']}
    Verify Delivery Work Of 7 Delivery    ${${test_scenario}}.daily_work_overview.in_warehouse_parcels.delivery_work['7_delivery']}
    Verify Sum Number of Delivery Work
    Verify Sum Number of In Warehouse Parcels

Verify Export Work Of CP All
    [Arguments]    ${value}
    Wait Until Element Is Visible    ${dps_txt_parcels_in_warehouse_home_page}    timeout=10s
    Element Should Be Visible    ${dps_txt_parcels_in_warehouse_home_page}    ${value}
    ${number}    Get Text    //strong[text()='CP All (ชิ้น)']/../../..//span[contains(@class,'font-bold')]
    Set Suite Variable    ${cp_all_number}    ${number}

Verify Export Work Of J&T
    [Arguments]    ${value}
    Wait Until Element Is Visible    ${dps_txt_parcels_in_warehouse_home_page}    timeout=10s
    Element Should Be Visible    ${dps_txt_parcels_in_warehouse_home_page}    ${value}
    ${number}    Get Text    //strong[text()='J&T (ชิ้น)']/../../..//span[contains(@class,'font-bold')]
    Set Suite Variable    ${j&t_number}    ${number}

Verify Export Work Of DHL
    [Arguments]    ${value}
    Wait Until Element Is Visible    ${dps_txt_parcels_in_warehouse_home_page}    timeout=10s
    Element Should Be Visible    ${dps_txt_parcels_in_warehouse_home_page}    ${value}
    ${number}    Get Text    //strong[text()='DHL (ชิ้น)']/../../..//span[contains(@class,'font-bold')]
    Set Suite Variable    ${dhl_number}    ${number}

Verify Export Work Of Flash
    [Arguments]    ${value}
    Wait Until Element Is Visible    ${dps_txt_parcels_in_warehouse_home_page}    timeout=10s
    Element Should Be Visible    ${dps_txt_parcels_in_warehouse_home_page}    ${value}
    ${number}    Get Text    //strong[text()='Flash (ชิ้น)']/../../..//span[contains(@class,'font-bold')]
    Set Suite Variable    ${flash_number}    ${number}

Verify Export Work Of Kerry
    [Arguments]    ${value}
    Wait Until Element Is Visible    ${dps_txt_parcels_in_warehouse_home_page}    timeout=10s
    Element Should Be Visible    ${dps_txt_parcels_in_warehouse_home_page}    ${value}
    ${number}    Get Text    //strong[text()='Kerry (ชิ้น)']/../../..//span[contains(@class,'font-bold')]
    Set Suite Variable    ${kerry_number}    ${number}

Verify Sum number of Export Work
    ${sum_number_export_work}    Re Format And Sum Number of Export Work    ${cp_all_number}    ${j&t_number}    ${dhl_number}    ${flash_number}    ${kerry_number}
    Element Should Be Visible    ${dps_txt_parcels_in_warehouse_home_page}    ${sum_number_export_work}
    Set Suite Variable    ${sum_number_export_work}    ${sum_number_export_work}

Verify Delivery Work Of Store
    [Arguments]    ${value}
    Wait Until Element Is Visible    ${dps_txt_parcels_in_warehouse_home_page}    timeout=10s
    Element Should Be Visible    ${dps_txt_parcels_in_warehouse_home_page}    ${value}
    ${number}    Get Text    //div[@class='ant-col ant-col-14 css-1x1kih3']//strong[text()='ร้าน (ชิ้น)']/../../..//span[contains(@class,'font-bold')]
    Set Suite Variable    ${in_warehouse_parcels_store_number}    ${number}

Verify Delivery Work Of House
    [Arguments]    ${value}
    Wait Until Element Is Visible    ${dps_txt_parcels_in_warehouse_home_page}    timeout=10s
    Element Should Be Visible    ${dps_txt_parcels_in_warehouse_home_page}    ${value}
    ${number}    Get Text    //div[@class='ant-col ant-col-14 css-1x1kih3']//strong[text()='บ้าน (ชิ้น)']/../../..//span[contains(@class,'font-bold')]
    Set Suite Variable    ${in_warehouse_parcels_house_number}    ${number}

Verify Delivery Work Of 7 Delivery
    [Arguments]    ${value}
    Wait Until Element Is Visible    ${dps_txt_parcels_in_warehouse_home_page}    timeout=10s
    Element Should Be Visible    ${dps_txt_parcels_in_warehouse_home_page}    ${value}
    ${number}    Get Text    //div[@class='ant-col ant-col-14 css-1x1kih3']//strong[text()='7 Delivery (ชิ้น)']/../../..//span[contains(@class,'font-bold')]
    Set Suite Variable    ${in_warehouse_parcels_7_delivery_number}    ${number}

Verify Sum Number of Delivery Work
    ${sum_number_delivery_work}    Re Format And Sum Number of Delivery Work    ${in_warehouse_parcels_store_number}    ${in_warehouse_parcels_house_number}    ${in_warehouse_parcels_7_delivery_number}
    Element Should Be Visible    ${dps_txt_parcels_in_warehouse_home_page}    ${sum_number_delivery_work}
    Set Suite Variable    ${sum_number_delivery_work}    ${sum_number_delivery_work}

Verify Sum Number of In Warehouse Parcels
    ${sum_number_in_warehouse_parcels}    Re Format And Sum Number of In Warehouse Parcels    ${sum_number_export_work}    ${sum_number_delivery_work}
    Element Should Be Visible    ${dps_txt_parcels_in_warehouse_home_page}    ${sum_number_in_warehouse_parcels}
>>>>>>> parent of e66efd4 (feat/AllSpeedy_DPS_003_ID_10)
