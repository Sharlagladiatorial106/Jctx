@echo off
setlocal
:: ============================================================
:: Jctx.bat  -  Java Context Extractor
::
:: Usage:
::   Jctx.bat <project_folder> [flags]
::
:: Flags:
::   --no-tree   Omit the file-tree section
::   --print     Also print the report to this console window
::   --help -h   Show full help and exit
::
:: Examples:
::   Jctx.bat "My Project"
::   Jctx.bat "My Project" --no-tree
::   Jctx.bat "My Project" --print
::   Jctx.bat "My Project" --no-tree --print
::   Jctx.bat --help
::
:: Output:
::   context.txt  placed inside the project folder
:: ============================================================

if "%~1"=="" (
    python "%~dp0Jctx.py" --help
    exit /b 0
)

python --version >nul 2>&1
if errorlevel 1 (
    echo [ERROR] Python is not installed or not in PATH.
    echo Download it from https://python.org
    exit /b 1
)

if not exist "%~dp0Jctx.py" (
    echo [ERROR] Cannot find Jctx.py
    echo Make sure Jctx.py is in the same folder as this .bat file.
    exit /b 1
)

python "%~dp0Jctx.py" %*
endlocal
