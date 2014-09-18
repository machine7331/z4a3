@echo off
echo Starting MySQL database. Please wait 5-10 seconds.
start /D.\MySQL\ MySQL.bat
ping 127.0.0.1 -n 5 >NUL
.\MySQL\cecho {0A}	OK.{07}
echo.
echo.
echo.
echo Executing spawn script...
.\MySQL\bin\mysql.exe --user=dayz --password=dayz --host=127.0.0.1 --port=3306 --database=hive --execute="call pMain(1)"
ping 127.0.0.1 -n 5 >NUL
.\MySQL\cecho {0A}	OK.{07}
echo.
echo.
echo.
echo Starting server...
start arma3server.exe -port=2312 -mod=@hive;@z4a3 -name=cfgdayz -config=cfgdayz\z4a3.cfg -cfg=cfgdayz\arma2.cfg -profiles=cfgdayz
.\MySQL\cecho {0A}	OK.{07} 
echo.
echo.
echo.
ping 127.0.0.1 -n 5 >NUL
exit