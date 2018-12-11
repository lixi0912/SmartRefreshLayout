@ECHO OFF

type %~dp0app\build.gradle | findstr "buildToolsVersion"

findstr /i "buildToolsVersion" %~dp0app\build.gradle

set str=    buildToolsVersion '27.0.3'
echo ��ǰӲ�̵ķ����У�
for /f %%i in (%str%) do echo %%i
rem for %%i in (%str%) do if exist %%i: echo %%i:



SET sdk=null
SET tool=null

FOR /F "delims==" %%i IN ('findstr /i "sdk.dir" local.properties') DO SET sdk=%%i
FOR /F "delims= " %%i IN ('findstr /i "buildToolsVersion" %~dp0app\build.gradle') DO SET tool=%%i


REM FOR /F %%i IN ('type %~dp0app\build.gradle') DO ECHO %%i

findstr /i "sdk.dir" local.properties
findstr /i "buildToolsVersion" %~dp0app\build.gradle

rem type %~dp0app\build.gradle
rem type local.properties

echo tool=%tool%
echo sdk=%sdk%

IF %sdk% == null (
    ECHO û�ҵ�SDK���ű���ֹ
    GOTO END
)

SET sdk=%sdk:\\=\%
SET sdk=%sdk:\:=:%
set sdk=%sdk%\build-tools\28.0.3\dx.bat

echo skk=%sdk%

rem %sdk%
rem ./gradlew assemble
rem dx --dex --verbose --no-strict --output=refresh-layout/build/intermediates/intermediate-jars/debug/classes.jar.dex refresh-layout/build/intermediates/intermediate-jars/debug/classes.jar
rem https://github.com/mihaip/dex-method-counts
rem java -jar ./art/dex-method-counts.jar --filter=all --output-style=tree --package-filter=com.scwang.smartrefresh refresh-layout/build/intermediates/intermediate-jars/debug/classes.jar.dex

:END