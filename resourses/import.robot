*** Settings ***
Resource                    ../keywords/pages/common.robot
# Resource                    config/${ENV}/env_config.robot
Resource                    config/uat/env_config.robot
Variables                   testdata/login_user.yaml

######################## B2C ########################
Resource                    ../keywords/pages/b2c/b2c_login_page.robot
Resource                    ../keywords/pages/b2c/b2c_forgot_password_page.robot
Resource                    ../keywords/pages/b2c/b2c_home_page.robot
Resource                    ../keywords/pages/b2c/b2c_booking_delivery_page.robot
Resource                    ../keywords/pages/b2c/b2c_create_parcel_page.robot
Resource                    ../keywords/pages/b2c/b2c_tracking_parcel_delivery_page.robot
Resource                    ../keywords/pages/b2c/b2c_my_parcel_page.robot
Resource                    ../keywords/pages/b2c/b2c_call_car_pick_up_parcel_page.robot
Resource                    ../keywords/pages/b2c/b2c_favorite_page.robot

Resource                    locators/b2c/b2c_login_page.robot
Resource                    locators/b2c/b2c_forgot_password_page.robot
Resource                    locators/b2c/b2c_home_page.robot
Resource                    locators/b2c/b2c_booking_delivery_page.robot
Resource                    locators/b2c/b2c_create_parcel_page.robot
Resource                    locators/b2c/b2c_tracking_parcel_delivery_page.robot
Resource                    locators/b2c/b2c_my_parcel_page.robot
Resource                    locators/b2c/b2c_call_car_pick_up_parcel_page.robot
Resource                    locators/b2c/b2c_favorite_page.robot

Variables                   testdata/b2c/b2c_login_001.yaml
Variables                   testdata/b2c/b2c_forgotpassword_002.yaml
Variables                   testdata/b2c/b2c_addbooking_003.yaml
Variables                   testdata/b2c/b2c_searchtracking_006.yaml
Variables                   testdata/b2c/b2c_managemybooking_007.yaml
Variables                   testdata/b2c/b2c_addpickuptime_008.yaml
Variables                   testdata/b2c/b2c_addfavoriteitem_010.yaml

######################## C2C ########################
Resource                    ../keywords/pages/c2c/c2c_landing_page.robot
Resource                    ../keywords/pages/c2c/c2c_login.robot
Resource                    ../keywords/pages/c2c/c2c_profile_page.robot
Resource                    ../keywords/pages/c2c/c2c_login.robot
Resource                    ../keywords/pages/c2c/c2c_login_seven_page.robot
Resource                    ../keywords/pages/c2c/c2c_tracking_page.robot

Resource                    locators/c2c/c2c_landing_page.robot
Resource                    locators/c2c/c2c_login.robot
Resource                    locators/c2c/c2c_profile_page.robot
Resource                    locators/c2c/c2c_login_seven_page.robot
Resource                    locators/c2c/c2c_tracking_page.robot

Variables                   testdata/c2c/c2c_testdata.yaml
Variables                   testdata/c2c/allspeedy_c2c_001.yaml

######################## DPS ########################
Resource                    ../keywords/pages/dps/dps_landing_page.robot
Resource                    ../keywords/pages/dps/dps_login_page.robot
Resource                    ../keywords/pages/dps/dps_home_page.robot

Resource                    locators/dps/dps_landing_page.robot
Resource                    locators/dps/dps_login_page.robot
Resource                    locators/dps/dps_home_page.robot

Variables                   testdata/dps/dps_testdata.yaml
Variables                   testdata/dps/allspeedy_dps_001.yaml
Variables                   testdata/dps/allspeedy_dps_003.yaml

######################## REGISTER ########################
Resource                    ../keywords/pages/register/register_general_customers_page.robot
Resource                    ../keywords/pages/register/register_business_customers_page.robot
Resource                    ../keywords/pages/register/register_business_customers_register_page.robot

Resource                    locators/register/register_business_customers_page.robot
Resource                    locators/register/register_general_customers_page.robot
Resource                    locators/register/register_business_customers_register_page.robot

Variables                   testdata/register/allspeedy_register_001.yaml
Variables                   testdata/register/allspeedy_register_004.yaml

######################## SPS ########################
Resource                    ../keywords/pages/sps/sps_landing_page.robot
Resource                    ../keywords/pages/sps/sps_login_page.robot

Resource                    locators/sps/sps_login_page.robot
Resource                    locators/sps/sps_landing_page.robot

Variables                   testdata/sps/SPS_Login_001.yaml