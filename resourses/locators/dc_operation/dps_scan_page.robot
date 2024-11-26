*** Variables ***
${dps_txtbox_on_scan_in_page}    (//input)[1]
${dps_txtbox_on_scan_out_page}    (//input)[2]
${dps_txtbox_parcel_code_scan_out_page}    //input[@id='parcelCodee']
${dps_txtbox_on_pouch_detail_section}    //strong[text()='{value}']/../../../../..//input
${dps_txtbox_pouch_number_move_status}    //input[@id='pouchNo']
${dps_txtbox_parcel_number_move_status}    //input[@id='parcelNo']
${dps_txtbox_start_date_move_status}    //input[@id='modifiedDate']
${dps_txtbox_end_date_move_status}    //input[@date-range='end']

${dps_btn_search_scan_in_page}    //span[text()='{value}']/../..//button
${dps_btn_search_scan_out_page}    (//span[text()='{value}']/../..//button)[2]
${dps_btn_scan_in_tab_is_active_scan_page}    //div[text()='{value}' and @aria-selected='true']
${dps_btn_confirm_scan_out_scan_out_page}    //span[text()='{value}']/../..//button
${dps_btn_confirm_on_asking_confirm_scan_out_popup}    //div[@class='ant-modal-content']//span[text()='{value}']/..
${dps_btn_waiting_delivery_list_scan_out_page}    //span[text()='{value}']/..
${dps_btn_close_popup_success}    //span[@class='ant-modal-close-x']//span[@aria-label='close']
# ${dps_btn_print_scan_out}    (//div[contains(@class,'ant-card ant-card-bordered')]//td[text()='{export_to}']/..//td[text()='{deliver}']/..//td[text()='{parcel_amount}'][1]/..//td[text()='{pouch_amount}']/..//td[text()='{total_parcel_pouch}'][2]/..//td[@title='{print}'])[1]
${dps_btn_print_scan_out}    (//div[contains(@class,'ant-card ant-card-bordered')]//td[text()='{export_to}']/..//td[text()='{deliver}']/..//td[@title='{print}'])[1]
${dps_btn_create_pouch}    //span[text()='{value}']/..
${dps_btn_confirm_create_pouch}    //div[@role='dialog']//button[@type='submit']
${dps_btn_print_label_parcel_detail_page}    //span[text()=' {value}']/..
${dps_btn_close_on_print_label_success_popup}    //div[@class='ant-modal-mask']/..//button[@aria-label='Close']
${dps_btn_create_pounch}    //span[text()='{value}']/..
${dps_btn_selected_warehouse_list_scan_page}    //button[@type='button']//span[@aria-label='down']
${dps_btn_accept_for_create_pouch_auto}    //div[@class='ant-modal-content']//span[text()='{value}']/..
${dps_btn_confirm_create_pouch_confirmation_scan_in_page}    //span[text()='{value}']/..
${dps_btn_agree_on_parcel_is_on_pouch_popup}    //div[@class='ant-modal-content']//span[text()='{value}']/..
${dps_btn_confirm_unbox_pouch_and_scan_piece_by_piece}    //div[@class='ant-modal-content']//span[text()='{value}']/..
${dps_btn_sub_tab_in_move_status_tab}    //div[@role='tab' and text()='{tab}']/..
${dps_btn_in_move_status_tab}    //div[@aria-hidden='false']//span[text()='{value}']/..
${dps_btn_search_filter_move_status_tab}    //div[@aria-hidden='false']//div[text()='{value}']/..
${dps_btn_clear_filter_move_status_tab}    //div[@aria-hidden='false']//span[text()='{value}']/..
${dps_btn_seach_on_pouch_detail_on_scan_page}    //strong[text()='{label}']/../../../../..//span[text()='{value}']/..
${dps_btn_select_all_on_move_status_tab}    //input[@aria-label='Select all']/..
${dps_btn_on_move_status_tab}    //div[@aria-hidden='false']//div[@aria-hidden='false']//button//span[text()='{value}']/..
${dps_btn_select_on_move_status_tab}    //td[text()='{value}']/..//input/..
${dps_btn_select_statuscode_on_move_status_tab}    //div[@id='statusCode']//input/..

${dps_input_route_parcel_detail_scan_in_page}    //strong[text()='{value}']/../../../div[2]//input

${dps_txt_scan_header_ion_scan_page}    //div[@class='ant-card-head-wrapper']//span[text()='{value}']
${dps_txt_title_parcel_detail}    //span[contains(@class,'ant-typography')]//strong[text()='{value}']
${dps_txt_title_parcel_id}    //span[contains(@class,'ant-typography')]//strong[text()='{value}']    
${dps_txt_title_customer_id}    //span[contains(@class,'ant-typography')]//strong[text()='{value}']
${dps_txt_title_parcel_size}    //span[contains(@class,'ant-typography')]//strong[text()='{value}']
${dps_txt_title_crossdock_warehouse}   //span[contains(@class,'ant-typography')]//strong[text()='{value}']
${dps_txt_title_destination_warehouse}   //span[contains(@class,'ant-typography')]//strong[text()='{value}']
${dps_txt_title_parcel_status}   //span[contains(@class,'ant-typography')]//strong[text()='{value}']
${dps_txt_title_courier}   //span[contains(@class,'ant-typography')]//strong[text()='{value}']
${dps_txt_title_pouch_number}   //span[contains(@class,'ant-typography')]//strong[text()='{value}']
${dps_txt_title_receiving_date}   //span[contains(@class,'ant-typography')]//strong[text()='{value}']
${dps_txt_title_origin_warehouse}   //span[contains(@class,'ant-typography')]//strong[text()='{value}']
${dps_txt_title_send_parcel_to}   //span[contains(@class,'ant-typography')]//strong[text()='{value}']
${dps_txt_title_route}   //span[contains(@class,'ant-typography')]//strong[text()='{value}']
${dps_txt_label_scan_in}    //div[@class='']//span[text()='{value}']
${dps_txt_label_size_scan_in}    //div[@class='']//span[contains(normalize-space(), '{value}')]
${dps_txt_label_wait_scan_in_warehouse_ac}    //tr[th[1]='{parcel_id}' and th[2]='{pouch_number}' and th[3]='{receive_parcel_from}' and th[4]='{parcel_size}' and th[5]='{receiving_date}' and th[6]='{parcel_status}']
${dps_txt_value_wait_scan_in_warehouse_ac}    //tr[td[1]='{parcel_id}' and td[2]='{pouch_number}' and td[3]='{receive_parcel_from}' and td[4]='{parcel_size}' and contains(td[5],'{receiving_date}') and td[6]='{parcel_status}']
${dps_txt_label_scan_in_warehouse_ac}    //tr[th[1]='{pouch_number}' and th[2]='{parcel_id}' and th[3]='{receive_parcel_from}' and th[4]='{parcel_size}' and th[5]='{receiving_date}' and th[6]='{parcel_status}']
${dps_txt_value_scan_in_warehouse_ac}    //tr[td[1]='{pouch_number}' and td[2]='{parcel_id}' and td[3]='{receive_parcel_from}' and td[4]='{parcel_size}' and contains(td[5],'{receiving_date}') and td[6]='{parcel_status}']

${dps_txt_value_scan_out}    //tr[td[1]='{value_pouch_number}' and td[2]='{value_parcel_id}' and td[3]='{value_import_from}' and td[4]='{value_transport}' and td[5]='{value_parcel_owner}' and td[6]='{value_parcel_size}' and contains(td[7], '{value_date}') and //td[8]//h1[contains(normalize-space(), '{value_parcel_status}')]]
${dps_txt_update_time_scan_out}    //tr[td[1]='{value_pouch_number}' and td[2]='{value_parcel_id}' and td[3]='{value_import_from}' and td[4]='{value_transport}' and td[5]='{value_parcel_owner}' and td[6]='{value_parcel_size}' and contains(td[7], '{value_date}') and //td[8]//h1[contains(normalize-space(), '{value_parcel_status}')]]//td[7]
${dps_txt_label_title_scan_out}    //tr[th[1]='{title_pouch_number}' and th[2]='{title_parcel_id}' and th[3]='{title_import_from}' and th[4]='{title_transport}' and th[5]='{title_parcel_owner}' and th[6]='{title_parcel_size}' and th[7]='{title_date}' and th[8]='{title_parcel_status}' ]
${dps_txt_title_label}    //div[@class='']//span[text()='{value}']
${dps_txt_value_parcel_id}    //span[contains(@class,'ant-typography')]//strong[text()='{value}']/../../../div[2]/span
${dps_txt_value_customer_id}    //span[contains(@class,'ant-typography')]//strong[text()='{value}']/../../../div[2]/span
${dps_txt_value_parcel_size1}    //input[@type='number' and contains(@class,'ant-input')]
${dps_txt_value_parcel_size2}    //input[@type='number' and contains(@class,'ant-input')]/../span
${dps_txt_value_parcel_size3}    //input[@type='number' and contains(@class,'ant-input')]/../../input
${dps_txt_value_crossdock_warehouse}    //span[contains(@class,'ant-typography')]//strong[text()='{value}']/../../../div[2]/span
${dps_txt_value_destination_warehouse}    //span[contains(@class,'ant-typography')]//strong[text()='{value}']/../../../div[2]/div/div/span[2]
${dps_txt_arrow_destination_warehouse}    /../../span[@class='ant-select-arrow']
${dps_txt_value_parcel_status}    //span[contains(@class,'ant-typography')]//strong[text()='{value}']/../../../div[2]/span
${dps_txt_value_courier}    //span[contains(@class,'ant-typography')]//strong[text()='{value}']/../../../div[2]/div/div/span[2]
${dps_txt_value_pouch_number}    //span[contains(@class,'ant-typography')]//strong[text()='{value}']/../../../div[2]/span
${dps_txt_value_receiving_date}    //span[contains(@class,'ant-typography')]//strong[text()='{value}']/../../../div[2]/span
${dps_txt_value_origin_warehouse}    //span[contains(@class,'ant-typography')]//strong[text()='{value}']/../../../div[2]/span
${dps_txt_value_send_parcel_to}    //span[contains(@class,'ant-typography')]//strong[text()='{value}']/../../../div[2]/span
${dps_txt_value_route}    (//div[@class="ant-form-item-control-input-content"]//input)[2]
${dps_txt_value_label_store}    //div[@class='mt-5']/div[2]/span[2]
${dps_txt_value_label_home}    (//div[contains(@class,'mt-5 gap-5')]/..//div[3]//span[2])[1]
${dps_txt_value_label_wh}    //div[@class='mt-5']/div[6]/span[2]
${dps_txt_value_label}    //div[@class='']//span[text()='{value}']
${dps_txt_label_sender_title_in_scan_in_scan_page}    //div[@aria-hidden='false']//strong[text()='{label_sender_title}']
${dps_txt_label_sender_name_in_scan_in_scan_page}    //div[@aria-hidden='false']//strong[text()='{label_sender_name}']
${dps_txt_label_sender_phone_in_scan_in_scan_page}   //div[@aria-hidden='false']//strong[text()='{label_sender_phone}']
${dps_txt_label_shipping_origin_in_scan_in_scan_page}    //div[@aria-hidden='false']//strong[text()='{label_shipping_origin}']
${dps_txt_label_sender_address_in_scan_in_scan_page}    (//div[@aria-hidden='false']//strong[text()='{label_sender_address}'])[1]
${dps_txt_value_sender_name_in_scan_in_scan_page}    //div[@aria-hidden='false']//strong[text()='{label_sender_name}']/../../..//span[text()='{value_sender_name}']
${dps_txt_value_sender_phone_in_scan_in_scan_page}    //div[@aria-hidden='false']//strong[text()='{label_sender_phone}']/../../..//span[text()='{value_sender_phone}']
${dps_txt_value_shipping_origin_in_scan_in_scan_page}    //div[@aria-hidden='false']//strong[text()='{label_shipping_origin}']/../../..//span[contains(text(),'{value_shipping_origin}')]
${dps_txt_value_sender_address_in_scan_in_scan_page}    //div[@aria-hidden='false']//strong[text()='{label_sender_address}']/../../..//span[contains(normalize-space(.), '{value_sender_address}')]
${dps_txt_title_parcel_waiting_scan_out_in_scan_page}    //strong[text()='{value}']
${dps_txt_label_receiver_title_in_scan_in_scan_page}    //div[@aria-hidden='false']//strong[text()='{label_receiver_title}']
${dps_txt_label_receiver_name_in_scan_in_scan_page}    //div[@aria-hidden='false']//strong[text()='{label_receiver_name}']
${dps_txt_label_receiver_phone_in_scan_in_scan_page}   //div[@aria-hidden='false']//strong[text()='{label_receiver_phone}']
${dps_txt_label_shipping_destination_in_scan_in_scan_page}    //div[@aria-hidden='false']//strong[contains(text(),'{label_shipping_destination}')]
${dps_txt_label_receiver_address_in_scan_in_scan_page}    (//div[@aria-hidden='false']//strong[text()='{label_receiver_address}'])[2]
${dps_txt_value_receiver_name_in_scan_in_scan_page}    //div[@aria-hidden='false']//strong[text()='{label_receiver_name}']/../../..//span[text()='{value_receiver_name}']
${dps_txt_value_receiver_phone_in_scan_in_scan_page}    //div[@aria-hidden='false']//strong[text()='{label_receiver_phone}']/../../..//span[text()='{value_receiver_phone}']
${dps_txt_value_shipping_destination_in_scan_in_scan_page}    //div[@aria-hidden='false']//strong[text()='{label_shipping_destination}']/../../..//span[text()='{value_shipping_destination}']
${dps_txt_value_receiver_address_in_scan_in_scan_page}    //div[@aria-hidden='false']//strong[text()='{label_receiver_address}']/../../..//span[contains(normalize-space(.), '{value_receiver_address}')]
${dps_txt_save_data_success}    //p[text()='{value}']
${dps_txt_wiating_list_to_scan_out_in_scan_out_page}    //tr[td[1]='{parcel_number}' and td[2]='{pouch_number}' and td[3]='{import_from}' and td[4]='{deliver}' and td[5]='{parcel_owner}' and td[6]='{parcel_size}' and contains(td[7], '{update_date}') and td[8]//h1[contains(normalize-space(),'{parcel_status}')]]
${dps_txt_update_date_of_wiating_list_to_scan_out_in_scan_out_page}    //tr[td[1]='{parcel_number}' and td[2]='{pouch_number}' and td[3]='{import_from}' and td[4]='{deliver}' and td[5]='{parcel_owner}' and td[6]='{parcel_size}']//td[7]
${dps_txt_close_pouch_first_warning_popup}    //span[text()='{value}']
${dps_txt_popup_scan_out}    //div[text()='{value}']
${dps_txt_popup_create_pouch}    //div[@role='dialog']//div[text()='{value}']
${dps_txt_popup_create_pouch_detail}    //div[@role='dialog']//span[contains(text(),'{value}')]
${dps_txt_pouch_detail}    //strong[contains(text(),'{value}')]/../../../../../..//div[contains(@class,'ant-row ant-row-center')]//span[contains(text(),'{pouch_number}')]/..
${dps_txt_number_of_parcel_in_pouch}    //span[contains(text(),'{pouch_number}')]/../..//span[text()='{value}']
${dps_txt_print_label_success_in_popup}    //div[@class='ant-modal-content']//button[@class='ant-modal-close']/..//div[@class='ant-modal-body']//div//div[2]
${dps_txt_accept_scan_in_success_in_popup}    //div[@class='ant-modal-mask']/..//div/div/p
${dps_txt_destination_warehouse_create_pouch_popup_after_scan_in}    //p[text()='{value} :']//span
${dps_txt_create_pouch_confirmation_scan_in_page}    //div[@class='ant-modal-content']//p[normalize-space()='{value}']
${dps_txt_destination_warehouse_in_create_pouch_confirmation_scan_in_page}    //div[@class='ant-modal-content']//p[text()='{title_destination_warehouse}']//span[text()='{value_destination_warehouse}']
${dps_txt_parcel_is_on_pouch_popup1}    //div[@class='ant-modal-content']/div/div/p[1]
${dps_txt_parcel_is_on_pouch_popup2}    //div[@class='ant-modal-content']/div/div/p[2]
${dps_txt_unbox_pouch_and_scan_piece_by_piece}    //div[@class='ant-modal-content']//p[text()='{value}']
${dps_txt_update_date_move_status}    //div[@aria-hidden='false']//td[contains(text(),'{date}')]
${dps_txt_parcel_status_move_status}    //div[@aria-hidden='false']//td//*[contains(text(),'{value}')]
${dps_txt_filter_title_move_status}    //div[@aria-hidden='false']//strong[text()='{value}']
${dps_txt_pouch_number_in_pouch_detail_scan_in_page}    //strong[text()='{value}']
${dps_txt_parcel_in_pouch_in_pouch_detail_scan_in_page}    //strong[text()='{value}']
${dps_txt_courier_in_pouch_detail_scan_in_page}    //strong[text()='{value}']
${dps_txt_date_delivery_in_pouch_detail_scan_in_page}    //strong[text()='{value}']
${dps_txt_origin_warehouse_in_pouch_detail_scan_in_page}    //strong[text()='{value}']
${dps_txt_destination_warehouse_in_pouch_detail_scan_in_page}    //strong[text()='{value}']
${dps_txt_cossdock_warehouse_in_pouch_detail_scan_in_page}    //strong[text()='{value}']
${dps_txt_data_pouch_number_in_pouch_detail_scan_in_page}    //strong[text()='{value}']/../../../div[2]/span
${dps_txt_data_parcel_in_pouch_in_pouch_detail_scan_in_page}    //strong[text()='{value}']/../../../div[2]/span
${dps_txt_data_courier_in_pouch_detail_scan_in_page}    //strong[text()='{value}']/../../../div[2]/div/div/span[2]
${dps_txt_data_date_delivery_in_pouch_detail_scan_in_page}    //strong[text()='{value}']/../../../div[2]/span
${dps_txt_data_origin_warehouse_in_pouch_detail_scan_in_page}    //strong[text()='{value}']/../../../div[2]/span
${dps_txt_data_destination_warehouse_in_pouch_detail_scan_in_page}    //strong[text()='{value}']/../../../div[2]/span
${dps_txt_data_cossdock_warehouse_in_pouch_detail_scan_in_page}    //strong[text()='{value}']/../../../div[2]/span
${dps_txt_thead_parcel_in_pouch_scan_in_page}    //tr[th='{tracking}' and th='{destination_warehourse}' and th='{parcel_size}' and th='{type}' and th='{parcel_status}']
${dps_txt_data_parcel_in_pouch_scan_in_page}        //tr[td[1][normalize-space()='{tracking}'] and     td[2][normalize-space()='{destination_warehourse}'] and     td[3][normalize-space()='{parcel_size}'] and     td[4][normalize-space()='{type}'] and     td[5]//h1[contains(normalize-space(), '{parcel_status}')] ]
${dps_parcel_have_to_scan_remaining}    //strong[text()='{value} ']/span
${dps_amount_parcel_have_to_scan_remaining_in_table}    //table//tbody//tr
${dps_txt_pouch_number_title_in_scan_in_page}    (//strong[text()='{value}']/../../..//span)[2]
${dps_txt_pouch_number_move_status}    //div[@aria-hidden='false']//td[contains(text(),'{value}')]
${dps_txt_blank_parcel_status_move_status}    //input[@id='status']/../..//span[@class='ant-select-selection-placeholder']
${dps_txt_blank_dc_initial_move_status}    //input[@id='dcInitial']/../..//span[@class='ant-select-selection-placeholder']
${dps_txt_courier_move_status}    //input[@id='courier']/../..//span[@class='ant-select-selection-placeholder']
${dps_txt_blank_parcel_owner_move_status}    //input[@id='rc_select_5']/../..//span[@class='ant-select-selection-placeholder']
${dps_txt_blank_parcel_size_move_status}    //input[@id='size']/../..//span[@class='ant-select-selection-placeholder']
${dps_txt_list_data_move_status}    //div[@aria-hidden='false']//td//*[contains(text(),'{status}')]/../../..//td[text()='{tracking}']/..//td[text()='{pouch}']/..//td[text()='{courier}']/..//td[text()='{owner}']/..//td[text()='{size}']/..//td[contains(text(),'{date}')]
${dps_txt_move_status_to}    //div[@id='statusCode']//strong[text()='{value}']
${dps_txt_tracking_move_status}    //div[@aria-hidden='false']//div[@aria-hidden='false']//td[text()='{value}']

${dps_img_label_star_symbol_in_scan_page}    //div[@class='ml-4']/img[@alt='data:image/png;base64,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']
${dps_img_label_circle_symbol_in_scan_page}    //div[@class='ml-4']/img[@alt='data:image/png;base64,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']
${dps_img_label_hourglass_symbol_in_scan_page}    //div[@class='ml-4']/img[contains(@alt,'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAMgAAAENCAYAAABKCiot')]

${dps_cbo_courier_in_scan_page}    //div[contains(@class,'ant-select-dropdown')]//div[@title='{value}']
${dps_cbo_destination_warehouse_in_scan_page}    //div[contains(@class,'ant-select-dropdown')]//div[@title='{value}']
${dps_cbo_destination_warehouse_in_create_pouch_popup}    //div[@role='dialog']//div[@class='ant-select-selector']
${dps_cbo_filter_move_status}    //div[@aria-hidden='false']//strong[text()='{value}']/../../..//div[@class='ant-select-selector']
${dps_cbo_selected_date_move_status}    //div[@aria-hidden='false']//div[@class='ant-form-item-control-input']//input[@id='modifiedDate']/..
${dps_cbo_status_list_move_status}    //div[@id='status_list']/..
${dps_cbo_size_list_move_status}    //div[@id='size_list']/..
${dps_cbo_courier_list_move_status}    //div[@id='courier_list']/..
${dps_cbo_calendar_move_status}    //div[@class='ant-picker-panels']
${dps_cbo_parcel_status_move_status}    //div[@id='status_list']/..//div[@title='{value}']
${dps_cbo_parcel_status_move_status_to}    //div[@role='listbox']/..//div[@title='{value}']
${dps_cbo_move_status_to}    //div[@id='statusCode']//div[@class='ant-select-selector']

${dps_iframe_print_window}    //iframe[@id='printWindow']
${dps_cbo_warehouse_list_scan_page}    //span[text()='{warehouse}']
${dps_table_data_move_status}    //div[@aria-hidden='false']//tbody//tr
