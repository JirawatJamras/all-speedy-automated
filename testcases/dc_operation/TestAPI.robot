*** Settings ***
Resource          ../../resourses/init_website.robot
Resource          ../../resourses/import.robot

*** Test Cases ***

Get Parcels And Sender Names
    [Documentation]    Retrieve parcels' codes and sender's names from the API response
    [Tags]    UAT
    ${ParcelsData}    Get Parcels And Sender Names    B2411000294
    ${parcel_code}    Get Parcel Codes By Sender Name    ${ParcelsData}    คุณ g
