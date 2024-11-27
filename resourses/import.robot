*** Settings ***
Resource                    ../keywords/pages/common.robot
Resource                    config/${ENV}/env_config.robot
Variables                   testdata/login_user.yaml
Variables                   config/language/${LANG}.yaml

######################## B2C ########################
Resource                    ../keywords/pages/booking/b2c_login_page.robot
Resource                    ../keywords/pages/booking/b2c_forgot_password_page.robot
Resource                    ../keywords/pages/booking/b2c_home_page.robot
Resource                    ../keywords/pages/booking/b2c_booking_delivery_page.robot
Resource                    ../keywords/pages/booking/b2c_create_parcel_page.robot
Resource                    ../keywords/pages/booking/b2c_tracking_parcel_delivery_page.robot
Resource                    ../keywords/pages/booking/b2c_my_parcel_page.robot
Resource                    ../keywords/pages/booking/b2c_call_car_pick_up_parcel_page.robot
Resource                    ../keywords/pages/booking/b2c_favorite_page.robot
Resource                    ../keywords/pages/booking/b2c_booking_detail_page.robot
Resource                    ../keywords/pages/booking/b2c_return_business_page.robot

Resource                    locators/booking/b2c_login_page.robot
Resource                    locators/booking/b2c_forgot_password_page.robot
Resource                    locators/booking/b2c_home_page.robot
Resource                    locators/booking/b2c_booking_delivery_page.robot
Resource                    locators/booking/b2c_create_parcel_page.robot
Resource                    locators/booking/b2c_tracking_parcel_delivery_page.robot
Resource                    locators/booking/b2c_my_parcel_page.robot
Resource                    locators/booking/b2c_call_car_pick_up_parcel_page.robot
Resource                    locators/booking/b2c_favorite_page.robot
Resource                    locators/booking/b2c_booking_detail_page.robot
Resource                    locators/booking/b2c_return_business_page.robot

Variables                   testdata/booking/booking.yaml

######################## C2C ########################
Resource                    ../keywords/pages/booking/c2c_landing_page.robot
Resource                    ../keywords/pages/booking/c2c_login.robot
Resource                    ../keywords/pages/booking/c2c_profile_page.robot
Resource                    ../keywords/pages/booking/c2c_login.robot
Resource                    ../keywords/pages/booking/c2c_login_seven_page.robot
Resource                    ../keywords/pages/booking/c2c_tracking_page.robot

Resource                    locators/booking/c2c_landing_page.robot
Resource                    locators/booking/c2c_login.robot
Resource                    locators/booking/c2c_profile_page.robot
Resource                    locators/booking/c2c_login_seven_page.robot

######################## DPS ########################
Resource                    ../keywords/pages/dc_operation/dps_landing_page.robot
Resource                    ../keywords/pages/dc_operation/dps_login_page.robot
Resource                    ../keywords/pages/dc_operation/dps_home_page.robot
Resource                    ../keywords/pages/dc_operation/dps_check_receiving_cycle_page.robot
Resource                    ../keywords/pages/dc_operation/dps_scan_page.robot
Resource                    ../keywords/pages/dc_operation/dps_pouch_page.robot
Resource                    ../keywords/pages/dc_operation/dps_history_parcel_page.robot
Resource                    ../keywords/pages/dc_operation/dps_wait_delivery.robot

Resource                    locators/dc_operation/dps_landing_page.robot
Resource                    locators/dc_operation/dps_login_page.robot
Resource                    locators/dc_operation/dps_home_page.robot
Resource                    locators/dc_operation/dps_check_receiving_cycle_page.robot
Resource                    locators/dc_operation/dps_scan_page.robot
Resource                    locators/dc_operation/dps_pouch_page.robot
Resource                    locators/dc_operation/dps_history_parcel_page.robot
Resource                    locators/dc_operation/dps_wait_delivery.robot

Variables                   testdata/dc_operation/dc_operation.yaml
Variables                   testdata/dc_operation/booking_dry_test_dc.yaml

######################## REGISTER ########################
Resource                    ../keywords/pages/register/register_general_customers_page.robot
Resource                    ../keywords/pages/register/register_business_customers_page.robot
Resource                    ../keywords/pages/register/register_business_pre_register.robot
Resource                    ../keywords/pages/register/register_business_profile_business.robot

Resource                    locators/register/register_business_customers_page.robot
Resource                    locators/register/register_general_customers_page.robot
Resource                    locators/register/register_business_pre_register.robot

Variables                   testdata/register/register.yaml
Resource                    testdata/filepath.robot

######################## PMS ########################
Resource                    ../keywords/pages/pms/pms_landing_page.robot
Resource                    ../keywords/pages/pms/pms_login_page.robot
Resource                    ../keywords/pages/pms/pms_home_page.robot
Resource                    ../keywords/pages/pms/pms_requests_page.robot
Resource                    ../keywords/pages/pms/pms_request_detail_page.robot

Resource                    locators/pms/pms_landing_page.robot
Resource                    locators/pms/pms_login_page.robot
Resource                    locators/pms/pms_home_page.robot
Resource                    locators/pms/pms_requests_page.robot
Resource                    locators/pms/pms_request_detail_page.robot

######################## Prerequisite ########################
Resource                    ../keywords/pages/dc_operation/prerequisite.robot