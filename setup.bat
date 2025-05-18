@echo off 
REM SOAI 2025 Tech Stack Setup Script 
REM This script automates the installation of the development environment for the SOAI 2025 project. 
REM Requirements: Git (2.0+), Python (3.11+), uv (0.7+), VS Code (1.99+), and Python packages. 
 
REM Step 1: Check for prerequisites (Git and Python) 
echo Checking for Git... 
git --version >nul 2>&1 
if %0% neq 0 ( 
    echo Git is not installed. Please download and install Git from https://git-scm.com/downloads (version 2.0 or higher). 
    exit /b 1 
) 
 
echo Checking for Python 3.11... 
python --version 2>&1 | findstr /R "3\.11\." >nul 
if %0% neq 0 ( 
    echo Python 3.11 or higher is not installed. Please download and install Python 3.11 from https://www.python.org/downloads/. 
    exit /b 1 
) 
 
REM Step 2: Check for curl (needed to install uv) 
echo Checking for curl... 
curl --version >nul 2>&1 
if %0% neq 0 ( 
    echo curl is not installed. Please install curl or ensure it is in your PATH. 
    echo You can download Git (which includes curl) from https://git-scm.com/downloads. 
    exit /b 1 
) 
 
REM Step 3: Install uv (package and project manager) 
echo Installing uv... 
curl -LsSf https://astral.sh/uv/install.sh | sh 
if %0% neq 0 ( 
    echo Failed to install uv. Check your internet connection and try again. 
    exit /b 1 
) 
 
REM Step 4: Add uv to PATH temporarily 
echo Adding uv to PATH... 
set "PATH=%C:\Program Files\Common Files\Oracle\Java\javapath;C:\WINDOWS\system32;C:\WINDOWS;C:\WINDOWS\System32\Wbem;C:\WINDOWS\System32\WindowsPowerShell\v1.0\;C:\WINDOWS\System32\OpenSSH\;C:\Program Files\nodejs\;C:\php-8.4.6;C:\Users\namra\Downloads\php-8.4.6-Win32-vs17-x64;C:\composer;C:\Program Files\Git\cmd;C:\Users\namra\.local\bin;C:\Program Files\MySQL\MySQL Shell 8.0\bin\;C:\Users\namra\AppData\Local\Programs\Python\Python313\Scripts\;C:\Users\namra\AppData\Local\Programs\Python\Python313\;C:\Users\namra\AppData\Local\Programs\Python\Python312\Scripts\;C:\Users\namra\AppData\Local\Programs\Python\Python312\;C:\Users\namra\AppData\Local\Programs\Python\Python310\Scripts\;C:\Users\namra\AppData\Local\Programs\Python\Python310\;C:\Users\namra\AppData\Local\Programs\Python\Python311\Scripts\;C:\Users\namra\AppData\Local\Programs\Python\Python311\;C:\Users\namra\AppData\Local\Microsoft\WindowsApps;C:\Program Files\JetBrains\IntelliJ IDEA Community Edition 2022.3.3\bin;;C:\Users\namra\AppData\Local\Programs\Microsoft VS Code\bin;C:\Users\namra\AppData\Local\Google\Cloud SDK\google-cloud-sdk\bin;C:\Users\namra\AppData\Roaming\npm;C:\Users\namra\AppData\Roaming\Composer\vendor\bin;C:\Users\namra\AppData\Local\Programs\Ollama%;%C:\Users\namra%\%.local\bin" 
 
REM Step 5: Verify uv version (must be 0.7 or higher) 
echo Checking uv version... 
uv --version | findstr /R "0\.[7-9]\." >nul 
if %0% neq 0 ( 
    echo uv version 0.7 or higher is required. Installed version does not meet the requirement. 
    echo Please update uv by running: uv self update 
    exit /b 1 
) 
 
REM Step 6: Create a virtual environment named 'swecha' 
echo Setting up virtual environment... 
uv venv --python 3.11 swecha 
if %0% neq 0 ( 
    echo Failed to create virtual environment. Ensure Python 3.11 is installed and try again. 
    exit /b 1 
) 
 
REM Step 7: Activate the virtual environment 
call swecha\Scripts\activate 
 
REM Step 8: Install required Python packages 
echo Installing Python packages... 
uv pip install numpy pandas streamlit ruff jupyter ipykernel watchdog 
if %0% neq 0 ( 
    echo Failed to install Python packages. Check your internet connection and try again. 
    exit /b 1 
) 
 
REM Step 9: Print completion message and manual steps 
echo Setup complete! 
echo. 
echo Next steps: 
echo 1. Install Visual Studio Code (version 1.99 or higher) from https://code.visualstudio.com/ if not already installed. 
echo 2. Open VS Code and install the following extensions: 
echo    - Ruff 
echo    - Python (includes Python Debugger) 
echo    - Jupyter 
echo    - Cline 
echo 3. Add %C:\Users\namra%\%.local\bin to your Windows PATH for permanent access to uv. 
echo    - Search for "Environment Variables" in the Start menu, edit the "Path" variable, and add the directory. 
echo 4. Open VS Code in this directory (type 'code .' in the terminal) and select the Python interpreter from the 'swecha' virtual environment. 
