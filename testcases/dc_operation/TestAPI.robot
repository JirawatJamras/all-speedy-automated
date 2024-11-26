*** Settings ***
Library    SeleniumLibrary
Library    Python
Force Tags    UAT

*** Test Cases ***
Press Appropriate Key Based on OS
    ${os} =    Evaluate    platform.system().lower()    modules=platform
    Run Keyword If    'darwin' == '${os}'    Press Key ESC  # macOS
    ...               ELSE IF    'windows' in ${os}    Press Key Space  # Windows
    ...               ELSE    Log    Unsupported OS

*** Keywords ***
Press Key ESC
    Press Key    None    ESC

Press Key Space
    Press Key    None    SPACE
