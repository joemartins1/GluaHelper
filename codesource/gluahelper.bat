:: GluaHelper
:: Version 1.0.0
:: Code source
:: By Joe


@echo off
CHCP 65001 > NUL
color 7
:: Variables
:: //

:: Menu principal
:menu
cls
title Glua Helper
type %appdata%\ascii.txt
echo Bienvenue sur GluaHelper
echo ------------------------------
echo - 1 Sructure d'Addon
echo - 2 Structure d'Entité
echo - 3 Structure de Swep
echo ------------------------------
echo.
set /p menuchoice=Que voulez vous générer:
	if "%menuchoice%"=="1" goto :addon
	if "%menuchoice%"=="2" goto :ent
	if "%menuchoice%"=="3" goto :swep
goto :menu

:: Menu Addon
:addon
cls
title Addon Creator
type %appdata%\ascii.txt
set /p addonname=Indique le nom de l'Addon:
echo ------------------------------
	if not exist %addonname% (
		mkdir %addonname% ) else cls & echo Cet Addon existe déjà !  & pause & goto :menu
mkdir %addonname%\lua\autorun\client & mkdir %addonname%\lua\autorun\server & mkdir %addonname%\materials & mkdir %addonname%\models
::Config.lua
call type %appdata%\credit.txt >> %addonname%\lua\autorun\%addonname%_config.lua
echo. >> %addonname%\lua\autorun\%addonname%_config.lua
echo Configuration >> %addonname%\lua\autorun\%addonname%_config.lua
:: Loader.lua
call type %appdata%\credit.txt >> %addonname%\lua\autorun\%addonname%_load.lua
echo. >> %addonname%\lua\autorun\%addonname%_load.lua
echo Loader >> %addonname%\lua\autorun\%addonname%_load.lua
cls
type %appdata%\ascii.txt
echo Addon crée avec succès sous le nom de %addonname%
pause
goto :menu

:: Menu ENT
:ent
cls
title Entities Creator
type %appdata%\ascii.txt
set /p entname=Indique le nom de l'Entité:
echo ------------------------------
	if not exist %entname% (
		mkdir %entname% ) else cls & echo Cette Entité existe déjà ! & pause & goto :menu
mkdir %entname%\lua\entities\%entname%
set entluafile=%entname%\lua\entities\%entname%\
:: Shared
	call type %appdata%\credit.txt >> %entluafile%shared.lua
	echo.  >> %entluafile%shared.lua
	echo ENT.Type = " " >> %entluafile%shared.lua
	echo ENT.Base = " " >> %entluafile%shared.lua
	echo. >> %entluafile%shared.lua
	echo ENT.PrintName= "%entname%" >> %entluafile%shared.lua
	set /p entcategory=Quel est la catégorie de l'ENT:
	echo ENT.Category= "%entcategory%" >> %entluafile%shared.lua
	set /p entauthor=Qui est le créateur de l'ENT:
	echo ENT.Author= "%entauthor%" >> %entluafile%shared.lua
	set /p entspawn=Entité Spawnable (True / False):
	echo.  >> %entluafile%shared.lua
	echo ENT.Spawnable = %entspawn% >> %entluafile%shared.lua
	echo ENT.AdminSpawnable = true >> %entluafile%shared.lua
	echo. >> %entluafile%shared.lua
	echo ENT.RenderGroup = >> %entluafile%shared.lua
	echo ENT.Model = " " >> %entluafile%shared.lua
:: Init
	call type %appdata%\credit.txt >> %entluafile%init.lua
	echo. >> %entluafile%init.lua
	echo AddCSLuaFile( "cl_init.lua" ) >> %entluafile%init.lua
	echo AddCSLuaFile( "shared.lua" ) >> %entluafile%init.lua
	echo include( "shared.lua" ) >> %entluafile%init.lua
::Client
	call type %appdata%\credit.txt >> %entluafile%cl_init.lua
	echo. >> %entluafile%cl_init.lua
	echo include('shared.lua') >> %entluafile%cl_init.lua
cls
type %appdata%\ascii.txt
echo Entité crée avec succès sous le nom de %entname%
pause
goto :menu

:: Menu Swep
:swep
cls
title Swep Creator
type %appdata%\ascii.txt
set /p swepname=Indique le nom du Swep:
echo ------------------------------
	if not exist %swepname% (
		mkdir %swepname% ) else cls & echo Ce Swep existe déjà !  & pause & goto :menu
mkdir %swepname%\lua\weapons\%swepname%
set swepluafile=%swepname%\lua\weapons\%swepname%\
:: Shared
	call type %appdata%\credit.txt >> %swepluafile%shared.lua
	echo.  >> %swepluafile%shared.lua
	echo SWEP.PrintName = "%swepname%" >> %swepluafile%shared.lua
	set /p swepcategory=Quel est la catégorie du Swep:
	echo SWEP.Category = "%swepcategory%" >> %swepluafile%shared.lua
	set /p swepauthor=Qui est le créateur du Swep ?:
	echo SWEP.Author = "%swepauthor%" >> %swepluafile%shared.lua
	set /p swepspawn=Swep Spawnable (True / False):
	echo. >> %swepluafile%shared.lua
	echo SWEP.Spawnable = %swepspawn% >> %swepluafile%shared.lua
	echo SWEP.AdminSpawnable = true >> %swepluafile%shared.lua
	echo. >> %swepluafile%shared.lua
	echo SWEP.Base = "weapon_base" >> %swepluafile%shared.lua
	echo SWEP.Primary.Damage = >> %swepluafile%shared.lua 
	echo SWEP.Primary.TakeAmmo = >> %swepluafile%shared.lua
	echo SWEP.Primary.ClipSize = >> %swepluafile%shared.lua
	echo SWEP.Primary.Ammo = "Pistol" >> %swepluafile%shared.lua
	echo SWEP.Primary.DefaultClip = >> %swepluafile%shared.lua
:: Init
	call type %appdata%\credit.txt >> %swepluafile%init.lua
	echo. >> %swepluafile%init.lua
	echo AddCSLuaFile( "cl_init.lua" ) >> %swepluafile%init.lua
	echo AddCSLuaFile( "shared.lua" ) >> %swepluafile%init.lua
	echo include( "shared.lua" ) >> %swepluafile%init.lua
::Client
	call type %appdata%\credit.txt >> %swepluafile%cl_init.lua
	echo. >> %swepluafile%cl_init.lua
	echo include('shared.lua') >> %swepluafile%cl_init.lua
	echo. >> %swepluafile%cl_init.lua
	echo SWEP.Slot =  >> %swepluafile%cl_init.lua
	echo SWEP.SlotPos = >> %swepluafile%cl_init.lua
	echo SWEP.DrawAmmo = >> %swepluafile%cl_init.lua
	echo SWEP.DrawCrosshair = >> %swepluafile%cl_init.lua
cls
type %appdata%\ascii.txt
echo Swep crée avec succès sous le nom de %swepname%
pause
goto :menu