@echo off
setlocal EnableExtensions EnableDelayedExpansion
chcp 65001 >nul

cd /d "%~dp0"

set "GIT_EXE=C:\Program Files\Git\cmd\git.exe"
if not exist "%GIT_EXE%" set "GIT_EXE=git"

echo.
echo ========================================
echo Kong blog deploy script
echo ========================================
echo.

where npm.cmd >nul 2>nul
if errorlevel 1 (
  echo [ERROR] npm.cmd was not found. Please install Node.js first.
  pause
  exit /b 1
)

echo [1/5] Building site...
call npm.cmd run build
if errorlevel 1 (
  echo.
  echo [ERROR] Build failed. Fix the errors above before pushing.
  pause
  exit /b 1
)

echo.
echo [2/5] Checking Git status...
"%GIT_EXE%" status --short
if errorlevel 1 (
  echo.
  echo [ERROR] Git is not available or this folder is not a Git repository.
  pause
  exit /b 1
)

set "HAS_CHANGES="
for /f "delims=" %%i in ('"%GIT_EXE%" status --porcelain') do set "HAS_CHANGES=1"

if defined HAS_CHANGES (
  echo.
  echo [3/5] Creating commit...
  "%GIT_EXE%" add .

  set "COMMIT_MSG=%~1"
  if "%COMMIT_MSG%"=="" set "COMMIT_MSG=Update Kong blog %date% %time%"

  "%GIT_EXE%" commit -m "%COMMIT_MSG%"
  if errorlevel 1 (
    echo.
    echo [ERROR] Commit failed.
    pause
    exit /b 1
  )
) else (
  echo.
  echo [3/5] No local changes to commit.
)

echo.
echo [4/5] Pushing to public repository origin/main...
"%GIT_EXE%" push origin main
if errorlevel 1 (
  echo.
  echo [ERROR] Push to origin failed.
  pause
  exit /b 1
)

echo.
echo [5/5] Pushing to private repository security/main...
"%GIT_EXE%" remote get-url security >nul 2>nul
if errorlevel 1 (
  echo [WARN] Remote "security" was not found. Skipping private repository push.
) else (
  "%GIT_EXE%" push security main
  if errorlevel 1 (
    echo.
    echo [ERROR] Push to security failed.
    pause
    exit /b 1
  )
)

echo.
echo ========================================
echo Deploy push completed successfully.
echo GitHub Actions will build GitHub Pages.
echo ========================================
echo.
pause
