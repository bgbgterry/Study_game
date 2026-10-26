# 設置輸出編碼為 UTF-8
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$OutputEncoding = [System.Text.Encoding]::UTF8

Write-Host "========================================================" -ForegroundColor Cyan
Write-Host "🚀 國小四年級 國語成語 ＆ 自然科學 闖關遊戲 —— 一鍵發布至 GitHub" -ForegroundColor Green
Write-Host "========================================================" -ForegroundColor Cyan
Write-Host ""

$sourceDir = "H:\真真\國文\四上"
$repoDir = "H:\真真\Study_game"

if (-not (Test-Path $repoDir)) {
    Write-Host "❌ 找不到發布倉庫目錄：$repoDir" -ForegroundColor Red
    exit 1
}

Write-Host "1. 正在同步最新檔案至發布目錄 ($repoDir)..." -ForegroundColor Yellow
$filesToSync = @(
    "index.html",
    "science.html",
    "game_data.js",
    "idioms_data.json",
    "science_game_data.js",
    "science_data.json"
)

foreach ($f in $filesToSync) {
    $src = Join-Path $sourceDir $f
    $dst = Join-Path $repoDir $f
    if (Test-Path $src) {
        Copy-Item -Path $src -Destination $dst -Force
        Write-Host "   [OK] 已同步：$f" -ForegroundColor Gray
    }
}

Write-Host "`n2. 正在檢查 Git 變更狀態..." -ForegroundColor Yellow
Set-Location $repoDir
git add .

$status = git status --porcelain
if ($status) {
    Write-Host "   [+] 偵測到更新，正在建立版本紀錄 (Git Commit)..." -ForegroundColor Gray
    git commit -m "feat: update question bank (210 questions, all 36 idioms covered) & multi-player cookie notebook"
} else {
    Write-Host "   [*] 本地已是最新版本，無需重複 Commit。" -ForegroundColor Gray
}

Write-Host "`n3. 正在上傳至 GitHub (bgbgterry/Study_game)..." -ForegroundColor Yellow
git pull origin main --rebase 2>$null
git push origin main

if ($LASTEXITCODE -eq 0) {
    Write-Host "`n========================================================" -ForegroundColor Green
    Write-Host "🎉 恭喜！遊戲已成功發布至 GitHub Pages！" -ForegroundColor Green
    Write-Host ""
    Write-Host "🔗 國語成語闖關網址：https://bgbgterry.github.io/Study_game/" -ForegroundColor Cyan
    Write-Host "🔬 自然科學闖關網址：https://bgbgterry.github.io/Study_game/science.html" -ForegroundColor Cyan
    Write-Host "========================================================" -ForegroundColor Green
} else {
    Write-Host "`n⚠️ 上傳遇到問題，請確認網路連線或 GitHub 登入權限。" -ForegroundColor Yellow
}


