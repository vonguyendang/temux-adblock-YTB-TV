# iSponsorBlockTV for Termux (Android)

![Banner](https://i.imgur.com/JQ7w3hn.png)

Tiện ích tự động bỏ qua quảng cáo/sponsor trên YouTube TV, chạy trực tiếp trên Termux (Android không cần root).

## 📌 Yêu cầu hệ thống
- Android 8.0+ (khuyến nghị 10+)
- Ứng dụng Termux (tải từ [F-Droid](https://f-droid.org/en/packages/com.termux/))
- Kết nối Internet ổn định
- Dung lượng lưu trữ trống tối thiểu 200MB

## 🚀 Cài đặt bằng 1 lệnh duy nhất

```bash
pkg update -y && pkg install -y wget && wget --quiet --show-progress -O adblock.sh "https://raw.githubusercontent.com/vonguyendang/temux-adblock-YTB-TV/refs/heads/main/adblock.sh" && chmod +x adblock.sh && ./adblock.sh
```
## 🔧 Cấu hình thủ công
Cài đặt phụ thuộc:

```bash
pkg update -y
pkg install -y python git tmux wget
```

Tải script:

```bash
wget [raw.githubusercontent.com/vonguyendang/temux-adblock-YTB-TV/refs/heads/main/adblock.sh](https://raw.githubusercontent.com/vonguyendang/temux-adblock-YTB-TV/refs/heads/main/adblock.sh)
chmod +x adblock.sh
```

Chạy tiện ích:

```bash
./adblock.sh

```
## ⚙️ Hướng dẫn sử dụng
📺 Kết nối với YouTube TV
Trên thiết bị Android TV/Google TV:

Vào Settings (Cài đặt) > Network (Mạng)

Chọn WiFi đang dùng → Advanced (Nâng cao)

Đặt Proxy: Manual (Thủ công)

Host: Nhập địa chỉ IP hiển thị trong Termux

Port: 8081

Mở YouTube TV và tận hưởng!

🔄 Lệnh quản lý
Lệnh	Chức năng
tmux attach -t sponsorblock	Xem log thời gian thực
tmux kill-session -t sponsorblock	Tắt tiện ích
termux-wake-lock	Ngăn hệ thống tắt tiến trình
termux-wake-unlock	Cho phép tắt tiến trình
📝 Tùy chỉnh
Thay đổi categories
Sửa file cấu hình:

bash
nano ~/iSponsorBlockTV/config.ini
Thêm/xóa categories:

ini
categories = sponsor,intro,outro
Chạy với port khác
bash
python iSponsorBlockTV.py --port 9090
⚠️ Khắc phục sự cố
Lỗi kết nối
Đảm bảo thiết bị Android TV và Termux dùng chung mạng WiFi

Kiểm tra tường lửa trên router

Lỗi HTTPS
Cài đặt Packet Capture từ CH Play

Bật VPN trong app

Chạy lại script

📜 Giấy phép
Dự án mã nguồn mở theo giấy phép MIT.

🔧 Bảo trì bởi: Dang Vo
📧 Hỗ trợ: your.email@example.com


### 🌟 Tính năng README.md:
1. **Giao diện rõ ràng** với banner và phân mục chi tiết
2. **Hướng dẫn từ cơ bản đến nâng cao**
3. **Bảng lệnh quản lý** tiện tra cứu
4. **Mục khắc phục sự cố** thường gặp
5. **Tương thích Markdown** (hiển thị đẹp trên GitHub/GitLab)

### 📌 Cách sử dụng:
1. Lưu file với tên `README.md`
2. Đặt cùng thư mục với script hoặc upload lên GitHub
3. Điều chỉnh thông tin liên hệ và đường dẫn phù hợp
