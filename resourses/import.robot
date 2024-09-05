*** Settings ***
Library                     SeleniumLibrary
Library                     String
Library                     Collections
Library                     OperatingSystem
Library                     RequestsLibrary
Library                     DateTime
Resource                    config/uat/env_config.robot
Resource                    ../keywords/pages/common/common.robot
Resource                    ../keywords/pages/landing_page.robot
Resource                    ../keywords/pages/login_dps/login_dps.robot
Resource                    ../keywords/pages/login_b2c/login_b2c.robot
Resource                    locators/landing_page.robot
Resource                    locators/login_dps/login_dps.robot
Variables                   testdata/login_user.yaml

