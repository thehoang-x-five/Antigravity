# 📖 Hướng Dẫn Sử Dụng Antigravity Tools

## 🎯 Sau khi app mở thành công

### Bước 1: Thêm tài khoản Google (Gemini)

#### 1.1. Vào tab "Accounts"
- Click vào tab "Accounts" ở sidebar bên trái

#### 1.2. Click "Add Account"
- Click nút "Add Account" (màu xanh)
- Chọn "OAuth" (khuyên dùng)

#### 1.3. Authorize
1. Một dialog sẽ hiện ra với authorization URL
2. Click vào URL để copy
3. Paste vào browser và mở
4. Đăng nhập tài khoản Google của bạn
5. Cho phép quyền truy cập
6. Browser sẽ hiện "✅ Authorized successfully!"

#### 1.4. Hoàn tất
- Quay lại app
- Click "I already authorized, continue"
- Tài khoản sẽ được thêm vào danh sách

#### 1.5. Lặp lại cho nhiều tài khoản
- Bạn có thể thêm 5-10 tài khoản Google
- Mỗi tài khoản = thêm quota miễn phí
- App sẽ tự động rotate giữa các tài khoản

---

### Bước 2: Kiểm tra quota

#### 2.1. Refresh quota
- Trong tab "Accounts"
- Click "Refresh All Quotas"
- Đợi vài giây

#### 2.2. Xem quota
- Mỗi tài khoản sẽ hiển thị:
  - Gemini Pro quota (%)
  - Gemini Flash quota (%)
  - Claude quota (nếu có)
  - Imagen quota (%)

#### 2.3. Dashboard
- Vào tab "Dashboard"
- Xem tổng quan:
  - Average quota của tất cả accounts
  - Best account (quota cao nhất)
  - Active account hiện tại

---

### Bước 3: Bật API Proxy

#### 3.1. Vào tab "API Proxy"
- Click tab "API Proxy" ở sidebar

#### 3.2. Start service
- Toggle switch "Start Service" → ON
- Port mặc định: 8045
- Có thể đổi port nếu muốn

#### 3.3. Copy endpoint
```
http://127.0.0.1:8045
```

#### 3.4. Kiểm tra status
- Status: 🟢 Running
- Requests: 0
- Active account: [tên account]

---

### Bước 4: Test API

#### 4.1. Test với curl
```bash
curl http://127.0.0.1:8045/v1/models
```

#### 4.2. Test với Python
```python
import openai

client = openai.OpenAI(
    api_key="sk-antigravity",
    base_url="http://127.0.0.1:8045/v1"
)

# Test chat
response = client.chat.completions.create(
    model="gemini-2.0-flash",
    messages=[
        {"role": "user", "content": "Hello! Introduce yourself."}
    ]
)

print(response.choices[0].message.content)
```

#### 4.3. Test với Node.js
```javascript
import OpenAI from 'openai';

const client = new OpenAI({
  apiKey: 'sk-antigravity',
  baseURL: 'http://127.0.0.1:8045/v1'
});

const response = await client.chat.completions.create({
  model: 'gemini-2.0-flash',
  messages: [
    { role: 'user', content: 'Hello!' }
  ]
});

console.log(response.choices[0].message.content);
```

---

### Bước 5: Tích hợp với IDE

#### 5.1. VS Code + Continue.dev

**Cài extension:**
```bash
code --install-extension continue.continue
```

**Config (~/.continue/config.json):**
```json
{
  "models": [
    {
      "title": "Gemini Flash (Free)",
      "provider": "openai",
      "model": "gemini-2.0-flash",
      "apiKey": "sk-antigravity",
      "apiBase": "http://127.0.0.1:8045/v1"
    }
  ]
}
```

**Sử dụng:**
- Cmd+L (Mac) / Ctrl+L (Windows): Chat
- Cmd+K (Mac) / Ctrl+K (Windows): Code generation

#### 5.2. Cursor IDE

**Settings:**
```
Settings → Models → Add Custom Model
- Provider: OpenAI Compatible
- Base URL: http://127.0.0.1:8045/v1
- API Key: sk-antigravity
- Model: gemini-2.0-flash
```

