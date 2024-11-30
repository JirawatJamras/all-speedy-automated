*** Keywords ***
Verify Label Delivery List
    [Arguments]    ${export_to}    ${transport}    ${parcel_number}    ${pouch_number}
    ...            ${parcel_and_pouch_number}    ${date}    ${status}
    ${dps_txt_label_title_delivery_list}=    Replace String    ${dps_txt_label_title_delivery_list}    {title_export_to}    ${export_to}
    ${dps_txt_label_title_delivery_list}=    Replace String    ${dps_txt_label_title_delivery_list}    {title_transport}    ${transport}
    ${dps_txt_label_title_delivery_list}=    Replace String    ${dps_txt_label_title_delivery_list}    {title_parcel_number}    ${parcel_number}
    ${dps_txt_label_title_delivery_list}=    Replace String    ${dps_txt_label_title_delivery_list}    {title_pouch_number}    ${pouch_number}
    ${dps_txt_label_title_delivery_list}=    Replace String    ${dps_txt_label_title_delivery_list}    {title_parcel_and_pouch_number}    ${parcel_and_pouch_number}
    ${dps_txt_label_title_delivery_list}=    Replace String    ${dps_txt_label_title_delivery_list}    {title_date}    ${date}
    ${dps_txt_label_title_delivery_list}=    Replace String    ${dps_txt_label_title_delivery_list}    {title_status}    ${status}
    Wait Until Element Is Visible    ${dps_txt_label_title_delivery_list}    timeout=20s

Verify Data Delivery List
    [Arguments]    ${export_to}    ${transport}
    ...            ${date}    ${status}
    ${txt_value_delivery_list}=    Replace String    ${dps_txt_value_delivery_list}    {value_export_to}    ${export_to}
    ${txt_value_delivery_list}=    Replace String    ${txt_value_delivery_list}    {value_transport}    ${transport}
    ${txt_value_delivery_list}=    Replace String    ${txt_value_delivery_list}    {value_date}    ${date}
    ${txt_value_delivery_list}=    Replace String    ${txt_value_delivery_list}    {value_status}    ${status}
    Wait Until Element Is Visible    ${txt_value_delivery_list}    timeout=20s

Click Print Button By Data
    [Arguments]    ${export_to}    ${transport}
    ...            ${date}    ${status}
    ${dps_btn_print_delivery_list}=    Replace String    ${dps_btn_print_delivery_list}    {value_export_to}    ${export_to}
    ${dps_btn_print_delivery_list}=    Replace String    ${dps_btn_print_delivery_list}    {value_transport}    ${transport}
    ${dps_btn_print_delivery_list}=    Replace String    ${dps_btn_print_delivery_list}    {value_date}    ${date}
    ${dps_btn_print_delivery_list}=    Replace String    ${dps_btn_print_delivery_list}    {value_status}    ${status}
    common.Scroll Into View By Xpath    ${dps_btn_print_delivery_list}    true
    Click When Ready    ${dps_btn_print_delivery_list}   
    