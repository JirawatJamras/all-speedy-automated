*** Variables ***
${dps_txt_label_title_delivery_list}    //div[contains(@class,'ant-card')]//tr[th[1]='{title_export_to}' and th[2]='{title_transport}' and th[6]='{title_date}' and th[7]='{title_status}']
${dps_txt_value_delivery_list}    //div[contains(@class,'ant-card')]//tr[td[1]='{value_export_to}' and td[2]='{value_transport}' and contains(td[6],'{value_date}') and //td[7]//h1[contains(normalize-space(), '{value_status}')]  ]
${dps_btn_print_delivery_list}    //div[contains(@class,'ant-card')]//tr[td[1][contains(normalize-space(), '{value_export_to}')] and td[2]='{value_transport}' and contains(td[6],'{value_date}') and //td[7]//h1[contains(normalize-space(), '{value_status}')]  ]//td[8]//button
                                                                          