**Sử dụng:**
- Cmd+K: Code generation
- Cmd+L: Chat

#### 5.3. Claude Code CLI

**Setup:**
```bash
# Thêm vào ~/.zshrc hoặc ~/.bashrc
export ANTHROPIC_API_KEY="sk-antigravity"
export ANTHROPIC_BASE_URL="http://127.0.0.1:8045"
```

**Sử dụng:**
```bash
claude chat "Explain this code" < main.py
claude generate "Write tests" < app.js
```

---

### Bước 6: Model Mapping (Optional)

#### 6.1. Vào Settings
- Tab "Settings"
- Section "Model Mapping"

#### 6.2. Thêm mapping
Ví dụ:
```
gpt-4 → gemini-2.0-flash
claude-3-sonnet → gemini-1.5-pro
```

#### 6.3. Lợi ích
- IDE yêu cầu "gpt-4"
- App tự động dùng "gemini-2.0-flash" (free)
- Tiết kiệm chi phí!

---

## 🎨 Các tính năng nâng cao

### 1. Auto-rotate accounts
- App tự động chuyển account khi hết quota
- Không cần can thiệp thủ công
- Xem logs trong terminal

### 2. Token Saver
- Tự động phát hiện background tasks
- Chuyển sang Gemini Flash (free)
- Tiết kiệm quota cho tasks quan trọng

### 3. Session Sticky
- Cùng 1 conversation = cùng 1 account
- Tránh context bị mất
- Time window: 60 giây

### 4. Smart retry
- Gặp 429 (rate limit) → auto retry
- Gặp 401 (expired) → switch account
- Gặp 403 (banned) → skip account

---

## 📊 Monitoring

### Dashboard
- Average quota: Trung bình của tất cả accounts
- Best account: Account có quota cao nhất
- Active account: Account đang dùng
- Last sync: Lần refresh cuối

### Accounts page
- List/Grid view
- Quota bars (visual)
- 403 detection (banned accounts)
- Refresh individual/all

### API Proxy page
- Service status
- Request count
- Active account
- Logs (trong terminal)

---

## 🔧 Settings

### General
- Language: Tiếng Việt / English
- Theme: Light / Dark / Auto
- Auto-start: Khởi động cùng hệ thống

### Proxy
- Port: 8045 (default)
- Auto-start: Tự động bật khi mở app
- API Key: sk-antigravity (có thể đổi)

### Model Mapping
- Custom mappings
- Regex support
- Priority order

### Advanced
- Antigravity path (cho process management)
- Log level
- Debug mode

---

## 💡 Tips & Tricks

### 1. Tối ưu quota
```
- Dùng Flash cho simple tasks (fast, cheap)
- Dùng Pro cho complex tasks (smart, expensive)
- Dùng nhiều accounts để tăng quota
```

### 2. Tránh bị ban
```
- Không spam requests
- Respect rate limits
- Dùng auto-retry
- Monitor 403 errors
```

### 3. Performance
```
- Đóng app khi không dùng
- Clear logs định kỳ
- Update app thường xuyên
```

### 4. Troubleshooting
```
- Check logs trong terminal
- Refresh quota nếu sai
- Restart proxy service
- Re-authorize accounts nếu expired
```

---

## 🆘 Common Issues

### "Account expired"
**Giải pháp:**
- Xóa account cũ
- Thêm lại bằng OAuth

### "429 Too Many Requests"
**Giải pháp:**
- Thêm nhiều accounts
- Đợi quota reset (1 phút)
- Check rate limits

### "403 Forbidden"
**Giải pháp:**
- Account bị ban
- Xóa account đó
- Dùng account khác

### "Proxy not responding"
**Giải pháp:**
- Restart proxy service
- Check port conflict
- Check firewall

---

## 📚 Resources

- **README:** README.md
- **Setup Guide:** SETUP_GUIDE_VI.md
- **Rust Install:** INSTALL_RUST.md
- **GitHub:** https://github.com/lbjlaq/Antigravity-Manager

---

**Chúc bạn sử dụng vui vẻ!** 🚀
