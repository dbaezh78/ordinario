@echo off
setlocal enabledelayedexpansion

:: Ruta base (donde está este script)
set "root=%~dp0"

:: Recorre cada carpeta de día (domingo, lunes, martes...)
for /d %%d in (*) do (
    if exist "%%d\src\" (
        echo Procesando: %%d
        cd "%%d"
        
        :: Tus comandos originales (adaptados)
        del /q "*.htm" 2>nul
        move "src\*.mp3" . 2>nul
        del /q /s "src\*.txt" 2>nul
        rd /q /s "src" 2>nul
        
        cd "%root%"
    )
)

echo Operación completada en todas las carpetas.
pause