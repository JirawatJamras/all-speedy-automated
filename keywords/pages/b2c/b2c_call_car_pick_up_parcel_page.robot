*** Keywords ***
Verify Call Car Pick Up Page
    [Arguments]    ${title}
    ${b2c_txt_call_pickup_parcel_pickup_page}=  Replace String   ${b2c_txt_call_pickup_parcel_pickup_page}   {value}   ${title}
    Sleep    5s
    Wait Until Element Is Visible    ${b2c_txt_call_pickup_parcel_pickup_page}    timeout=${DEFAULT_TIMEOUT}

Click Add Button
    FOR    ${i}    IN RANGE    0    5
        common.Click When Ready    ${b2c_btn_add_call_car_pickup_page}
        ${isvisible}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${b2c_txt_parcel_pickup_schedule}    timeout=5s
        Run Keyword IF  '${isvisible}' == 'True'    Exit For Loop
    END

Verify Popup Parcel Pickup Schedule
    Wait Until Element is Visible    ${b2c_txt_parcel_pickup_schedule}

Verify Car Round Name Dropdown Was Disabled
    Element Should Be Disabled    ${b2c_cbo_car_round_name_call_car_pickup_page}

Click Parcel Type Dropdown
    common.Click When Ready      ${b2c_btn_basic_parcel_type_car_pickup_page}

Select Parcel Type Dropdown
    [Arguments]    ${value}
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

Click Pickup Parcel Date Button
    common.Click When Ready    ${b2c_cbo_pickup_parcel_date_in_add_popup}

Select Date Pickup Parcel Future Date
    FOR    ${i}    IN RANGE    0    5
        ${isvisible}=    Run Keyword And Return Status    Wait Until Element Is Visible   //td[@title='${newDate}']    timeout=2s
        Run Keyword IF  '${isvisible}' == 'True'    Exit For Loop
        common.Click When Ready    ${b2c_btn_next_months_calendar_in_add_popup}
    END
    common.Click When Ready    //td[@title='${newDate}']

Verify Selected Date Pickup Parcel Future Date
    Wait Until Element Is Visible    ${b2c_cbo_pickup_parcel_date_in_add_popup}    timeout=${DEFAULT_TIMEOUT}
    ${value}=    Get Element Attribute    ${b2c_cbo_pickup_parcel_date_in_add_popup}    value
    Should Be Equal    ${value}    ${newDate}

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
 
Click Pickup Parcel Time Button
    common.Click When Ready    ${b2c_cdo_pickup_parcel_time_in_add_popup}

Select Pickup Parcel Time
    [Arguments]    ${value}
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
    [Arguments]    ${data}
    Wait Until Element Is Visible    //*[@id="scrollableDiv"]/div/div/div/div[1]/div/div/div/div[1]
    Element Should Contain    //*[@id="scrollableDiv"]/div/div/div/div[1]/div/div/div/div[1]    ${newDate}

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

Click Confirm To Close Parcel Pickup Schedule Popup Button
    common.Click When Ready    ${b2c_btn_confirm_in_asking_to_close_popup}

Verify Website Never Save Sender Information
    [Arguments]    ${data}
    Wait Until Element Is Visible    //*[@id="scrollableDiv"]/div/div/div/div[1]/div/div/div/div[1]
    Element Should Not Contain    //*[@id="scrollableDiv"]/div/div/div/div[1]/div/div/div/div[1]    ${newDate}

Get The Highest Displayed Date And Set New Highest Date
    Wait Until Element Is Visible    //*[@id="scrollableDiv"]/div/div/div/div[1]/div/div/div/div[1]
    ${titleName}=    Get Text    //*[@id="scrollableDiv"]/div/div/div/div[1]/div/div/div/div[1]//div[@class='ant-card-meta-title']//h5
    ${highestDisplayedDate}=    Split String And Select    ${titleName}    ${SPACE}    1
    ${parts}=    Split String    ${highestDisplayedDate}    -
    ${day}=    Set Variable    ${parts}[0]
    ${month}=    Set Variable    ${parts}[1]
    ${year}=    Set Variable    ${parts}[2]
    ${day}=    Convert To Integer    ${day}
    ${nextDay}=    Evaluate    ${day} + 1
    ${day}    Convert To String    ${nextDay}
    ${digit}=     Get Length    ${day}
    IF    '${digit}' == '1'
        ${day}=    Set Variable    0${day}
    END
    ${newDate}=    Set Variable    ${day}-${month}-${year}
    Set Suite Variable    ${newDate}    ${newDate}

Delete The Lastest Parcel Pickup Schedule
    common.Click When Ready    //*[@id="scrollableDiv"]/div/div/div/div[1]/div/div/div/div[1]//span[@aria-label='delete']
    common.Click When Ready    //button[text()=' ยืนยัน']
    Wait Until Element Is Visible    ${b2c_txt_delete_complete_pickup_page}    timeout=${DEFAULT_TIMEOUT}

Click Select Item On Parcel Pickup Schedule List
    common.Click When Ready    //*[@id="scrollableDiv"]/div/div/div/div[1]/div/div/div/div[1]

Verify Information Detail Popup of Parcel Pickup Schedule
    Wait Until Element Is Visible    ${b2c_txt_pickup_parcel_schedule_in_detail_popup}    timeout=${DEFAULT_TIMEOUT}

Verify Information Detail Popup of Select Pickup Booking List
    Wait Until Element Is Visible    ${b2c_txt_select_pickup_booking_list_in_detail_popup}    timeout=${DEFAULT_TIMEOUT}

Verify Pickup Parcel Schedule Page
    Wait Until Element Is Visible    ${b2c_txt_call_pickup_parcel_pickup_page}    timeout=${DEFAULT_TIMEOUT}
    Wait Until Element Is Visible    ${b2c_txt_pickup_parcel_schedule_pickup_page}    timeout=${DEFAULT_TIMEOUT}
    Wait Until Element Is Visible    ${b2c_btn_add_call_car_pickup_page}    timeout=${DEFAULT_TIMEOUT}

Click Open Filter
    common.Click When Ready    ${b2c_btc_filter_pickup_page}
   
Click Close Filter
    FOR    ${i}    IN RANGE    0    5
        common.Click When Ready    ${b2c_btc_filter_pickup_page}
        ${isvisible}=    Run Keyword And Return Status    Wait Until Element Is Not Visible    ${b2c_txt_pickup_date_in_filter}    timeout=2s
        Run Keyword IF  '${isvisible}' == 'True'    Exit For Loop
    END

Verify Open Filter Section
    Wait Until Element Is Visible    ${b2c_txt_pickup_date_in_filter}    timeout=${DEFAULT_TIMEOUT}
    Wait Until Element Is Visible    ${b2c_btn_search_in_filter}    timeout=${DEFAULT_TIMEOUT}
    Wait Until Element Is Visible    //*[@id="scrollableDiv"]/div/div/div/div[1]/div/div/div/div[1]    timeout=${DEFAULT_TIMEOUT}

Verify Close Filter Section
    Wait Until Element Is Not Visible    ${b2c_txt_pickup_date_in_filter}    timeout=${DEFAULT_TIMEOUT}
    Wait Until Element Is Not Visible    ${b2c_btn_search_in_filter}    timeout=${DEFAULT_TIMEOUT}
    Wait Until Element Is Visible    //*[@id="scrollableDiv"]/div/div/div/div[1]/div/div/div/div[1]    timeout=${DEFAULT_TIMEOUT}