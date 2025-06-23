# Build

Build is a batch script for building projects with Microsoft Visual C++ compiler. Build provides only few fundamental commands for building projects from command interpreter cmd.exe on Windows NT operating systems. Developers should treat this script as bare-bones template and modify it to fit their project's configuration. This script is not intended to replace your established workflow but it can be useful if you want to quickly set up a new project and get it going.

Simplified version of the script can be found in ```build-plain``` folder. This simplified version should be suitable for developers who do not need to split their builds into separate modes. Each version of this script contains Project folder with minimal source code example for testing.

## Initial Configuration

You should run Build only in instance of cmd.exe with accessible MSVC compiler. You can run ```cl``` command to ensure that you have MSVC compiler available. More information about MSVC can be found in Microsoft's online [documentation](https://learn.microsoft.com/en-us/cpp/build/reference/c-cpp-building-reference?view=msvc-170).

Essential variables for build configurations are located in the beginning of each build.bat file. By default, linker options are not factored out to separate variables for the sake of simplicity. Structure of the scripts should be simple enough to understand and modify. Both versions of this script create additional folder (or folders) for compiled projects.

Please note that default compiler options, which were slightly inspired by Visual Studio's defaults, are not suitable for most projects, at least in my personal experience. Additionally, newer versions of MSVC might produce warning about deprecated ```/Gm``` option.

## Usage

You should be able to build example project with commands:
```bat
build debug
build release
```

To run the example project you can use ```run``` argument:
```bat
build debug run
build release run
```

Argument ```clean``` will remove the whole folder of given build:
```bat
build debug clean
build release clean
```

It is possible to omit ```debug``` argument altogether and cmd.exe can obviously chain multiple commands:
```bat
build
build run
build clean

build && build run
...
```

Simplified version of this script does not have ```debug``` and ```release``` arguments.

## License

Copyright (c) 2025 Ivan Kmeťo.

Licensed under the [BSD Zero Clause](LICENSE.txt) license.
