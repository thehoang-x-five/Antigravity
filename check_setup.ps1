# Script kiểm tra setup cho Antigravity Tools
Write-Host "=== KIỂM TRA SETUP ANTIGRAVITY TOOLS ===" -ForegroundColor Cyan
Write-Host ""

$allGood = $true

# Kiểm tra Node.js
Write-Host "[1/5] Kiểm tra Node.js..." -NoNewline
try {
    $nodeVersion = node --version
    Write-Host " ✅ $nodeVersion" -ForegroundColor Green
} catch {
    Write-Host " ❌ CHƯA CÀI" -ForegroundColor Red
    Write-Host "      → Tải từ: https://nodejs.org/" -ForegroundColor Yellow
    $allGood = $false
}

# Kiểm tra npm
Write-Host "[2/5] Kiểm tra npm..." -NoNewline
try {
    $npmVersion = npm --version
    Write-Host " ✅ v$npmVersion" -ForegroundColor Green
} catch {
    Write-Host " ❌ CHƯA CÀI" -ForegroundColor Red
    $allGood = $false
}

# Kiểm tra Rust
Write-Host "[3/5] Kiểm tra Rust..." -NoNewline
try {
    $rustVersion = rustc --version
    Write-Host " ✅ $rustVersion" -ForegroundColor Green
} catch {
    Write-Host " ❌ CHƯA CÀI (BẮT BUỘC)" -ForegroundColor Red
    Write-Host "      → Tải từ: https://rustup.rs/" -ForegroundColor Yellow
    Write-Host "      → Hoặc chạy: winget install Rustlang.Rustup" -ForegroundColor Yellow
    Write-Host "      → SAU KHI CÀI: Đóng và mở lại terminal!" -ForegroundColor Yellow
    $allGood = $false
}

# Kiểm tra Cargo
Write-Host "[4/5] Kiểm tra Cargo..." -NoNewline
try {
    $cargoVersion = cargo --version
    Write-Host " ✅ $cargoVersion" -ForegroundColor Green
} catch {
    Write-Host " ❌ CHƯA CÀI" -ForegroundColor Red
    $allGood = $false
}

# Kiểm tra node_modules
Write-Host "[5/5] Kiểm tra node_modules..." -NoNewline
if (Test-Path "node_modules") {
    Write-Host " ✅ Đã cài" -ForegroundColor Green
} else {
    Write-Host " ❌ CHƯA CÀI" -ForegroundColor Red
    Write-Host "      → Chạy: npm install" -ForegroundColor Yellow
    $allGood = $false
}

Write-Host ""
Write-Host "================================" -ForegroundColor Cyan

if ($allGood) {
    Write-Host "✅ TẤT CẢ ĐÃ SẴN SÀNG!" -ForegroundColor Green
    Write-Host ""
    Write-Host "Bạn có thể chạy:" -ForegroundColor Cyan
    Write-Host "  npm run tauri dev    # Chạy full app (frontend + backend)" -ForegroundColor White
    Write-Host "  npm run dev          # Chỉ chạy frontend" -ForegroundColor White
    Write-Host "  npm run tauri build  # Build production" -ForegroundColor White
} else {
    Write-Host "❌ CÒN THIẾU MỘT SỐ DEPENDENCIES" -ForegroundColor Red
    Write-Host ""
    Write-Host "Vui lòng:" -ForegroundColor Yellow
    Write-Host "1. Cài đặt các dependencies bị thiếu ở trên" -ForegroundColor White
    Write-Host "2. Chạy lại script này để kiểm tra: .\check_setup.ps1" -ForegroundColor White
    Write-Host "3. Xem hướng dẫn chi tiết: SETUP_GUIDE_VI.md" -ForegroundColor White
}

Write-Host ""
