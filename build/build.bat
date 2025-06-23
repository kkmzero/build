:: Build: Batch script for building projects with Microsoft Visual C++ compiler.
:: Copyright (c) 2025 Ivan Kmeťo, licensed under the BSD Zero Clause License.

@echo off
setlocal enableextensions


set debug_directory=Debug
set debug_compiler_options=/W3 /WX- /Zi /Gm /Od /MDd

set release_directory=Release
set release_compiler_options=/W3 /WX /Gm- /O2 /MD
set release_files_cleanup=*.obj; *.pdb

set source_files=..\Project\main.cpp
set libraries=user32.lib
set output_executable=helloworld.exe


if /i "%~1" == "debug" (
    if "%~2" == "" (
        mkdir %debug_directory%
        pushd %debug_directory%
        cl %debug_compiler_options% %source_files% /link %libraries% /OUT:%output_executable% /MACHINE:X64 /SUBSYSTEM:WINDOWS
        popd
        exit /b 0
    ) else if /i "%~2" == "clean" (
        if exist "%debug_directory%\" (
            echo | set /p=Removing directory 
            rmdir /s %debug_directory%
        )
        exit /b 0
    ) else if /i "%~2" == "run" (
        %debug_directory%\%output_executable%
        exit /b 0
    ) else (
        echo Build: Argument "%~2" is not recognized.
        goto usage
    )
) else if /i "%~1" == "release" (
    if "%~2" == "" (
        mkdir %release_directory%
        pushd %release_directory%
        cl %release_compiler_options% %source_files% /link %libraries% /OUT:%output_executable% /MACHINE:X64 /SUBSYSTEM:WINDOWS
        del /s %release_files_cleanup%
        popd
        exit /b 0
    ) else if /i "%~2" == "clean" (
        if exist "%release_directory%\" (
            echo | set /p=Removing directory 
            rmdir /s %release_directory%
        )
        exit /b 0
    ) else if /i "%~2" == "run" (
        %release_directory%\%output_executable%
        exit /b 0
    ) else (
        echo Build: Argument "%~2" is not recognized.
        goto usage
    )
) else if "%~1" == "" (
    call %~0 debug
    exit /b 0
) else if /i "%~1" == "run" (
    call %~0 debug run
    exit /b 0
) else if /i "%~1" == "clean" (
    call %~0 debug clean
    exit /b 0
) else (
    echo Build: Argument "%~1" is not recognized.
    goto usage
)

:usage
echo Usage: build [debug^|release^|run^|clean] [run^|clean]
exit /b 1
