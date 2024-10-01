*** Keywords ***
Click Add Button
    FOR    ${i}    IN RANGE    0    5
        common.Click When Ready    ${b2c_btn_add_call_car_pickup_page}
        ${isvisible}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${b2c_txt_parcel_pickup_schedule}    timeout=2s
        Run Keyword IF  '${isvisible}' == 'True'    Exit For Loop
    END

Verify Popup Parcel Pickup Schedule
    Wait Until Element is Visible    ${b2c_txt_parcel_pickup_schedule}

Verify Car Round Name Dropdown Was Disabled
    Element Should Be Disabled    ${b2c_cbo_car_round_name_call_car_pickup_page}

Select Parcel Type Dropdown
    [Arguments]    ${value}
    common.Click When Ready      ${b2c_btn_basic_parcel_type_car_pickup_page}
    common.Click When Ready    //div[@class='rc-virtual-list-holder-inner']//div[@title='${value}']

Verify Unselected Parcel Type In Dropdown
    [Arguments]    ${value}
    Wait Until Element Is Visible    ${b2c_cbo_parcel_type_call_car_pickup_page}    timeout=${DEFAULT_TIMEOUT}
    Element Should Contain    ${b2c_cbo_parcel_type_call_car_pickup_page}    ${value}

Verify Select Parcel Type In Dropdown
    [Arguments]    ${value}
    Wait Until Element Is Visible    ${b2c_cbo_parcel_type_call_car_pickup_page}    timeout=${DEFAULT_TIMEOUT}
    Element Should Contain    ${b2c_cbo_parcel_type_call_car_pickup_page}    ${value}

Verify Unselected Date Pickup Parcel
    [Arguments]    ${value}
    Wait Until Element Is Visible    ${b2c_btn_placeholder_date_pickup_in_add_popup}    timeout=${DEFAULT_TIMEOUT}
    ${placeholder}=    Get Element Attribute    ${b2c_btn_placeholder_date_pickup_in_add_popup}    placeholder
    Should Be Equal    ${placeholder}    ${value}

Select Date Pickup Parcel Future Date
    common.Click When Ready    ${b2c_cbo_pickup_parcel_date_in_add_popup}
    ${haveActiveDate}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${b2c_b2n_active_date_in_add_popup}    timeout=2s
    IF  '${haveActiveDate}' == 'True'
        ${selectedFutureDate}=    Get Element Attribute    (${b2c_b2n_active_date_in_add_popup})[1]    title
        Set Suite Variable    ${selectedFutureDate}    ${selectedFutureDate}
        common.Click When Ready    (${b2c_b2n_active_date_in_add_popup})[1]
    ELSE
        common.Click When Ready    ${b2c_btn_next_months_calendar_in_add_popup}
        ${selectedFutureDate}=    Get Element Attribute    (${b2c_b2n_active_date_in_add_popup})[1]    title
        Set Suite Variable    ${selectedFutureDate}    ${selectedFutureDate}
        common.Click When Ready    (${b2c_b2n_active_date_in_add_popup})[1]
    END

Verify Selected Date Pickup Parcel Future Date
    Wait Until Element Is Visible    ${b2c_cbo_pickup_parcel_date_in_add_popup}    timeout=${DEFAULT_TIMEOUT}
    ${value}=    Get Element Attribute    ${b2c_cbo_pickup_parcel_date_in_add_popup}    value
    Should Be Equal    ${value}    ${selectedFutureDate}

Select Date Pickup Parcel Previouse Date
    FOR    ${i}    IN RANGE    0    5
        common.Click When Ready    ${b2c_cbo_pickup_parcel_date_in_add_popup}
        ${isvisible}=    Run Keyword And Return Status    Wait Until Element Is Visible   ${b2c_txt_parcel_pickup_schedule}    timeout=2s
        Run Keyword IF  '${isvisible}' == 'True'    Exit For Loop
    END
    ${canClick}    Run Keyword And Return Status    common.Click When Ready    ${b2c_btn_previous_date_in_add_popup}
    Should Not Be True    ${canClick}

