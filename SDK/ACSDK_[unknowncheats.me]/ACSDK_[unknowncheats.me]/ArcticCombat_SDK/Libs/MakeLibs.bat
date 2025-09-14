@echo off
call "C:\Program Files (x86)\Microsoft Visual Studio 11.0\VC\vcvarsall.bat" x86
lib /machine:x86 /def:Window.def
lib /machine:x86 /def:Core.def
lib /machine:x86 /def:Engine.def
lib /machine:x86 /def:BTData.def
lib /machine:x86 /def:BatteryNet.def
lib /machine:x86 /def:WinDrv.def
lib /machine:x86 /def:IpDrv.def
lib /machine:x86 /def:Editor.def
lib /machine:x86 /def:Fire.def
lib /machine:x86 /def:XInterface.def
lib /machine:x86 /def:UWeb.def
lib /machine:x86 /def:D3D9Drv.def
lib /machine:x86 /def:BatteryUI.def
lib /machine:x86 /def:WGame.def
lib /machine:x86 /def:ALAudio.def
