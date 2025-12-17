@echo off
echo ========================================
echo ATENCAO: Isso vai DESABILITAR o Firewall
echo Por favor, REATIVE depois do teste!
echo ========================================
pause

netsh advfirewall set allprofiles state off

echo.
echo Firewall DESABILITADO!
echo.
echo Agora teste o app no celular
echo.
echo Para REATIVAR o Firewall, execute: reativar_firewall.bat
pause