Verify Date Pickup Parcel Can Not Be Select Previouse Date
    [Arguments]    ${value}
    Wait Until Element Is Visible    ${b2c_tbl_pickup_parcel_calendar_in_add_popup}    timeout=${DEFAULT_TIMEOUT}
    common.Click When Ready    ${b2c_txt_pickup_parcel_date_in_add_popup}
    Verify Unselected Date Pickup Parcel    ${value}
 
Select Pickup Parcel Time
    [Arguments]    ${value}
    common.Click When Ready    ${b2c_cdo_pickup_parcel_time_in_add_popup}
    common.Click When Ready    //div[text()='${value}']

Verify Selected Pickup Parcel Time
    [Arguments]    ${value}
    Wait Until Element Is Visible    ${b2c_txt_pickup_parcel_time_selected_value_in_add_popup}    timeout=${DEFAULT_TIMEOUT}
    Element Should Contain    ${b2c_txt_pickup_parcel_time_selected_value_in_add_popup}    ${value}

Verify Unselected Pickup Parcel Time
    [Arguments]    ${value}
    Wait Until Element Is Visible    ${b2c_txt_pickup_parcel_time_selected_value_in_add_popup}    timeout=${DEFAULT_TIMEOUT}
    ${defaultValue}=    Get Text    ${b2c_txt_pickup_parcel_time_selected_value_in_add_popup}
    Should Be Equal    ${defaultValue}    ${value}

Click Clear Pickup Parcel Time Button
    Click Xpath By JavaScript    //strong[text()='เวลารถเข้ารับพัสดุ']/../../../..//span[@class='ant-select-clear']

Edit Pickup Parcel Time
    [Arguments]    ${value}
    common.Click When Ready    ${b2c_cdo_pickup_parcel_time_in_add_popup}
    ${caninput}=    Run Keyword And Return Status    Input Text    ${b2c_cdo_2_pickup_parcel_time_in_add_popup}    ${value}
    Should Not Be True    ${caninput}
    common.Click When Ready    ${b2c_cdo_pickup_parcel_time_in_add_popup}

Verify Can Not Edit Pickup Parcel Time
    [Arguments]    ${value}
    Wait Until Element Is Visible    ${b2c_txt_pickup_parcel_time_selected_value_in_add_popup}    timeout=${DEFAULT_TIMEOUT}
    Element Should Not Contain    ${b2c_txt_pickup_parcel_time_selected_value_in_add_popup}    ${value}

Click Save Button
    common.Click When Ready    ${b2c_btn_save_in_add_popup}

Verify Saved Popup Is Visible
    Wait Until Element Is Visible    ${b2c_txt_complete_save_information_car_pickup_page}

Verify Saved Information In Visible In List
    Wait Until Element Is Visible    ${b2c_txt_h5_special_round_car_pickup_page}
    Scroll Element Into View    ${b2c_txt_h5_special_round_car_pickup_page}
    Log    ${selectedFutureDate}
    Element Should Contain    (//h5[contains(text(),'${selectedFutureDate}')])[1]    ${selectedFutureDate}

Click Cancel Button On Parcel Pickup Schedule Popup
    common.Click When Ready    ${b2c_btn_cancel_in_add_popup}

Verify Asking Popup To Close Popup
    [Arguments]    ${text}
    Wait Until Element Is Visible    ${b2c_txt_asking_to_close_popup_in_add_popup}    timeout=${DEFAULT_TIMEOUT}
    Element Should Contain    ${b2c_txt_asking_to_close_popup_in_add_popup}    ${text}
    Wait Until Element Is Visible    ${b2c_btn_cancel_in_asking_to_close_popup}    timeout=${DEFAULT_TIMEOUT}
    Wait Until Element Is Visible    ${b2c_btn_confirm_in_asking_to_close_popup}

Click X Button On Parcel Pickup Schedule Popup
    common.Click When Ready    ${b2c_btn_x_in_add_popup}
