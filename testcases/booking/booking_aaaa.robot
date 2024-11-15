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
Pseudo Nested Loop
    [Arguments]    ${_i}
    ${_ylist}    Create List
    FOR    ${_y}    IN RANGE    1    ${maxColumn}
        ${_val}   Read Excel Cell    row_num=${_i}    col_num=${_y}
        Append To List    ${_ylist}    ${_val}
    END

Read Excel
    [Tags]    Excel
    ${_xouter}    Create list
    ${_xlist}    Create List
    Open Excel Document    filename=${EXCEL_FILE}  doc_id=doc1   keep_vba=True
    FOR     ${_i}   IN RANGE    3    ${maxRow}
        ${_xlist}    Pseudo Nested Loop    ${_i}
        Append to List    ${_xouter}    ${_xlist}
    END
    
*** Test Cases ***
 Check Scenario Number And Use Row Data  
     [Tags]     Excel
    ${_ylist}    Create list
    Open Excel Document    filename=${EXCEL_FILE}  doc_id=doc1   keep_vba=True  
    FOR    ${row}    IN RANGE    1    99999999
        Log   ${row}
        ${scenario_number}=   Read Excel Cell     row_num=${row}    col_num=1
        IF    '${scenario_number}' == 'Booking_S005'
            Log to Console    \n"Reached empty cell at row ${row}. Stopping the loop."\n
            FOR    ${col}    IN RANGE    1    42
             ${cell}=   Read Excel Cell     row_num=${row}   col_num=${col}
            Append to List     ${_ylist}    ${cell} 
            Set Global Variable     ${_ylist}
            END
            FOR    ${i}    IN RANGE    0    41
            Log to Console    \n"${_ylist}[${i}]"\n
            #Set Global Variable    ${_ylist}[${i}]
            END
            Exit For Loop
        END
    END
    Set Global Variable    ${test0}    ${_ylist}[0] 
    Set Global Variable    ${test1}    ${_ylist}[1] 
 Check Scenario Number And Use Row Data111
     [Tags]     Excel
        Log to Console    ${test0} 
        Log to Console    ${test1}
# Check Scenario Number And Use Row Data
#     Open Excel Document    	filename=${EXCEL_FILE}  doc_id=doc1   keep_vba=True
#     FOR    ${row}    IN RANGE    3    9999
#         Log   ${row}
#         ${no}=   Read Excel Cell     row_num=${row}    col_num=1

#         FOR    ${col}    IN RANGE    1    42
#             ${no}=   Read Excel Cell     row_num=3   col_num=${col}
#             Log to Console    ${no}
#         END

