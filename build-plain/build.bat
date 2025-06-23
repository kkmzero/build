:: Build: Batch script for building projects with Microsoft Visual C++ compiler.
:: Copyright (c) 2025 Ivan Kmeťo, licensed under the BSD Zero Clause License.

@echo off
setlocal enableextensions


set output_directory=Bin
set compiler_options=/W3 /WX- /Zi /Gm /Od /MDd /EHsc

set source_files=..\Project\main.cpp
set libraries=user32.lib
set output_executable=helloworld.exe


if "%~1" == "" (
    mkdir %output_directory%
    pushd %output_directory%
    cl %compiler_options% %source_files% /link %libraries% /OUT:%output_executable% /MACHINE:X64 /SUBSYSTEM:CONSOLE
    popd
    exit /b 0
) else if /i "%~1" == "run" (
    %output_directory%\%output_executable%
    exit /b 0
) else if /i "%~1" == "clean" (
    if exist "%output_directory%\" (
        echo | set /p=Removing directory 
        rmdir /s %output_directory%
    )
    exit /b 0
) else (
    echo Build: Argument "%~1" is not recognized.
    goto usage
)

:usage
echo Usage: build [run^|clean]
exit /b 1
