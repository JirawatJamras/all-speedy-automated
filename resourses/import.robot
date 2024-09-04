*** Settings ***
Library                     SeleniumLibrary
Library                     String
Library                     Collections
Library                     OperatingSystem
Library                     RequestsLibrary
Library                     DateTime
Resource                    config/uat/env_config.robot
Resource                    ../keywords/common.robot
Resource                    ../keywords/pages/landing_page.robot
Resource                    ../keywords/pages/login_page.robot
Resource                    locators/landing_page.robot
Resource                    locators/login_page.robot
Variables                   testdata/login_user.yaml

