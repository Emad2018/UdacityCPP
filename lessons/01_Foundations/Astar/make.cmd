@echo off
setlocal enabledelayedexpansion
cls
echo ==================================================
echo   Automated MSVC Build (Incremental vs Clean)
echo ==================================================
echo.
echo [1] Incremental Build (Fast - only builds changes)
echo [2] Clean Build       (Fresh - deletes old files first)
echo.
set /p choice="Choose build type [1 or 2]: "

if "%choice%"=="2" (
    echo.
    echo [!] Performing Clean Build...
    if exist build (
        echo Removing old build directory...
        rmdir /s /q build
    )
    if exist output (
        echo Removing old output directory...
        rmdir /s /q output
    )
) else (
    echo.
    echo [*] Performing Incremental Build...
)

:: Ensure directories exist
if not exist build mkdir build
if not exist output mkdir output

:: Navigate and build
cd build
echo Configuring project...
cmake ..

echo Compiling project...
cmake --build . --config Release

cd ..
echo.
echo ==================================================
echo   Build Complete! Output is in the 'output' folder.
echo ==================================================
echo.

:: --- New Selection Section ---
echo [1] Run the Output Executable
echo [2] Exit
echo.
set /p post_choice="What would you like to do next? [1 or 2]: "

if "%post_choice%"=="1" (
    echo.
    echo Launching application...
    echo --------------------------------------------------
    
    :: Search for any .exe inside the output folder and run it
    cd output
    for %%i in (*.exe) do (
        "%%i"
    )
    cd ..
    
    echo --------------------------------------------------
    echo Application execution terminated.
    pause
) else (
    echo Exiting build manager.
)
