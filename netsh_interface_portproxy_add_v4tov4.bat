wsl hostname -I
for /f "usebackq delims=" %%A in (`wsl hostname -I`) do set wsladdress=%%A
netsh interface portproxy add v4tov4 listenaddress=0.0.0.0 listenport=50022 connectaddress=%wsladdress% connectport=22
netsh interface portproxy delete v4tov4 listenaddress=0.0.0.0 listenport=1234
netsh interface portproxy show all
wsl -u root -- service ssh start
wsl -u root -- service ssh status



set /p xxx="Press any key"