*** Settings ***
Resource          ../../resourses/init_website.robot
Resource          ../../resourses/import.robot
Test Setup        Run Keywords    Open Chrome Browser    chrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result with date

*** Test Cases ***
Booking_Test
    [Documentation]    test
    [Tags]    Booking    UAT    Run
    b2c_call_car_pick_up_parcel_page.Get The Highest Displayed Date And Set New Highest Date 2
