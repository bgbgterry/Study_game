@echo off
chcp 65001 >nul
echo ========================================================
echo 🚀 國小四年級國文與自然闖關遊戲 —— 一鍵發布至 GitHub
echo ========================================================
echo.
cd /d "C:\Users\bgbg\.gemini\antigravity\brain\b3c73310-ceda-4217-acd4-10a4453fe75f\scratch\Study_game_repo"
echo 1. 正在同步最新檔案...
copy /y "H:\真真\國文\四上\index.html" "index.html" >nul
copy /y "H:\真真\國文\四上\science.html" "science.html" >nul
copy /y "H:\真真\國文\四上\game_data.js" "game_data.js" >nul
copy /y "H:\真真\國文\四上\idioms_data.json" "idioms_data.json" >nul
copy /y "H:\真真\國文\四上\science_game_data.js" "science_game_data.js" >nul
copy /y "H:\真真\國文\四上\science_data.json" "science_data.json" >nul
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
    echo ⚠️ 若跳出 GitHub 授權視窗，請點選「Sign in with your browser」進行授權後即可完成上傳！
)
echo.
pause
