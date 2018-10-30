@echo off
set BPDIR=c:\BProlog
set path=%BPDIR%;%path%
java -cp .;%BPDIR%\plc.jar draw

