@echo off
"C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\VC\Tools\MSVC\14.16.27023\bin\Hostx64\x64\editbin.exe" /NXCOMPAT /DYNAMICBASE %1
"C:\Program Files (x86)\Windows Kits\10\bin\10.0.16299.0\x64\signtool.exe" sign /f "C:\cert\mycert.pfx" /p 1234 %1
rem signtool.exe sign ... %1