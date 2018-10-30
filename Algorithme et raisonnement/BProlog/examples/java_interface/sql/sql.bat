@echo off
rem set BPDIR=c:\BProlog
set path=%BPDIR%;%path%
java -cp .;%BPDIR%\plc.jar;c:/mysql-connector-java-5.0.8/mysql-connector-java-5.0.8-bin.jar sql
