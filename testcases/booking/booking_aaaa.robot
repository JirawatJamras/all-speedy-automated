*** Settings ***
Resource          ../../resourses/init_website.robot
Resource          ../../resourses/import.robot

*** Variables ***
${EXCEL_FILE}     ${path_excel_booking_testdata_excel}
${SCENARIO_NUMBER}    Booking_S005   # ระบุ Scenario Number ที่ต้องการค้นหา
${maxColumn}    42    # +1 because loop starts with 1 not 0
${maxRow}       6   # +1 because ignore column and col starts with 1
${maxRow-1}     3   # because Amount of row used

*** Keywords ***
Check Scenario Number And Use Row Data  
    [Arguments]    ${scenario_no}
    ${_ylist}    Create list
    Open Excel Document    filename=${EXCEL_FILE}  doc_id=doc1   keep_vba=True  
    FOR    ${row}    IN RANGE    1    99999999
        Log   ${row}
        ${scenario_number}=   Read Excel Cell     row_num=${row}    col_num=1
        IF    '${scenario_number}' == '${scenario_no}'
            Log to Console    \n"Reached empty cell at row ${row}. Stopping the loop."\n
            FOR    ${col}    IN RANGE    1    43
             ${cell}=   Read Excel Cell     row_num=${row}   col_num=${col}
            Append to List     ${_ylist}    ${cell} 
            Set Global Variable     ${_ylist}
            END
            Exit For Loop
        END
    END
    Set Global Variable		${${scenario_no}_scenario_number}		${_ylist}[0]	
    Set Global Variable		${${scenario_no}_parcel_type}    ${_ylist}[1]	
    Set Global Variable		${${scenario_no}_sender_phone}		${_ylist}[2]	
    Set Global Variable		${${scenario_no}_sender_name}		${_ylist}[3]	
    Set Global Variable		${${scenario_no}_sender_address}		${_ylist}[4]	
    Set Global Variable		${${scenario_no}_sender_postcode_5_digits}		${_ylist}[5]	
    Set Global Variable		${${scenario_no}_sender_postcode_full}		${_ylist}[6]	
    Set Global Variable		${${scenario_no}_receiver_phone}		${_ylist}[7]	
    Set Global Variable		${${scenario_no}_receiver_name}		${_ylist}[8]	
    Set Global Variable		${${scenario_no}_receiver_address}			${_ylist}[9]
    Set Global Variable		${${scenario_no}_receiver_postcode_5_digits}		${_ylist}[10]	
    Set Global Variable		${${scenario_no}_receiver_postcode_full}		${_ylist}[11]	
    Set Global Variable		${${scenario_no}_receiver_store_code_5_digits}			${_ylist}[12]
    Set Global Variable		${${scenario_no}_receiver_store_address}		${_ylist}[13]	
    Set Global Variable		${${scenario_no}_receiver_store_full}			${_ylist}[14]
    Set Global Variable		${${scenario_no}_shipping_origin}			${_ylist}[15]
    Set Global Variable		${${scenario_no}_store_code}		${_ylist}[16]	
    Set Global Variable		${${scenario_no}_parcel_size}			${_ylist}[17]
    Set Global Variable		${${scenario_no}_parcel_cod}		${_ylist}[18]	
    Set Global Variable		${${scenario_no}_parcel_detail_remark}			${_ylist}[19]
    Set Global Variable		${${scenario_no}_promotion}		${_ylist}[20]	
    Set Global Variable		${${scenario_no}_booking_name}			${_ylist}[21]
    Set Global Variable		${${scenario_no}_booking_item}			${_ylist}[22]
    Set Global Variable		${${scenario_no}_parcel_package_type}			${_ylist}[23]
    Set Global Variable		${${scenario_no}_price_value}			${_ylist}[24]
    Set Global Variable		${${scenario_no}_parcel_cod_verify}		${_ylist}[25]	
    Set Global Variable		${${scenario_no}_parcel_cod_verify_label}			${_ylist}[26]
    Set Global Variable		${${scenario_no}_promotion_detail.discount}		${_ylist}[27]	
    Set Global Variable		${${scenario_no}_promotion_detail.promotion_name}			${_ylist}[28]
    Set Global Variable		${${scenario_no}_promotion_detail.parcel_size}			${_ylist}[29]
    Set Global Variable		${${scenario_no}_promotion_detail.expired_date}		${_ylist}[30]	
    Set Global Variable		${${scenario_no}_promotion_detail.condition}		${_ylist}[31]	
    Set Global Variable		${${scenario_no}_promotion_detail.period}			${_ylist}[32]
    Set Global Variable		${${scenario_no}_discount_amount}			${_ylist}[33]
    Set Global Variable		${${scenario_no}_discount_value}		${_ylist}[34]	
    Set Global Variable		${${scenario_no}_discount_value1}			${_ylist}[35]
    Set Global Variable		${${scenario_no}_discount_value2}			${_ylist}[36]
    Set Global Variable		${${scenario_no}_cod_fee_amount}		${_ylist}[37]	
    Set Global Variable		${${scenario_no}_cod_fee_value}		${_ylist}[38]	
    Set Global Variable		${${scenario_no}_total_price_amount}		${_ylist}[39]	
    Set Global Variable		${${scenario_no}_total_price_value1}		${_ylist}[40]	
    Set Global Variable	    ${${scenario_no}_total_price_value2}		${_ylist}[41]	
    Close All Excel Documents
*** Test Cases ***
TEST
     [Tags]     Excel
    Check Scenario Number And Use Row Data    Booking_S005  
    Log to Console    ${Booking_S005_scenario_number}	
    Log to Console    ${Booking_S005_parcel_type}
    Log to Console    ${Booking_S005_total_price_value2}
    Check Scenario Number And Use Row Data    Booking_S002
    Log to Console    ${Booking_S002_scenario_number}	
    Log to Console    ${Booking_S002_parcel_type}
    Log to Console    ${Booking_S002_total_price_value2}