*** Settings ***
Resource                    config/uat/env_config.robot
Resource                    ../keywords/pages/common.robot
Resource                    ../resourses/init.robot

Resource                    ../keywords/pages/dps/dps_landing_page.robot
Resource                    ../keywords/pages/b2c/b2c_landing_page.robot

Resource                    ../keywords/pages/dps/dps_login.robot
Resource                    ../keywords/pages/b2c/b2c_login.robot

Resource                    locators/dps/dps_landing_page.robot
Resource                    locators/b2c/b2c_landing_page.robot

Resource                    locators/dps/dps_login.robot
Resource                    locators/b2c/b2c_login.robot
Variables                   testdata/login_user.yaml
Variables                   testdata/data_message.yaml

