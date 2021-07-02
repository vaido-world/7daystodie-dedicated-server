@ECHO OFF
setlocal enabledelayedexpansion
IF NOT EXIST upnpc-static.exe (
	for /f delims^=^"^ tokens^=4 %%i in ('curl -s https://api.github.com/repos/miniupnp/miniupnp/releases/latest ^| findstr ^"browser_download_url.*zip^""
	') do (
	curl --location "%%i" > "%%~nxi"
	set "miniupnp_filename=%%~nxi"
	)
		echo !miniupnp_filename! sdc
	tar --extract --file=!miniupnp_filename! upnpc-static.exe
	del "!miniupnp_filename!"

)

upnpc-static.exe -d 26900 tcp
upnpc-static.exe -d 26900 udp
upnpc-static.exe -d 26901 udp
upnpc-static.exe -d 26902 udp

set ip_address_string="IPv4 Address"
rem Uncomment the following line when using older versions of Windows without IPv6 support (by removing "rem")
rem set ip_address_string="IP Address"
for /f "usebackq tokens=2 delims=:" %%f in (`ipconfig ^| findstr /c:%ip_address_string%`) do (
    echo Your IP Address is: %%f
    set "ip_address=%%f"

)

upnpc-static -a %ip_address% 26900 26900 tcp
upnpc-static -a %ip_address% 26900 26900 udp

upnpc-static -a %ip_address% 26901 26901 udp
upnpc-static -a %ip_address% 26902 26902 udp

pause