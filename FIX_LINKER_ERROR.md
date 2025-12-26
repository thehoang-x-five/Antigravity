# 🔧 Fix Lỗi "linker `link.exe` not found"

## ❌ Lỗi gặp phải:

```
error: linker `link.exe` not found
note: the msvc targets depend on the msvc linker but `link.exe` was not found
note: please ensure that Visual Studio 2017 or later, or Build Tools for Visual Studio were installed with the Visual C++ option.
```

## 🔍 Nguyên nhân:

Rust trên Windows cần **Visual Studio Build Tools** (C++ compiler) để compile code.
- Bạn đã cài Rust ✅
- Nhưng thiếu C++ Build Tools ❌

## ✅ Giải pháp:

### CÁCH 1: Tự động (Khuyên dùng - 5 phút)

#### Chạy script:
```powershell
.\install_build_tools.ps1
```

Hoặc chạy trực tiếp:
```powershell
winget install Microsoft.VisualStudio.2022.BuildTools --silent --override "--wait --quiet --add Microsoft.VisualStudio.Workload.VCTools --includeRecommended"
```

**Sau khi cài xong: KHỞI ĐỘNG LẠI MÁY TÍNH!**

---

### CÁCH 2: Thủ công (Linh hoạt - 10-20 phút)

#### Bước 1: Tải installer
1. Truy cập: https://visualstudio.microsoft.com/downloads/
2. Scroll xuống phần **"All Downloads"**
3. Tìm **"Build Tools for Visual Studio 2022"**
4. Click **"Download"**

#### Bước 2: Chạy installer
1. Double-click file `vs_BuildTools.exe` vừa tải
2. Đợi installer load (1-2 phút)

#### Bước 3: Chọn workload
Trong installer, tìm và tick vào:
```
☑️ Desktop development with C++
```

**Quan trọng:** Phải chọn đúng workload này!

#### Bước 4: Cài đặt
1. Click nút **"Install"** (góc dưới bên phải)
2. Đợi download và cài đặt (10-20 phút)
3. Cần ~5-10GB disk space

#### Bước 5: Khởi động lại
**BẮT BUỘC:** Khởi động lại máy tính sau khi cài xong!

#### Bước 6: Chạy lại app
```powershell
.\run_app.ps1
```

---

## 🔍 Kiểm tra đã cài thành công:

### Cách 1: Kiểm tra folder
```powershell
Test-Path "C:\Program Files (x86)\Microsoft Visual Studio\2022\BuildTools"
```
Nếu trả về `True` → Đã cài ✅

### Cách 2: Kiểm tra link.exe
```powershell
where.exe link.exe
```
Nếu hiện đường dẫn → Đã cài ✅

### Cách 3: Compile test
```powershell
cd src-tauri
cargo build
```
Nếu không lỗi → Đã cài ✅

---

## 🐛 Vẫn gặp lỗi?

### Lỗi: "link.exe still not found" sau khi cài

**Nguyên nhân:** Chưa restart máy hoặc chưa chọn đúng workload

**Giải pháp:**
1. Khởi động lại máy tính
2. Nếu vẫn lỗi, mở lại installer:
   ```powershell
   "C:\Program Files (x86)\Microsoft Visual Studio\Installer\vs_installer.exe"
   ```
3. Click "Modify" trên Build Tools 2022
4. Đảm bảo đã tick: **Desktop development with C++**
5. Click "Modify" để cài thêm
6. Khởi động lại máy

---

### Lỗi: "Disk space not enough"

**Giải pháp:**
- Cần ít nhất 5GB trống
- Dọn dẹp disk:
  ```powershell
  cleanmgr
  ```
- Hoặc cài vào drive khác (chọn trong installer)

---

### Lỗi: "Installation failed"

**Giải pháp:**
1. Tắt antivirus tạm thời
2. Chạy installer với quyền Admin:
   - Right-click → "Run as administrator"
3. Kiểm tra internet connection
4. Thử lại

---

## 💡 Tips:

### Tối ưu cài đặt:
- ✅ Chỉ cần "Desktop development with C++"
- ❌ Không cần cài full Visual Studio
- ❌ Không cần VS Code (khác nhau!)

### Tiết kiệm disk space:
Build Tools minimal: ~5GB
Full Visual Studio: ~20-50GB
→ Chỉ cài Build Tools!

### Sau khi cài:
- Khởi động lại máy (BẮT BUỘC)
- Chạy `.\run_app.ps1`
- Lần đầu compile vẫn mất 10-20 phút (bình thường)

---

## 📊 Yêu cầu hệ thống:

- **OS:** Windows 7 SP1+ (khuyên dùng Windows 10/11)
- **Disk:** 5-10GB trống
- **RAM:** 4GB+ (khuyên dùng 8GB+)
- **Internet:** Cần để download (~3-5GB)

---

## 🔗 Tài liệu tham khảo:

- Visual Studio Downloads: https://visualstudio.microsoft.com/downloads/
- Rust Windows Prerequisites: https://www.rust-lang.org/tools/install
- Tauri Prerequisites: https://tauri.app/v1/guides/getting-started/prerequisites

---

## ✅ Checklist:

- [ ] Đã cài Visual Studio Build Tools 2022
- [ ] Đã chọn workload "Desktop development with C++"
- [ ] Đã khởi động lại máy tính
- [ ] Đã chạy `.\run_app.ps1`
- [ ] App compile thành công!

---

**Sau khi fix xong, chạy:**
```powershell
.\run_app.ps1
```

**Lần này sẽ thành công!** 🚀
