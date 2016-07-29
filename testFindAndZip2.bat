DEL New.txt
setLocal EnableDelayedExpansion
For /f "tokens=* delims= " %%a in (difffiles.txt) do (
Set str=%%a
set str=!str:/src/main/java=/target/classes!
set str=!str:.java=.class!
echo !str!>>New.txt
)
ENDLOCAL

DEL New2.txt
cd d:\test\temp2
del *.* /Q
cd d:\test
setLocal EnableDelayedExpansion
For /f "tokens=* delims= " %%a in (New.txt) do (
Set str=%%a
set str=!str:/=\!
echo d:\test2!str!>>New2.txt
)
ENDLOCAL

setLocal EnableDelayedExpansion
For /f "tokens=* delims= " %%a in (New2.txt) do (
Set str=%%a
echo !str!
copy !str! d:\test\temp2
)
ENDLOCAL
cd d:\test\temp2
"C:\Program Files\Java\jdk1.8.0_101\bin\jar" -cvf sample.jar .
copy d:\test\temp2\*.jar d:\test2\demo\target
exit 0