# 🦀 Hướng Dẫn Cài Đặt Rust cho Windows

## 🎯 Tại sao cần Rust?

Antigravity Tools sử dụng **Tauri** - một framework để build desktop apps.
- Frontend: React (JavaScript) ✅ Đã có
- Backend: Rust ❌ Cần cài

**Không có Rust = Không chạy được app!**

---

## 📦 CÁCH 1: Cài tự động (Khuyên dùng)

### Dùng winget (Windows 10/11):

```powershell
# Mở PowerShell với quyền Admin
winget install Rustlang.Rustup
```

### Dùng Chocolatey (nếu đã cài):

```powershell
choco install rust
```

---

## 📦 CÁCH 2: Cài thủ công (Chắc chắn nhất)

### Bước 1: Tải Rustup
1. Mở trình duyệt
2. Truy cập: **https://rustup.rs/**
3. Click nút **"Download rustup-init.exe"**
4. Lưu file về máy

### Bước 2: Chạy Installer
1. Double-click file `rustup-init.exe`
2. Cửa sổ terminal sẽ hiện ra
3. Bạn sẽ thấy:
   ```
   1) Proceed with installation (default)
   2) Customize installation
   3) Cancel installation
   ```
4. Nhấn **Enter** (chọn option 1)

### Bước 3: Đợi cài đặt
- Quá trình mất khoảng **5-10 phút**
- Sẽ download và cài:
  - Rust compiler (rustc)
  - Cargo (package manager)
  - Các tools khác

### Bước 4: Xác nhận thành công
Khi thấy dòng này là thành công:
```
Rust is installed now. Great!
```

### Bước 5: ⚠️ QUAN TRỌNG
**ĐÓNG VÀ MỞ LẠI TERMINAL/POWERSHELL!**

Rust cần reload environment variables.

### Bước 6: Kiểm tra
```powershell
rustc --version
cargo --version
```

Nếu thấy version numbers → Thành công! ✅

---

## 🔧 Cài thêm cho Windows

Sau khi cài Rust, chạy:

```powershell
# Cài target cho Windows
rustup target add x86_64-pc-windows-msvc

# Update toolchain
rustup update
```

---

## 🐛 Troubleshooting

### Lỗi: "rustc not found" sau khi cài

**Nguyên nhân:** Chưa reload terminal

**Giải pháp:**
1. Đóng hoàn toàn PowerShell/Terminal
2. Mở lại
3. Chạy lại `rustc --version`

---

### Lỗi: "linker 'link.exe' not found"

**Nguyên nhân:** Thiếu Visual Studio Build Tools

**Giải pháp:**

#### Option A: Dùng winget
```powershell
winget install Microsoft.VisualStudio.2022.BuildTools
```

#### Option B: Thủ công
1. Truy cập: https://visualstudio.microsoft.com/downloads/
2. Scroll xuống "All Downloads"
3. Tìm "Build Tools for Visual Studio 2022"
4. Download và cài
5. Trong installer, chọn:
   - ✅ Desktop development with C++
6. Click Install (mất ~5GB)

---

### Lỗi: "failed to run custom build command for `openssl-sys`"

**Giải pháp:**
```powershell
winget install OpenSSL.OpenSSL
```

---

### Lỗi: Antivirus chặn

**Giải pháp:**
1. Mở Windows Security
2. Virus & threat protection
3. Manage settings
4. Add exclusion
5. Thêm folder: `C:\Users\<YourName>\.cargo`

---

## 📊 Yêu cầu hệ thống

- **OS:** Windows 7 trở lên (khuyên dùng Windows 10/11)
- **Disk:** Ít nhất 5GB trống
- **RAM:** 4GB+ (khuyên dùng 8GB+)
- **Internet:** Cần để download dependencies

---

## ⏱️ Thời gian cài đặt

- **Cài Rust:** 5-10 phút
- **Cài VS Build Tools:** 10-20 phút (nếu cần)
- **Compile lần đầu:** 10-20 phút
- **Compile lần sau:** < 1 phút

**Tổng:** Khoảng 30-50 phút cho lần đầu setup

---

## ✅ Sau khi cài xong

1. Kiểm tra:
   ```powershell
   .\check_setup.ps1
   ```

2. Chạy app:
   ```powershell
   npm run tauri dev
   ```

3. Đợi compile lần đầu (10-20 phút)

4. App sẽ tự động mở!

---

## 🆘 Vẫn gặp vấn đề?

1. Xem `SETUP_GUIDE_VI.md` phần Troubleshooting
2. Check Rust docs: https://www.rust-lang.org/tools/install
3. Check Tauri docs: https://tauri.app/v1/guides/getting-started/prerequisites

---

## 💡 Tips

- ✅ Cài Rust trước khi cài VS Build Tools
- ✅ Luôn restart terminal sau khi cài
- ✅ Disable antivirus tạm thời khi compile
- ✅ Đảm bảo có đủ disk space (5GB+)
- ✅ Dùng internet tốt (sẽ download nhiều)

---

**Ready?** Chạy `.\quick_start.ps1` để bắt đầu! 🚀
