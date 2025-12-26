# 🚀 Hướng Dẫn Setup và Chạy Antigravity Tools

## ✅ Đã có sẵn:
- ✅ Node.js v22.14.0
- ✅ npm v10.9.2
- ✅ Dependencies đã cài (node_modules)
- ✅ Vite dev server đang chạy

## ❌ Cần cài thêm:
- ❌ Rust (BẮT BUỘC cho Tauri backend)

---

## 📦 BƯỚC 1: Cài đặt Rust

### Windows (Cách 1 - Khuyên dùng):
1. Truy cập: https://rustup.rs/
2. Tải file `rustup-init.exe`
3. Chạy file và làm theo hướng dẫn:
   ```
   - Chọn option 1: Proceed with installation (default)
   - Đợi cài đặt hoàn tất (khoảng 5-10 phút)
   ```
4. **QUAN TRỌNG:** Đóng và mở lại terminal/PowerShell
5. Kiểm tra cài đặt:
   ```powershell
   rustc --version
   cargo --version
   ```

### Windows (Cách 2 - Dùng winget):
```powershell
winget install Rustlang.Rustup
```

### Sau khi cài Rust:
```powershell
# Cài thêm các tools cần thiết cho Windows
rustup target add x86_64-pc-windows-msvc
```

---

## 🏃 BƯỚC 2: Chạy ứng dụng

### Option A: Development Mode (Khuyên dùng khi dev)

```powershell
# Chạy cả frontend + backend
npm run tauri dev
```

**Lưu ý:** Lần đầu chạy sẽ mất 10-20 phút để compile Rust dependencies.

### Option B: Chỉ chạy Frontend (đang chạy)

```powershell
# Frontend đã chạy tại: http://localhost:1420
npm run dev
```

**Hạn chế:** Không có backend Rust, nên các tính năng như:
- Quản lý tài khoản
- API proxy
- Database operations
→ Sẽ KHÔNG hoạt động

---

## 🔧 BƯỚC 3: Build Production (Optional)

```powershell
# Build ứng dụng desktop
npm run tauri build
```

Output sẽ ở:
- `src-tauri/target/release/bundle/msi/` - File .msi installer
- `src-tauri/target/release/` - File .exe standalone

---

## 🐛 Troubleshooting

### Lỗi: "rustc not found"
**Nguyên nhân:** Rust chưa được cài hoặc chưa reload terminal
**Giải pháp:**
1. Cài Rust theo BƯỚC 1
2. Đóng và mở lại terminal
3. Chạy lại lệnh

### Lỗi: "linker 'link.exe' not found"
**Nguyên nhân:** Thiếu Visual Studio Build Tools
**Giải pháp:**
```powershell
# Cài Visual Studio Build Tools
winget install Microsoft.VisualStudio.2022.BuildTools

# Hoặc tải từ:
# https://visualstudio.microsoft.com/downloads/
# Chọn: "Build Tools for Visual Studio 2022"
# Trong installer, chọn: "Desktop development with C++"
```

### Lỗi: "failed to run custom build command for `openssl-sys`"
**Giải pháp:**
```powershell
# Cài OpenSSL
winget install OpenSSL.OpenSSL
```

### Port 1420 đã được sử dụng
**Giải pháp:**
```powershell
# Tìm process đang dùng port
netstat -ano | findstr :1420

# Kill process (thay PID bằng số thực tế)
taskkill /PID <PID> /F
```

---

## 📝 Các lệnh hữu ích

```powershell
# Kiểm tra dependencies
npm list

# Cài lại dependencies
npm install

# Clear cache và reinstall
Remove-Item -Recurse -Force node_modules
npm install

# Kiểm tra Rust toolchain
rustup show

# Update Rust
rustup update

# Kiểm tra Tauri CLI
npm run tauri --version

# Build chỉ frontend
npm run build

# Preview production build
npm run preview
```

---

## 🎯 Sau khi chạy thành công

### 1. Thêm tài khoản Google:
- Mở app → Tab "Accounts"
- Click "Add Account" → "OAuth"
- Copy authorization URL
- Mở trong browser và authorize
- Quay lại app, click "I already authorized, continue"

### 2. Bật API Proxy:
- Tab "API Proxy"
- Toggle "Start Service"
- Port mặc định: 8045
- Copy endpoint: `http://127.0.0.1:8045`

### 3. Test với Python:
```python
import openai

client = openai.OpenAI(
    api_key="sk-antigravity",
    base_url="http://127.0.0.1:8045/v1"
)

response = client.chat.completions.create(
    model="gemini-2.0-flash",
    messages=[{"role": "user", "content": "Hello!"}]
)
print(response.choices[0].message.content)
```

---

## 📚 Tài liệu tham khảo

- Tauri Docs: https://tauri.app/
- Rust Installation: https://rustup.rs/
- Project README: README.md
- English Guide: README_EN.md

---

## 💡 Tips

1. **Lần đầu compile Rust rất lâu** (10-20 phút) - Đừng lo!
2. **Cần ít nhất 5GB disk space** cho Rust toolchain
3. **Restart terminal sau khi cài Rust** - Rất quan trọng!
4. **Antivirus có thể chặn** - Thêm exception cho Rust/Cargo
5. **Internet tốt** - Cần download nhiều dependencies

---

## ✨ Trạng thái hiện tại

✅ Frontend đang chạy: http://localhost:1420
❌ Backend chưa chạy (cần Rust)
⏳ Chờ cài Rust để chạy full app

**Next step:** Cài Rust theo BƯỚC 1, sau đó chạy `npm run tauri dev`
