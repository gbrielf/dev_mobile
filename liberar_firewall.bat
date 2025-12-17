@echo off
echo Liberando porta 8000 no Firewall do Windows...
netsh advfirewall firewall add rule name="Django Dev Server" dir=in action=allow protocol=TCP localport=8000
echo.
echo Regra criada com sucesso!
echo Agora teste acessar http://10.115.139.83:8000/admin/ no navegador do celular
pause
