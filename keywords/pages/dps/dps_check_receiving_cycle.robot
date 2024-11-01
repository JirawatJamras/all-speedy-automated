*** Keywords ***
Verify Check Receiving Cycle Page
    [Arguments]    ${title}    ${tab}    ${company_name}    ${branch}    ${address}    ${sub_district}    ${district}    ${province}
    ...    ${postcode}    ${receiving_time}    ${receiving_type}    ${courier}    ${number_of_parcel}    ${status}
    Wait Until Element Is Not Visible    ${dps_img_loading}    timeout=${DEFAULT_TIMEOUT}
    dps_home_page.Verify Page Title    ${title}
    dps_home_page.Verify Tab Selected    ${tab}

    ${tomorrow}    dps_home_page.Set Tomorrow Date
    Wait Until Element Is Visible    ${dps_txt_receiving_cycle_list}    timeout=${DEFAULT_TIMEOUT}
    ${receiving_count}=    Get Element Count    ${dps_txt_receiving_cycle_list}
    FOR    ${index}    IN RANGE    1    ${receiving_count} + 1
        ${item}=    Set Variable    (${dps_txt_receiving_cycle_list})[${index}]
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
        ${all_conditions}=    Evaluate    ${name_status} and ${branch_status} and ${address_status} and ${sub_district_status} and ${district_status} and ${province_status} and ${postcode_status} and ${next_day_status} and ${receiving_time_status} and ${receiving_type_status} and ${courier_status} and ${number_of_parcel_status} and ${status_status}
        Set Suite Variable    ${card}    ${item}//button
        Exit For Loop If    ${all_conditions}
    END
    
Select Waiting Inventory Confirm List Tab
    common.Scroll Window To Vertical    0
    ${dps_tab_name}=  Replace String   ${dps_tab_name}   {value}   ${dc_operation.Check_Receiving_Cycle_Tab['waiting_inventory_confirm_list']}
    Click When Ready    ${dps_tab_name}

Verify Inventory Confirm List Tab
    [Arguments]    ${title}    ${tab}    ${company_name}    ${address}    ${sub_district}    ${district}    ${province}    ${postcode}
    ...        ${receiving_time}    ${receiving_type}    ${courier}    ${number_of_parcel}    ${status}
    
    Wait Until Element Is Not Visible    ${dps_img_loading}    timeout=${DEFAULT_TIMEOUT}
    dps_home_page.Verify Page Title    ${title}
    dps_home_page.Verify Tab Selected    ${tab}
    
    ${tomorrow}    dps_home_page.Set Tomorrow Date
    Wait Until Element Is Visible    ${dps_txt_receiving_cycle_list}    timeout=${DEFAULT_TIMEOUT}
    ${receiving_count}=    Get Element Count    ${dps_txt_receiving_cycle_list}
    FOR    ${index}    IN RANGE    1    ${receiving_count} + 1
        ${item}=    Set Variable    (${dps_txt_receiving_cycle_list})[${index}]
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
        ${all_conditions}=    Evaluate    ${name_status} and ${address_status} and ${sub_district_status} and ${district_status} and ${province_status} and ${postcode_status} and ${next_day_status} and ${receiving_time_status} and ${receiving_type_status} and ${courier_status} and ${number_of_parcel_status} and ${status_status}
        Set Suite Variable    ${card_inventory}    ${item}//button
        Exit For Loop If    ${all_conditions}
    END

Click Pencil Icon
    Click When Ready    ${card_inventory}

Verify Parcel Pickup Details Popup
    [Arguments]    ${parcel_pickup_details}    ${btn_export}   ${vehicle_type}
    ${dps_txt_parcel_pickup_detail}=  Replace String   ${dps_txt_parcel_pickup_detail}   {value}   ${parcel_pickup_details}
    ${dps_btn_parcel_pickup_details}=  Replace String   ${dps_btn_parcel_pickup_details}   {value}   ${btn_export}
    ${dps_cbo_vehicle_type}=  Replace String   ${dps_cbo_vehicle_type}   {value}   ${vehicle_type}
    
    Wait Until Element Is Visible    ${dps_txt_parcel_pickup_detail}    timeout=${DEFAULT_TIMEOUT}
    Wait Until Element Is Visible    ${dps_btn_parcel_pickup_details}    timeout=${DEFAULT_TIMEOUT}
    Wait Until Element Is Visible    ${dps_cbo_vehicle_type}    timeout=${DEFAULT_TIMEOUT}

Click Export Button On Parcel Pickup Details Popup
    ${dps_btn_parcel_pickup_details}=  Replace String   ${dps_btn_parcel_pickup_details}   {value}   ${dc_operation['button_export']}
    Scroll Element Into View    ${dps_btn_parcel_pickup_details}
    Click When Ready    ${dps_btn_parcel_pickup_details}

Click Approve Button On Parcel Pickup Details Popup
    ${dps_btn_parcel_pickup_details}=  Replace String   ${dps_btn_parcel_pickup_details}   {value}   ${dc_operation['button_approve']}
    Scroll Element Into View    ${dps_btn_parcel_pickup_details}
    Click When Ready    ${dps_btn_parcel_pickup_details}

Verify parcel pickup schedule change status to confirm
    [Arguments]    ${title}    ${tab}    ${company_name}    ${branch}    ${address}    ${sub_district}    ${district}    ${province}
    ...    ${postcode}    ${receiving_time}    ${receiving_type}    ${courier}    ${number_of_parcel}    ${status}
    Reload Page
    Scroll Window To Vertical    0
    Wait Until Element Is Not Visible    ${dps_img_loading}    timeout=${DEFAULT_TIMEOUT}
    dps_home_page.Verify Page Title    ${title}
    dps_home_page.Verify Tab Selected    ${tab}
    ${next_day}    dps_home_page.Set_Next_DAY
    ${today}    dps_home_page.Set_ToDAY
    Wait Until Element Is Visible    ${dps_txt_receiving_cycle_list}    timeout=${DEFAULT_TIMEOUT}
    ${receiving_count}=    Get Element Count    ${dps_txt_receiving_cycle_list}
    FOR    ${index}    IN RANGE    1    ${receiving_count} + 1
        ${item}=    Set Variable    (${dps_txt_receiving_cycle_list})[${index}]
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
        ${update_date}=    Run Keyword And Return Status    Element Should Contain    ${item}//td[13]    ${today}
        ${status_status}=    Run Keyword And Return Status    Element Should Contain    ${item}//td[14]    ${status}
        ${all_conditions}=    Evaluate    ${name_status} and ${branch_status} and ${address_status} and ${sub_district_status} and ${district_status} and ${province_status} and ${postcode_status} and ${next_day_status} and ${receiving_time_status} and ${receiving_type_status} and ${courier_status} and ${number_of_parcel_status} and ${update_date} and ${status_status}
        Exit For Loop If    ${all_conditions}
    END
