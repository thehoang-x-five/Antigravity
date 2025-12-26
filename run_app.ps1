# Script chay Antigravity Tools voi PATH dung
Write-Host "=== KHOI DONG ANTIGRAVITY TOOLS ===" -ForegroundColor Cyan
Write-Host ""

# Them Cargo vao PATH
$env:PATH += ";$env:USERPROFILE\.cargo\bin"

# Kiem tra Rust
Write-Host "Kiem tra Rust..." -NoNewline
try {
    $rustVersion = rustc --version
    Write-Host " OK $rustVersion" -ForegroundColor Green
} catch {
    Write-Host " FAILED Khong tim thay Rust" -ForegroundColor Red
    Write-Host "Vui long dong va mo lai terminal!" -ForegroundColor Yellow
    exit 1
}

# Kiem tra Cargo
Write-Host "Kiem tra Cargo..." -NoNewline
try {
    $cargoVersion = cargo --version
    Write-Host " OK $cargoVersion" -ForegroundColor Green
} catch {
    Write-Host " FAILED Khong tim thay Cargo" -ForegroundColor Red
    exit 1
}

Write-Host ""
Write-Host "Dang khoi dong app..." -ForegroundColor Yellow
Write-Host ""
Write-Host "Lan dau se mat 10-20 phut de compile Rust dependencies" -ForegroundColor Yellow
Write-Host "Cac lan sau chi mat vai giay" -ForegroundColor Yellow
Write-Host ""

# Chay app
npm run tauri dev
