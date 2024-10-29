Install Python and Visual Studio Code


Install Python:
    Go to the Python website and download the latest version suitable for your operating system.
Run the installer and ensure you check the option “Add Python to PATH” during installation.


Verify the installation by opening a Terminal (Mac/Linux) or Command Prompt (Windows) and typing:
    -python --version 3.12.0
    -python-3.12.0-amd64

Install Robot Framework:
    - requirement.txt


# all-speedy-automated
-- Run for Mac OS --
python -m robot -v ENV:uat -i UAT  ../testcases/c2c/allspeedy_c2c_001.robot

-- Run for Windows --
robot -v ENV:uat -i UAT  ../testcases/dps/
robot -v ENV:uat -i UAT  ../testcases/c2c/
robot -v ENV:uat -i Few  ../testcases/booking


# Pabot
-v คือ Environment                   #(\resources\config)
-i คือ Tag                           #[Tags]   UAT    Regression
-t คือ testcase เช่น -t *01*          #AllSpeedy_B2C_001_ID_1 
# Pabot
pabot --processes 3 -v ENV:uat -i UAT ..\testcases |  tee output.txt
python -m pabot --processes 3 -v ENV:uat -i UAT ../testcases/  |  tee output.txt

Report
     - results : log.html
     - results : report.html

