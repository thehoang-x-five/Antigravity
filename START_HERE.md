# 🚀 BẮT ĐẦU TẠI ĐÂY

## ⚡ Quick Start (3 bước)

### 1️⃣ Kiểm tra setup
```powershell
.\check_setup.ps1
```

### 2️⃣ Cài Rust (nếu chưa có)
```powershell
# Cách 1: Tự động
winget install Rustlang.Rustup

# Cách 2: Thủ công
# Truy cập: https://rustup.rs/
# Tải và chạy rustup-init.exe
```

**⚠️ SAU KHI CÀI RUST: ĐÓNG VÀ MỞ LẠI TERMINAL!**

### 3️⃣ Chạy app
```powershell
# Option A: Chạy script tự động
.\quick_start.ps1

# Option B: Chạy thủ công
npm run tauri dev
```

---

## 📊 Trạng thái hiện tại

✅ Node.js: v22.14.0  
✅ npm: v10.9.2  
✅ Dependencies: Đã cài  
✅ Frontend: Đang chạy tại http://localhost:1420  
❌ Rust: **CHƯA CÀI** (cần cài để chạy full app)  

---

## 🎯 Sau khi cài Rust

```powershell
# Chạy full app (frontend + backend)
npm run tauri dev

# Lần đầu sẽ mất 10-20 phút compile
# Các lần sau chỉ mất vài giây
```

---

## 📚 Tài liệu chi tiết

- **Setup đầy đủ:** `SETUP_GUIDE_VI.md`
- **Troubleshooting:** `SETUP_GUIDE_VI.md` (phần cuối)
- **Project README:** `README.md`

---

## 🆘 Cần giúp?

1. Chạy `.\check_setup.ps1` để xem thiếu gì
2. Đọc `SETUP_GUIDE_VI.md` phần Troubleshooting
3. Xem logs trong terminal

---

## 💡 Tips

- Lần đầu compile Rust rất lâu (10-20 phút) - Bình thường!
- Cần ít nhất 5GB disk space
- Restart terminal sau khi cài Rust
- Antivirus có thể chặn - Thêm exception

---

**Next step:** Chạy `.\quick_start.ps1` để bắt đầu! 🚀
