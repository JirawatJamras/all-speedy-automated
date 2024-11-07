*** Variables ***
${dps_btn_print_pouch_label_pouch_detail_page}    //span[text()=' Print Pouch Label']/..

${dps_txt_pouch_in_pouch_list}    //tr[td[1]='{pouch_number}' and td[2]='{inventory_crossdock}' and td[3]='{destination_inventory}' and td[4]='{parcel_amount}' and td[5]//button[@aria-checked='{checked}'] and contains(td[6], '{update_date}')]

${dps_img_pencil_in_pouch_in_pouch_list}    //tr[td[1]='{pouch_number}' and td[2]='{inventory_crossdock}' and td[3]='{destination_inventory}' and td[4]='{parcel_amount}' and td[5]//button[@aria-checked='{checked}'] and contains(td[6], '{update_date}')]//td[7]//img[@src='/_next/image?url=%2F_next%2Fstatic%2Fmedia%2Fedit-3.9188d6d3.png&w=1080&q=75']