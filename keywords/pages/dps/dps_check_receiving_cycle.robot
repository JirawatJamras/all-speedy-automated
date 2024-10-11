*** Keywords ***
Verify Check Receiving Cycle Page
    [Arguments]    ${title}    ${tab}    ${company_name}    ${branch}    ${address}    ${sub_district}    ${district}    ${province}
    ...    ${postcode}    ${receiving_time}    ${receiving_type}    ${courier}    ${number_of_parcel}    ${status}
    dps_home_page.Verify Page Title    ${title}
    dps_home_page.Verify Tab Selected    ${tab}
    ${next_day}    dps_home_page.Set_Next_DAY
    ${receiving_count}=    Get Element Count    ${dps_txt_receiving_cycly_list}
    FOR    ${index}    IN RANGE    1    ${receiving_count} + 1
        ${item}=    Set Variable    (${dps_txt_receiving_cycly_list})[${index}]
        Wait Until Element Is Visible    ${item}    timeout=${DEFAULT_TIMEOUT}
        Scroll Element Into View    ${item}
        Register Keyword To Run On Failure    NOTHING
        ${name_status}=    Run Keyword And Return Status    Element Should Contain    ${item}//td[text()]    ${company_name}
        ${branch_status}=    Run Keyword And Return Status    Element Should Contain    ${item}//td[2]    ${branch}
        ${address_status}=    Run Keyword And Return Status    Element Should Contain    ${item}//td[3]    ${address}
        ${sub_district_status}=    Run Keyword And Return Status    Element Should Contain    ${item}//td[4]    ${sub_district}
        ${district_status}=    Run Keyword And Return Status    Element Should Contain    ${item}//td[5]    ${district}
        ${province_status}=    Run Keyword And Return Status    Element Should Contain    ${item}//td[6]    ${province}
        ${postcode_status}=    Run Keyword And Return Status    Element Should Contain    ${item}//td[7]    ${postcode}
        ${next_day_status}=    Run Keyword And Return Status    Element Should Contain    ${item}//td[8]    ${next_day}
        ${receiving_time_status}=    Run Keyword And Return Status    Element Should Contain    ${item}//td[9]    ${receiving_time}
        ${receiving_type_status}=    Run Keyword And Return Status    Element Should Contain    ${item}//td[10]    ${receiving_type}
        ${courier_status}=    Run Keyword And Return Status    Element Should Contain    ${item}//td[11]    ${courier}
        ${number_of_parcel_status}=    Run Keyword And Return Status    Element Should Contain    ${item}//td[12]    ${number_of_parcel}
        ${status_status}=    Run Keyword And Return Status    Element Should Contain    ${item}//td[14]    ${status}
        Log To console    ${index}
        ${all_conditions}=    Evaluate    ${name_status} and ${branch_status} and ${address_status} and ${sub_district_status} and ${district_status} and ${province_status} and ${postcode_status} and ${next_day_status} and ${receiving_time_status} and ${receiving_type_status} and ${courier_status} and ${number_of_parcel_status} and ${status_status}
        Set Suite Variable    ${card}    ${item}//button
        Log To console    ${all_conditions}
        Exit For Loop If    ${all_conditions}
    END
    
Select Check Receiving Cycle Tab
    [Arguments]    ${name}
    common.Scroll Window To Vertical    0
    ${dps_tab_name}=  Replace String   ${dps_tab_name}   {value}   ${name}
    Click When Ready    ${dps_tab_name}

Verify Inventory Confirm List Tab
    [Arguments]    ${title}    ${tab}    ${company_name}    ${address}    ${sub_district}    ${district}    ${province}    ${postcode}
    ...        ${receiving_time}    ${receiving_type}    ${courier}    ${number_of_parcel}    ${status}
    dps_home_page.Verify Page Title    ${title}
    dps_home_page.Verify Tab Selected    ${tab}
    ${next_day}    dps_home_page.Set_Next_DAY
    ${receiving_count}=    Get Element Count    ${dps_txt_receiving_cycly_list}
    FOR    ${index}    IN RANGE    1    ${receiving_count} + 1
        ${item}=    Set Variable    (${dps_txt_receiving_cycly_list})[${index}]
        Wait Until Element Is Visible    ${item}    timeout=${DEFAULT_TIMEOUT}
        Scroll Element Into View    ${item}
        Register Keyword To Run On Failure    NOTHING
        ${name_status}=    Run Keyword And Return Status    Element Should Contain    ${item}//td[text()]    ${company_name}
        ${address_status}=    Run Keyword And Return Status    Element Should Contain    ${item}//td[3]    ${address}
        ${sub_district_status}=    Run Keyword And Return Status    Element Should Contain    ${item}//td[4]    ${sub_district}
        ${district_status}=    Run Keyword And Return Status    Element Should Contain    ${item}//td[5]    ${district}
        ${province_status}=    Run Keyword And Return Status    Element Should Contain    ${item}//td[6]    ${province}
        ${postcode_status}=    Run Keyword And Return Status    Element Should Contain    ${item}//td[7]    ${postcode}
        ${next_day_status}=    Run Keyword And Return Status    Element Should Contain    ${item}//td[8]    ${next_day}
        ${receiving_time_status}=    Run Keyword And Return Status    Element Should Contain    ${item}//td[9]    ${receiving_time}
        ${receiving_type_status}=    Run Keyword And Return Status    Element Should Contain    ${item}//td[10]    ${receiving_type}
        ${courier_status}=    Run Keyword And Return Status    Element Should Contain    ${item}//td[11]    ${courier}
        ${number_of_parcel_status}=    Run Keyword And Return Status    Element Should Contain    ${item}//td[12]    ${number_of_parcel}
        ${status_status}=    Run Keyword And Return Status    Element Should Contain    ${item}//td[14]    ${status}
        Log To console    ${index}
        ${all_conditions}=    Evaluate    ${name_status} and ${address_status} and ${sub_district_status} and ${district_status} and ${province_status} and ${postcode_status} and ${next_day_status} and ${receiving_time_status} and ${receiving_type_status} and ${courier_status} and ${number_of_parcel_status} and ${status_status}
        Set Suite Variable    ${card}    ${item}//button
        Log To console    ${all_conditions}
        Exit For Loop If    ${all_conditions}
    END

Click Pencil Icon
    Click When Ready    ${card}

Verify Parcel Pickup Details Popup
    [Arguments]    ${parcel_pickup_details}    ${btn_export}   ${vehicle_type}
    ${dps_txt_parcel_pickup_detail}=  Replace String   ${dps_txt_parcel_pickup_detail}   {value}   ${parcel_pickup_details}
    ${dps_btn_parcel_pickup_details}=  Replace String   ${dps_btn_parcel_pickup_details}   {value}   ${btn_export}
    ${dps_cbo_vehicle_type}=  Replace String   ${dps_cbo_vehicle_type}   {value}   ${vehicle_type}
    
    Wait Until Element Is Visible    ${dps_txt_parcel_pickup_detail}    timeout=${DEFAULT_TIMEOUT}
    Wait Until Element Is Visible    ${dps_btn_parcel_pickup_details}    timeout=${DEFAULT_TIMEOUT}
    Wait Until Element Is Visible    ${dps_cbo_vehicle_type}    timeout=${DEFAULT_TIMEOUT}

Click Button On Parcel Pickup Details Popup
    [Arguments]    ${name}
    ${dps_btn_parcel_pickup_details}=  Replace String   ${dps_btn_parcel_pickup_details}   {value}   ${name}
    Scroll Element Into View    ${dps_btn_parcel_pickup_details}
    Click When Ready    ${dps_btn_parcel_pickup_details}
