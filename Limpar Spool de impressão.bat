@echo off
echo Interrompendo o Spool de Impressão.
echo.
net stop spooler
echo Limpando a fila de Impressão.
echo.
del /Q /F /S “%systemroot%\System32\Spool\Printers\*.*
echo Reiniciando o Spool de Impressão.
echo.
net start spooler
echo
echo Feito.