*** Keywords ***
Filter Data By Parcel Number
    [Arguments]    ${parcel_number}
    Select Filter Button
    common.Input When Ready    ${dps_txtbox_fitler_parcel_number_history_parcel_page}    ${parcel_number}
    Click Search Button On Filter
    Select Filter Button

Select Filter Button
    ${dps_btn_filter}=    Replace String    ${dps_btn_filter_history_parcel_page}    {value}    ${dc_operation['button_filter']}
    common.Click When Ready    ${dps_btn_filter}

Click Search Button On Filter
    ${dps_btn_search_filter}=    Replace String    ${dps_btn_search_filter_history_parcel_page}    {value}    ${dc_operation['button_search']}
    common.Click When Ready    ${dps_btn_search_filter}

Verify Data In Table
    [Arguments]    ${parcel_number}
    ${dps_txt_title_history_parcel}=    Replace String    ${dps_txt_title_history_parcel_history_parcel_page}    {value}    ${dc_operation.title['history_parcel']}
    Wait Until Element Is Visible    ${dps_txt_title_history_parcel}    timeout=${DEFAULT_TIMEOUT}
    Wait Until Element Is Visible    ${dps_tbl_history_parcel_history_parcel_page}
    ${dps_tbl_data_history_parcel}=    Replace String    ${dps_tbl_data_history_parcel_history_parcel_page}    {value}    ${parcel_number}
    Element Should Be Visible    ${dps_tbl_data_history_parcel}
