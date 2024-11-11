Install Python and Visual Studio Code


Install Python:
    Go to the Python website and download the latest version suitable for your operating system.
Run the installer and ensure you check the option “Add Python to PATH” during installation.


Verify the installation by opening a Terminal (Mac/Linux) or Command Prompt (Windows) and typing:
    -python --version 3.12.0
    -python-3.12.0-amd64

Install Robot Framework:
    pip    install    -r requirement.txt


# all-speedy-automated
-- Run Command --
robot -v ENV:uat -i UAT  ../testcases/
robot -v ENV:uat -i UAT -v LANG:en  ../testcases/
robot -v ENV:uat -i UAT  ../testcases/booking
robot -v ENV:uat -i UAT  ../testcases/dc_operation


# Setting Command
-v คือ แทนค่าตัวแปร                    #(\resources\config)
-i คือ Tag                           #[Tags]   UAT    Booking    DC_Operation
-t คือ testcase เช่น -t *01*          #AllSpeedy_B2C_001_ID_1 


# Pabot
pabot --processes 3 -v ENV:uat -i UAT ..\testcases |  tee output.txt
python -m pabot --processes 3 -v ENV:uat -i UAT ../testcases/  |  tee output.txt

Report
     - Report : log.html
     - Report : report.html