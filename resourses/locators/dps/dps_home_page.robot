*** Variables ***
${main_page}    xpath=//div[@id="__next"]/div/div[2]/div/main

${dps_txt_date}    //strong[contains(text(),'ข้อมูล ณ วันที่ ')]
${dps_txt_parcel_into_warehouse_store_home_page}    //div[@class='ant-col ant-col-5 css-1x1kih3']//div[contains(@class,'ant-col bg-white')][1]//div[contains(@class,'h-1/3')]
${dps_txt_parcel_into_warehouse_house_home_page}    //div[@class='ant-col ant-col-5 css-1x1kih3']//div[contains(@class,'ant-col bg-white')][2]//div[contains(@class,'h-1/3')]
${dps_txt_parcel_into_warehouse_warehouse_home_page}    //div[@class='ant-col ant-col-5 css-1x1kih3']//div[contains(@class,'ant-col bg-white')][3]//div[contains(@class,'h-1/3')]
${dps_txt_admission_task_home_page}    //*[@id="__next"]/div/div[2]/div/main/div/div[2]/div[2]/div[2]/div[1]/div/div/div/div[1]/div/div/span
${dps_txt_admission_task_number_home_page}  //div[@class='ant-col ant-col-5 css-1x1kih3'][1]//span[contains(@class,'ant-typography text-md xl:text-3xl font-extrabold')]
${dps_txt_parcels_in_warehouse_home_page}    //div[@class='ant-col ant-col-14 css-1x1kih3']
${dps_txt_daily_task_overview_home_page}    //div[@class='ant-card-head-title']//strong[text()='{value}']
${dps_txt_breadcrumb_home_page}    //span[@class='ant-breadcrumb-link' and text()='{value}']
${dps_txt_list_first_all_task_home_page}    (//tbody[@class='ant-table-tbody']//td[text()='{task_type}']/..//td[text()='{parcel_owner}']/..//td[text()='{import_from}']/..//td[text()='{export_to}']/..//td[text()='{transport}']/..//td[text()='{pouch_number}']/..//td[text()='{parcel_number}']/..//h1[contains(text(),'{parcel_status}')]/../../..)[1]
${dps_txt_list_first_import_task_home_page}    (//tbody[@class='ant-table-tbody']//td[text()='{import_from}']/..//td[text()='{transport}']/..//td[text()='{parcel_owner}']/..//td[text()='{number_of_pouch}']/..//td[5]/..//td[6]/..)[1]
${dps_txt_list_first_export_task_home_page}    (//tbody[@class='ant-table-tbody']//td[text()='{export_to}']/..//td[text()='{transport}']/..//td[text()='{parcel_owner}']/..//td[text()='{number_of_pouch}']/..//td[text()='{number_of_pieces}']/..//td[text()='{number_of_scanned_items}']/..)[1]
${dps_txt_list_first_send_task_home_page}    (//tbody[@class='ant-table-tbody']//td[text()='{send_to}']/..//td[text()='{store_code}']/..//td[text()='{transport}']/..//td[text()='{number_of_pouch}']/..//td[5]/..//td[6]/..)[1]
${dps_txt_page_title}    //div[@class='ant-card-head-title']//strong[text()='{value}']
${dps_txt_role_user}    /../..//strong[text()='{value}']
${dps_txt_task_type_in_all_task_tab_home_page}    (//div[@id='rc-tabs-1-panel-1']//thead[@class='ant-table-thead']//th[@class='ant-table-cell'])[1]
${dps_txt_parcel_owner_in_all_task_tab_home_page}    (//div[@id='rc-tabs-1-panel-1']//thead[@class='ant-table-thead']//th[@class='ant-table-cell'])[2]
${dps_txt_import_from_in_all_task_tab_home_page}    (//div[@id='rc-tabs-1-panel-1']//thead[@class='ant-table-thead']//th[@class='ant-table-cell'])[3]
${dps_txt_export_to_in_all_task_tab_home_page}    (//div[@id='rc-tabs-1-panel-1']//thead[@class='ant-table-thead']//th[@class='ant-table-cell'])[4]
${dps_txt_transport_in_all_task_tab_home_page}    (//div[@id='rc-tabs-1-panel-1']//thead[@class='ant-table-thead']//th[@class='ant-table-cell'])[5]
${dps_txt_pouch_number_in_all_task_tab_home_page}    (//div[@id='rc-tabs-1-panel-1']//thead[@class='ant-table-thead']//th[@class='ant-table-cell'])[6]
${dps_txt_parcel_number_in_all_task_tab_home_page}    (//div[@id='rc-tabs-1-panel-1']//thead[@class='ant-table-thead']//th[@class='ant-table-cell'])[7]
${dps_txt_parcel_type_in_all_task_tab_home_page}    (//div[@id='rc-tabs-1-panel-1']//thead[@class='ant-table-thead']//th[@class='ant-table-cell'])[8]
${dps_txt_import_from_in_import_task_tab_home_page}    (//div[@id='rc-tabs-1-panel-2']//thead[@class='ant-table-thead']//th[@class='ant-table-cell'])[1]
${dps_txt_transport_in_import_task_tab_home_page}    (//div[@id='rc-tabs-1-panel-2']//thead[@class='ant-table-thead']//th[@class='ant-table-cell'])[2]
${dps_txt_parcel_owner_in_import_task_tab_home_page}    (//div[@id='rc-tabs-1-panel-2']//thead[@class='ant-table-thead']//th[@class='ant-table-cell'])[3]
${dps_txt_number_of_pouch_in_import_task_tab_home_page}    (//div[@id='rc-tabs-1-panel-2']//thead[@class='ant-table-thead']//th[@class='ant-table-cell'])[4]
${dps_txt_number_of_pieces_in_import_task_tab_home_page}    (//div[@id='rc-tabs-1-panel-2']//thead[@class='ant-table-thead']//th[@class='ant-table-cell'])[5]
${dps_txt_number_of_scanned_items_in_import_task_tab_home_page}    (//div[@id='rc-tabs-1-panel-2']//thead[@class='ant-table-thead']//th[@class='ant-table-cell'])[6]
${dps_txt_send_to_in_send_task_tab_home_page}    (//div[@id='rc-tabs-1-panel-4']//thead[@class='ant-table-thead']//th[@class='ant-table-cell'])[1]
${dps_txt_store_code_in_send_task_tab_home_page}    (//div[@id='rc-tabs-1-panel-4']//thead[@class='ant-table-thead']//th[@class='ant-table-cell'])[2]
${dps_txt_transport_in_send_task_tab_home_page}    (//div[@id='rc-tabs-1-panel-4']//thead[@class='ant-table-thead']//th[@class='ant-table-cell'])[3]
${dps_txt_number_of_pouch_in_send_task_tab_home_page}    (//div[@id='rc-tabs-1-panel-4']//thead[@class='ant-table-thead']//th[@class='ant-table-cell'])[4]
${dps_txt_number_of_pieces_in_send_task_tab_home_page}    (//div[@id='rc-tabs-1-panel-4']//thead[@class='ant-table-thead']//th[@class='ant-table-cell'])[5]
${dps_txt_number_of_scanned_items_in_send_task_tab_home_page}    (//div[@id='rc-tabs-1-panel-4']//thead[@class='ant-table-thead']//th[@class='ant-table-cell'])[6]
${dps_txt_export_to_in_export_task_tab_home_page}    //div[@id='rc-tabs-1-panel-3']//thead[@class='ant-table-thead']//tr//th[1]
${dps_txt_transport_in_export_task_tab_home_page}    //div[@id='rc-tabs-1-panel-3']//thead[@class='ant-table-thead']//tr//th[2]
${dps_txt_parcel_owner_in_export_task_tab_home_page}    //div[@id='rc-tabs-1-panel-3']//thead[@class='ant-table-thead']//tr//th[3]
${dps_txt_number_of_pouch_in_export_task_tab_home_page}    //div[@id='rc-tabs-1-panel-3']//thead[@class='ant-table-thead']//tr//th[4]
${dps_txt_number_of_pieces_in_export_task_tab_home_page}    //div[@id='rc-tabs-1-panel-3']//thead[@class='ant-table-thead']//tr//th[5]
${dps_txt_number_of_scanned_items_in_export_task_tab_home_page}    //div[@id='rc-tabs-1-panel-3']//thead[@class='ant-table-thead']//tr//th[6]
${dps_txt_dropdown_warehouse_tab_home_page}    //span[@aria-label='down']/../..//div[@class='ant-space-item' and text()]

${dps_btn_dropdown_select_role}    //span[@aria-label='down-circle']
${dps_btn_role}    //li[@role='menuitem']//button[text()='{value}']
${dps_btn_selected_warehouse_list_home_page}    //div[text()='{value}']/../..
${dps_btn_pagination_right_home_page}    //div[@aria-hidden='false']//span[@aria-label='right']/..
${dps_btn_filter_home_page}    //div[@aria-hidden='false']//span[text()='{value}']/..
${dps_btn_search_filter_home_page}    //div[text()='{value}']/..
${dps_btn_next_page_export_task}    //div[@class='ant-tabs-tabpane ant-tabs-tabpane-active']//span[@aria-label='right']/..

${dps_tab_name}    //div[@role='tab' and text()='{value}']
${dps_tab_in_home_page}    //div[@class='ant-tabs-nav-list']//div[text()='{value}']   

${dps_img_icon_user}    //span[@class='anticon anticon-user']
${dps_img_loading_page}    //div[@role='dialog']

${dps_cbo_warehouse_list_home_page}    //li[@role='menuitem']/..//span[text()='{warehouse}']
${dps_cbo_selected_warehouse_list_home_page}    //span[contains(@class,'ant-checkbox-checked')]/..//span[text()='{warehouse}']
${dps_cbo_parcel_status_home_page}    (//div[@title='{value}'])[1]
${dps_cbo_task_type_home_page}    //div[@title='{value}']

${dps_txtbox_parcel_status_home_page}    //input[@type='search' and @id='status']
${dps_txtbox_task_type_home_page}    //input[@type='search' and @id='typeAll']

${dps_txtbox_parcel_number_home_page}    //input[@id='parcelNumber']