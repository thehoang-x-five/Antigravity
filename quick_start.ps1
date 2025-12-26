# Quick Start Script cho Antigravity Tools
Write-Host "=== ANTIGRAVITY TOOLS - QUICK START ===" -ForegroundColor Cyan
Write-Host ""

# Kiểm tra Rust
Write-Host "Kiểm tra Rust..." -NoNewline
try {
    $rustVersion = rustc --version 2>$null
    Write-Host " ✅ Đã cài: $rustVersion" -ForegroundColor Green
    $rustInstalled = $true
} catch {
    Write-Host " ❌ Chưa cài" -ForegroundColor Red
    $rustInstalled = $false
}

if (-not $rustInstalled) {
    Write-Host ""
    Write-Host "Rust là BẮT BUỘC để chạy Antigravity Tools (Tauri backend)" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "Bạn có 2 cách cài đặt:" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "CÁCH 1 (Tự động - Khuyên dùng):" -ForegroundColor Green
    Write-Host "  winget install Rustlang.Rustup" -ForegroundColor White
    Write-Host ""
    Write-Host "CÁCH 2 (Thủ công):" -ForegroundColor Green
    Write-Host "  1. Mở: https://rustup.rs/" -ForegroundColor White
    Write-Host "  2. Tải rustup-init.exe" -ForegroundColor White
    Write-Host "  3. Chạy và chọn option 1" -ForegroundColor White
    Write-Host ""
    
    $choice = Read-Host "Bạn muốn tự động cài Rust bằng winget? (y/n)"
    
    if ($choice -eq "y" -or $choice -eq "Y") {
        Write-Host ""
        Write-Host "Đang cài đặt Rust..." -ForegroundColor Yellow
        try {
            winget install Rustlang.Rustup --silent
            Write-Host "✅ Cài đặt thành công!" -ForegroundColor Green
            Write-Host ""
            Write-Host "⚠️  QUAN TRỌNG: Bạn cần ĐÓNG và MỞ LẠI terminal này!" -ForegroundColor Red
            Write-Host "Sau đó chạy lại: .\quick_start.ps1" -ForegroundColor Yellow
            Write-Host ""
            Read-Host "Nhấn Enter để thoát"
            exit
        } catch {
            Write-Host "❌ Không thể cài tự động. Vui lòng cài thủ công." -ForegroundColor Red
            Write-Host "Truy cập: https://rustup.rs/" -ForegroundColor Yellow
            exit
        }
    } else {
        Write-Host ""
        Write-Host "Vui lòng cài Rust thủ công:" -ForegroundColor Yellow
        Write-Host "1. Truy cập: https://rustup.rs/" -ForegroundColor White
        Write-Host "2. Tải và chạy rustup-init.exe" -ForegroundColor White
        Write-Host "3. Sau khi cài xong, đóng và mở lại terminal" -ForegroundColor White
        Write-Host "4. Chạy lại: .\quick_start.ps1" -ForegroundColor White
        Write-Host ""
        Read-Host "Nhấn Enter để thoát"
        exit
    }
}

# Nếu Rust đã cài, tiếp tục
Write-Host ""
Write-Host "✅ Tất cả dependencies đã sẵn sàng!" -ForegroundColor Green
Write-Host ""
Write-Host "Bạn muốn chạy gì?" -ForegroundColor Cyan
Write-Host "1. Development mode (frontend + backend) - Khuyên dùng" -ForegroundColor White
Write-Host "2. Chỉ frontend (không có backend features)" -ForegroundColor White
Write-Host "3. Build production" -ForegroundColor White
Write-Host "4. Thoát" -ForegroundColor White
Write-Host ""

$choice = Read-Host "Chọn (1-4)"

switch ($choice) {
    "1" {
        Write-Host ""
        Write-Host "Đang khởi động development mode..." -ForegroundColor Yellow
        Write-Host "Lần đầu sẽ mất 10-20 phút để compile Rust dependencies" -ForegroundColor Yellow
        Write-Host ""
        npm run tauri dev
    }
    "2" {
        Write-Host ""
        Write-Host "Đang khởi động frontend..." -ForegroundColor Yellow
        Write-Host "Truy cập: http://localhost:1420" -ForegroundColor Cyan
        Write-Host ""
        npm run dev
    }
    "3" {
        Write-Host ""
        Write-Host "Đang build production..." -ForegroundColor Yellow
        Write-Host "Output sẽ ở: src-tauri/target/release/bundle/" -ForegroundColor Cyan
        Write-Host ""
        npm run tauri build
    }
    "4" {
        Write-Host "Tạm biệt!" -ForegroundColor Cyan
        exit
    }
    default {
        Write-Host "Lựa chọn không hợp lệ" -ForegroundColor Red
        exit
    }
}
