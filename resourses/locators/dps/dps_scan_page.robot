*** Variables ***
${dps_txtbox_on_scan_in_page}    (//input[@placeholder='Search...'])[1]

${dps_btn_search_scan_in_page}    //span[text()='{value}']/../..//button
${dps_btn_scan_in_tab_is_active_scan_page}    //div[text()='{value}' and @aria-selected='true']

${dps_txt_scan_header_ion_scan_page}    //div[@class='ant-card-head-wrapper']//span[text()='{value}']