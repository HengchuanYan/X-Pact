rem ipconfig |findstr /i 10.206.124
ipconfig |findstr /i 192.168.115
if %errorlevel%==0 (
goto dhcp 
) else (
goto static
)

:static
rem netsh interface ip set address name="Local Area Connection" source=static addr=10.206.124.147 mask=255.255.255.192 gateway=10.206.124.254 gwmetric=1
netsh interface ip set address name="Local Area Connection 4" source=static addr=192.168.115.233 mask=255.255.255.192 gateway=192.168.115.1 gwmetric=1
goto end

:dhcp
netsh interface ip set address name="Local Area Connection 4" source=dhcp

:end
exit
