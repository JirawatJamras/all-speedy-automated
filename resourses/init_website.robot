*** Settings ***
Library                     SeleniumLibrary        run_on_failure=Capture Page Screenshot
Library                     BuiltIn
Library                     String
Library                     Collections
Library                     OperatingSystem
Library                     RequestsLibrary
Library                     DateTime
Library                     config/python/CustomSeleniumLibrary.py