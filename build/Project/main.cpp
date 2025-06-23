#include <Windows.h>

int CALLBACK WinMain(HINSTANCE Instance, HINSTANCE PrevInstance, LPSTR CmdLine, int CmdShow)
{

#ifdef _DEBUG
    MessageBoxA(0, "Hello From Debug!", "Debug Build", MB_OK | MB_ICONINFORMATION);
#else
    MessageBoxA(0, "Hello From Release!", "Release Build", MB_OK | MB_ICONINFORMATION);
#endif

    return 0;
}
