*** Settings ***
Resource          ../../resourses/init_website.robot
Resource          ../../resourses/import.robot

*** Variables ***
${EXCEL_FILE}     ${path_excel_booking_testdata_excel}
#${maxColumn}    43    # +1 because loop starts with 1 not 0
#${maxRow}       63   # +3 because ignore column and col starts with 1


*** Keywords ***
Check Scenario Number And Use Row Data  
    [Arguments]    ${scenario_no}
    ${_xlist}    Create list
    ${title_list}    Create list
    ${row}=    Set Variable    1
    ${col}=    Set Variable    1
    Open Excel Document    filename=${EXCEL_FILE}  doc_id=doc1   keep_vba=True  
    WHILE    True
        Log    Current Row: ${row}
        ${maxRow}=    Set Variable    ${row}
        ${row_value}=    Read Excel Cell    row_num=${row}    col_num=1
        IF    '${row_value}' == 'None'
            ${maxRow}=    Evaluate    ${row} - 1
            Set Global Variable    ${maxRow}
            BREAK
        END
        ${row}=    Evaluate    ${row} + 1
    END
    Log    ${maxRow}
    WHILE    True
        Log    Current col: ${col}
        ${maxCol}=    Set Variable    ${col}
        ${col_value}=    Read Excel Cell    row_num=1    col_num=${col}
        ${i}=    Evaluate    ${col} - 1
        IF    '${col_value}' == 'None'
            Set Global Variable    ${maxCol}
            BREAK
        END
        ${col}=    Evaluate    ${col} + 1
    END
    Log    ${maxCol}
    
    FOR    ${col}    IN RANGE    1    ${maxCol}
        ${title}=   Read Excel Cell     row_num=1   col_num=${col}
    Append to List     ${title_list}    ${title} 
    Set Global Variable     ${title_list}
    ${i}=    Evaluate    ${col} - 1
    END

    FOR    ${row}    IN RANGE    1    ${maxRow}
        Log   ${row}
        ${scenario_number}=   Read Excel Cell     row_num=${row}    col_num=1
        IF    '${scenario_number}' == '${scenario_no}'
            FOR    ${col}    IN RANGE    1    ${maxCol}
             ${cell}=   Read Excel Cell     row_num=${row}   col_num=${col}
            Append to List     ${_xlist}    ${cell} 
            Set Global Variable     ${_xlist}
            ${i}=    Evaluate    ${col} - 1
            Set Global Variable		${${scenario_no}_${title_list}[${i}]}		${_xlist}[${i}]	
            END
            Exit For Loop
        END
    END
    # Set Global Variable		${${scenario_no}_scenario_number}		${_xlist}[0]	
    # Set Global Variable		${${scenario_no}_parcel_type}    ${_xlist}[1]	
    # Set Global Variable		${${scenario_no}_sender_phone}		${_xlist}[2]	
    # Set Global Variable		${${scenario_no}_sender_name}		${_xlist}[3]	
    # Set Global Variable		${${scenario_no}_sender_address}		${_xlist}[4]	
    # Set Global Variable		${${scenario_no}_sender_postcode_5_digits}		${_xlist}[5]	
    # Set Global Variable		${${scenario_no}_sender_postcode_full}		${_xlist}[6]	
    # Set Global Variable		${${scenario_no}_receiver_phone}		${_xlist}[7]	
    # Set Global Variable		${${scenario_no}_receiver_name}		${_xlist}[8]	
    # Set Global Variable		${${scenario_no}_receiver_address}			${_xlist}[9]
    # Set Global Variable		${${scenario_no}_receiver_postcode_5_digits}		${_xlist}[10]	
    # Set Global Variable		${${scenario_no}_receiver_postcode_full}		${_xlist}[11]	
    # Set Global Variable		${${scenario_no}_receiver_store_code_5_digits}			${_xlist}[12]
    # Set Global Variable		${${scenario_no}_receiver_store_address}		${_xlist}[13]	
    # Set Global Variable		${${scenario_no}_receiver_store_full}			${_xlist}[14]
    # Set Global Variable		${${scenario_no}_shipping_origin}			${_xlist}[15]
    # Set Global Variable		${${scenario_no}_store_code}		${_xlist}[16]	
    # Set Global Variable		${${scenario_no}_parcel_size}			${_xlist}[17]
    # Set Global Variable		${${scenario_no}_parcel_cod}		${_xlist}[18]	
    # Set Global Variable		${${scenario_no}_parcel_detail_remark}			${_xlist}[19]
    # Set Global Variable		${${scenario_no}_promotion}		${_xlist}[20]	
    # Set Global Variable		${${scenario_no}_booking_name}			${_xlist}[21]
    # Set Global Variable		${${scenario_no}_booking_item}			${_xlist}[22]
    # Set Global Variable		${${scenario_no}_parcel_package_type}			${_xlist}[23]
    # Set Global Variable		${${scenario_no}_price_value}			${_xlist}[24]
    # Set Global Variable		${${scenario_no}_parcel_cod_verify}		${_xlist}[25]	
    # Set Global Variable		${${scenario_no}_parcel_cod_verify_label}			${_xlist}[26]
    # Set Global Variable		${${scenario_no}_promotion_detail.discount}		${_xlist}[27]	
    # Set Global Variable		${${scenario_no}_promotion_detail.promotion_name}			${_xlist}[28]
    # Set Global Variable		${${scenario_no}_promotion_detail.parcel_size}			${_xlist}[29]
    # Set Global Variable		${${scenario_no}_promotion_detail.expired_date}		${_xlist}[30]	
    # Set Global Variable		${${scenario_no}_promotion_detail.condition}		${_xlist}[31]	
    # Set Global Variable		${${scenario_no}_promotion_detail.period}			${_xlist}[32]
    # Set Global Variable		${${scenario_no}_discount_amount}			${_xlist}[33]
    # Set Global Variable		${${scenario_no}_discount_value}		${_xlist}[34]	
    # Set Global Variable		${${scenario_no}_discount_value1}			${_xlist}[35]
    # Set Global Variable		${${scenario_no}_discount_value2}			${_xlist}[36]
    # Set Global Variable		${${scenario_no}_cod_fee_amount}		${_xlist}[37]	
    # Set Global Variable		${${scenario_no}_cod_fee_value}		${_xlist}[38]	
    # Set Global Variable		${${scenario_no}_total_price_amount}		${_xlist}[39]	
    # Set Global Variable		${${scenario_no}_total_price_value1}		${_xlist}[40]	
    # Set Global Variable	    ${${scenario_no}_total_price_value2}		${_xlist}[41]	
    Close All Excel Documents
*** Test Cases ***
TEST
     [Tags]     Excel
    Check Scenario Number And Use Row Data    Booking_S005  
    Log to Console    ${Booking_S005_scenario}	
    Log to Console    ${Booking_S005_parcel_type}
    Log to Console    ${Booking_S005_total_price_value2}
    Check Scenario Number And Use Row Data    Booking_S027
    Log to Console    ${Booking_S027_scenario}	
    Log to Console    ${Booking_S027_parcel_type}
    Log to Console    ${Booking_S027_total_price_value2}