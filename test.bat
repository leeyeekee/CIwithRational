d:
cd d:\test2
IF NOT EXIST d:\test2\demo GOTO NODIR
del *.* /S /Q
rmdir demo /S /Q
:NODIR
d:
cd d:\test
del difffiles.txt
c:
cd "C:\Rational\scmtool\jazz\scmtools\eclipse"
call lscm.bat login -r https://clm.demo.com:9443/ccm -u clmadmin -P passw0rd 
call lscm.bat load -r https://clm.demo.com:9443/ccm "Demo Stream Workspace" -d "d:\test2"
call lscm.bat compare -c "Demo Default Component" -f b -I dcbwsf -r https://clm.demo.com:9443/ccm baseline %1 baseline %2 >> "d:\test\"%3
call lscm.bat compare -c "Demo Default Component" -f b -I f -r https://clm.demo.com:9443/ccm baseline %1 baseline %2 >> "d:\test\difffiles.txt"
call lscm.bat logout -r https://clm.demo.com:9443/ccm 
exit 0



