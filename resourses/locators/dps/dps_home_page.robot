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
${dps_txt_list_first_daily_task_home_page}    (//tbody[@class='ant-table-tbody']//h1[text()='{parcel_status}']/../../..//td[text()='{parcel_number}']/..//td[text()='{pouch_number}']/..//td[text()='{transport}']/..//td[text()='{sending_to}']/..//td[text()='{incoming_from}']/..//td[text()='{parcel_owner}']/..//td[text()='{task_type}']/..)[1]

${dps_txt_page_title}    //div[@class='ant-card-head-title']//strong[text()='{value}']
${dps_txt_role_user}    /../..//strong[text()='{value}']

${dps_btn_dropdown_select_role}    //span[@aria-label='down-circle']
${dps_btn_role}    //li[@role='menuitem']//button[text()='{value}']
${dps_btn_selected_warehouse_list_home_page}    //div[text()='{value}']/../..

${dps_tab_name}    //div[@role='tab' and text()='{value}']
${dps_tab_in_home_page}    //div[@class='ant-tabs-nav-list']//div[text()='{value}']

${dps_img_icon_user}    //span[@class='anticon anticon-user']
${dps_img_loading_screen_home_page}    //*[@class='ant-modal-content']

${dps_cbo_warehouse_list_home_page}    //li[@role='menuitem']/..//span[text()='{warehouse}']
${dps_cbo_selected_warehouse_list_home_page}    //span[contains(@class,'ant-checkbox-checked')]/..//span[text()='{warehouse}']
