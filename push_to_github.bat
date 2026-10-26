@echo off
chcp 65001 >nul
cd /d "%~dp0"
echo ========================================================
echo 🚀 國小四年級國文與自然闖關遊戲 —— 一鍵發布至 GitHub
echo ========================================================
echo.
echo 1. 正在同步最新檔案...
copy /y "H:\真真\國文\四上\index.html" "index.html" >nul
copy /y "H:\真真\國文\四上\science.html" "science.html" >nul
echo    [OK] 檔案已就緒！
echo.
echo 2. 正在上傳至 GitHub (bgbgterry/Study_game)...
git add .
git commit -m "feat: add multi-player cookie switching, frequent mistake tracking, and mistake review quiz notebook" >nul 2>&1
git push origin main
echo.
if %errorlevel% equ 0 (
    echo ========================================================
    echo 🎉 恭喜！遊戲已成功發布至 GitHub Pages！
    echo 🔗 國語成語闖關網址：https://bgbgterry.github.io/Study_game/
    echo 🔬 自然科學闖關網址：https://bgbgterry.github.io/Study_game/science.html
    echo ========================================================
) else (
    echo ⚠️ 若跳出 GitHub 登入視窗，請點選「Sign in with your browser」進行授權後即可完成上傳！
)
echo.
pause
