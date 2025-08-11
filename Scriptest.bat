@echo off 
echo.
echo     __________________
echo    / ____/_  __/ ____/
echo   / /_    / / / __/   
echo  / __/   / / / /___   
echo /_/     /_/ /_____/   
                       

:menu
rem cls
rem pular linhas
echo.
echo. 
echo Meu Script de Manutencao de Fernando Teixeira Eleuterio

rem pular linhas
echo.
      

echo 1. Reparo de Arquivos de Sistema
echo 2. Reparo da Imagem do Sistema
echo 3. Limpeza de Arquivos Temporarios
echo 4. Desfragmentar Unidade C
echo 5. Informacao de Sistema
echo 6. Informacao Serie Bios
echo 7. Informacao de Bateria Notebook
echo 8. Limpar spool de impressao
echo 9. Sair

set /p escolha=Escolha uma opcao: 
if "%escolha%"=="1" goto opcao1
if "%escolha%"=="2" goto opcao2
if "%escolha%"=="3" goto opcao3
if "%escolha%"=="4" goto opcao4
if "%escolha%"=="5" goto opcao5
if "%escolha%"=="6" goto opcao6
if "%escolha%"=="7" goto opcao7
if "%escolha%"=="8" goto opcao8
if "%escolha%"=="9" goto sair

goto menu

:opcao1
echo Voce escolheu a opcao 1!
sfc /scannow
pause
goto menu

:opcao2
echo Voce escolheu a opcao 2!
DISM /Online /Cleanup-Image /ScanHealth
DISM /Online /Cleanup-Image /RestoreHealth
pause

goto menu


:opcao3
echo Voce escolheu a opcao 3!
rem Faz limpeza dos arquivos temporários do Windows
del c:\Windows\Temp\* /s /q
rem Faz limpeza dos arquivos temporários da pasta TEMP na raíz
del /q/f/s %temp%\*
rem Faz limpeza dos arquivos temporarios dos usuários no appdata
/d %%F in (C:\Users\*) do del %%F\AppData\Local\Temp\* /s /q

pause
goto menu

:opcao4
echo Voce escolheu a opcao 4!
rem defrag C: /U /V
defrag C: -f /v
rem se for fazer o script em execução em lote colocar shutdow -s no final para que ao concluir a desfragmentação o comando shutdow execute sem precisar precionar a tecla

pause
goto menu

:opcao5
echo Voce escolheu a opcao 5!
rem Verifica informações completas do Sistema
systeminfo

pause
goto menu

:opcao6
echo Voce escolheu a opcao 6!
rem Verifica número de série da BIOS
wmic bios get serialnumber

pause
goto menu


:opcao7
echo Voce escolheu a opcao 7!
rem Informação da bateria gerando arqwuivo .html
powercfg /batteryreporte
pause
goto menu

:opcao8
echo Voce escolheu a opcao 8!
rem Limpar spool de impressão
echo Limpando a fila de Impressao.
rem Parando o serviço
net stop spooler
pause
echo.
rem del /Q /F /S “%systemroot%\System32\Spool\Printers\*.*
del %systemroot%\System32\spool\printers\* /Q
echo Reiniciando o Spool de Impressão.
pause
echo.
net start spooler
echo
echo Feito.

:opcao9
:sair
exit
