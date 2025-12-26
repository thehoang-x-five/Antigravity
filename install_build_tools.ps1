# Script cai Visual Studio Build Tools cho Rust/Tauri
Write-Host "=== CAI DAT VISUAL STUDIO BUILD TOOLS ===" -ForegroundColor Cyan
Write-Host ""
Write-Host "Rust can Visual Studio Build Tools de compile tren Windows" -ForegroundColor Yellow
Write-Host ""

# Kiem tra xem da cai chua
Write-Host "Kiem tra Build Tools hien tai..." -NoNewline
$vsPath = "C:\Program Files (x86)\Microsoft Visual Studio\2022\BuildTools"
$vsPath2019 = "C:\Program Files (x86)\Microsoft Visual Studio\2019\BuildTools"

if ((Test-Path $vsPath) -or (Test-Path $vsPath2019)) {
    Write-Host " Da cai!" -ForegroundColor Green
    Write-Host ""
    Write-Host "Neu van gap loi, co the can cai them C++ workload" -ForegroundColor Yellow
    Write-Host ""
    $choice = Read-Host "Ban co muon cai lai? (y/n)"
    if ($choice -ne "y" -and $choice -ne "Y") {
        Write-Host "Thoat..." -ForegroundColor Cyan
        exit
    }
}

Write-Host ""
Write-Host "Co 2 cach cai dat:" -ForegroundColor Cyan
Write-Host ""
Write-Host "CACH 1: Tu dong bang winget (Nhanh - 5 phut)" -ForegroundColor Green
Write-Host "  - Tu dong download va cai" -ForegroundColor White
Write-Host "  - Can ~5GB disk space" -ForegroundColor White
Write-Host "  - Cai minimal C++ tools" -ForegroundColor White
Write-Host ""
Write-Host "CACH 2: Thu cong (Linh hoat - 10-20 phut)" -ForegroundColor Green
Write-Host "  - Download installer tu Microsoft" -ForegroundColor White
Write-Host "  - Chon workload cu the" -ForegroundColor White
Write-Host "  - Can ~5-10GB disk space" -ForegroundColor White
Write-Host ""

$choice = Read-Host "Chon cach (1/2)"

if ($choice -eq "1") {
    Write-Host ""
    Write-Host "Dang cai Visual Studio Build Tools 2022..." -ForegroundColor Yellow
    Write-Host "Qua trinh nay se mat khoang 5-10 phut" -ForegroundColor Yellow
    Write-Host ""
    
    try {
        # Cai Build Tools
        Write-Host "Buoc 1/2: Cai Build Tools..." -ForegroundColor Cyan
        winget install Microsoft.VisualStudio.2022.BuildTools --silent --override "--wait --quiet --add Microsoft.VisualStudio.Workload.VCTools --includeRecommended"
        
        Write-Host ""
        Write-Host "OK Cai dat thanh cong!" -ForegroundColor Green
        Write-Host ""
        Write-Host "QUAN TRONG: Ban can KHOI DONG LAI may tinh!" -ForegroundColor Red
        Write-Host ""
        $restart = Read-Host "Ban co muon khoi dong lai ngay bay gio? (y/n)"
        if ($restart -eq "y" -or $restart -eq "Y") {
            Write-Host "Dang khoi dong lai..." -ForegroundColor Yellow
            Restart-Computer
        } else {
            Write-Host ""
            Write-Host "Vui long khoi dong lai may tinh truoc khi chay app!" -ForegroundColor Yellow
            Write-Host "Sau khi khoi dong lai, chay: .\run_app.ps1" -ForegroundColor Cyan
        }
    } catch {
        Write-Host ""
        Write-Host "FAILED Khong the cai tu dong" -ForegroundColor Red
        Write-Host "Vui long thu CACH 2 (thu cong)" -ForegroundColor Yellow
        Write-Host ""
        Write-Host "Hoac chay lenh nay:" -ForegroundColor Cyan
        Write-Host "winget install Microsoft.VisualStudio.2022.BuildTools" -ForegroundColor White
    }
    
} elseif ($choice -eq "2") {
    Write-Host ""
    Write-Host "HUONG DAN CAI THU CONG:" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "Buoc 1: Tai installer" -ForegroundColor Yellow
    Write-Host "  Truy cap: https://visualstudio.microsoft.com/downloads/" -ForegroundColor White
    Write-Host "  Scroll xuong 'All Downloads'" -ForegroundColor White
    Write-Host "  Tim 'Build Tools for Visual Studio 2022'" -ForegroundColor White
    Write-Host "  Click 'Download'" -ForegroundColor White
    Write-Host ""
    Write-Host "Buoc 2: Chay installer" -ForegroundColor Yellow
    Write-Host "  Double-click file vua tai" -ForegroundColor White
    Write-Host "  Doi installer load (1-2 phut)" -ForegroundColor White
    Write-Host ""
    Write-Host "Buoc 3: Chon workload" -ForegroundColor Yellow
    Write-Host "  Trong installer, chon:" -ForegroundColor White
    Write-Host "  [X] Desktop development with C++" -ForegroundColor Green
    Write-Host "  (Tick vao o checkbox)" -ForegroundColor White
    Write-Host ""
    Write-Host "Buoc 4: Cai dat" -ForegroundColor Yellow
    Write-Host "  Click 'Install'" -ForegroundColor White
    Write-Host "  Doi 10-20 phut" -ForegroundColor White
    Write-Host "  Can ~5-10GB disk space" -ForegroundColor White
    Write-Host ""
    Write-Host "Buoc 5: Khoi dong lai" -ForegroundColor Yellow
    Write-Host "  Sau khi cai xong, KHOI DONG LAI may tinh" -ForegroundColor Red
    Write-Host ""
    Write-Host "Buoc 6: Chay app" -ForegroundColor Yellow
    Write-Host "  Sau khi khoi dong lai, chay: .\run_app.ps1" -ForegroundColor Cyan
    Write-Host ""
    
    $open = Read-Host "Ban co muon mo trang download ngay bay gio? (y/n)"
    if ($open -eq "y" -or $open -eq "Y") {
        Start-Process "https://visualstudio.microsoft.com/downloads/"
        Write-Host ""
        Write-Host "Da mo trang download trong browser!" -ForegroundColor Green
    }
    
} else {
    Write-Host "Lua chon khong hop le" -ForegroundColor Red
}

Write-Host ""
