*** Variables ***
${dps_btn_filter_history_parcel_page}    //div[text()='{value}']/..
${dps_btn_search_filter_history_parcel_page}    //div[text()='{value}']/..

${dps_txtbox_fitler_parcel_number_history_parcel_page}    //input[@id='parcelCode']

${dps_txt_title_history_parcel_history_parcel_page}    //strong[text()='{value}']

${dps_tbl_history_parcel_history_parcel_page}    //tbody[@class='ant-table-tbody']//tr[contains(@class,'ant-table-row')]
${dps_tbl_data_history_parcel_history_parcel_page}    //tbody[@class='ant-table-tbody']//td[text()='{value}']