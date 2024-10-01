*** Variables ***
${b2c_btn_add_call_car_pickup_page}    //span[text()='เพิ่ม']/..
${b2c_btn_basic_parcel_type_car_pickup_page}    //strong[text()='ประเภทพัสดุ']/../../../..//input[@id='basic_parcelType']/../..
${b2c_btn_placeholder_date_pickup_in_add_popup}    //*[@class='ant-modal-content']//strong[text()='วันที่รถเข้ารับพัสดุ']/../../../..//input
${b2c_btn_previous_date_in_add_popup}    //td[contains(@class,'ant-picker-cell-today')]/..//td[@class='ant-picker-cell ant-picker-cell-disabled ant-picker-cell-in-view']
${b2c_b2n_active_date_in_add_popup}    //td[@class='ant-picker-cell ant-picker-cell-in-view']

${b2c_txt_parcel_pickup_schedule}    //span[text()='รอบรถเข้ารับพัสดุ']
${b2c_txt_pickup_parcel_date_in_add_popup}    //strong[text()='วันที่รถเข้ารับพัสดุ']
${b2c_txt_pickup_parcel_time_selected_value_in_add_popup}    //strong[text()='เวลารถเข้ารับพัสดุ']/../../../..//span[@class='ant-select-selection-item']

${b2c_cbo_car_round_name_call_car_pickup_page}    //strong[text()='ชื่อรอบรถ']/../../../..//input[@id='basic_pickupType']
${b2c_cbo_parcel_type_call_car_pickup_page}    //strong[text()='ประเภทพัสดุ']/../../../..//span[@class='ant-select-selection-item']
${b2c_cbo_pickup_parcel_date_in_add_popup}    //strong[text()='วันที่รถเข้ารับพัสดุ']/../../../..//input
${b2c_cdo_pickup_parcel_time_in_add_popup}    //strong[text()='เวลารถเข้ารับพัสดุ']/../../../..//input/../..
${b2c_cdo_2_pickup_parcel_time_in_add_popup}    //strong[text()='เวลารถเข้ารับพัสดุ']/../../../..//input

${b2c_tbl_pickup_parcel_calendar_in_add_popup}    //*[contains(@class,'ant-picker-dropdown')]

