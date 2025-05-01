#!/data/data/com.termux/files/usr/bin/bash

# ------------- CẤU HÌNH MÀU -------------
RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
CYAN='\033[1;36m'
NC='\033[0m' # No Color

# ------------- KIỂM TRA HỆ THỐNG -------------
check_system() {
  echo -e "${CYAN}[•] Kiểm tra hệ thống...${NC}"
  
  # Kiểm tra kết nối Internet
  if ! ping -c 1 google.com &> /dev/null; then
    echo -e "${RED}✖ Không có kết nối Internet!${NC}"
    exit 1
  fi

  # Kiểm tra quyền lưu trữ
  if [ ! -w /sdcard ]; then
    termux-setup-storage
    sleep 3
  fi
}

# ------------- CÀI ĐẶT THÀNH PHẦN -------------
install_dependencies() {
  echo -e "${CYAN}[•] Cài đặt thành phần...${NC}"
  
  packages=(wget python git tmux)
  for pkg in "${packages[@]}"; do
    if ! command -v $pkg &> /dev/null; then
      echo -e "${BLUE}➤ Đang cài $pkg...${NC}"
      pkg install -y $pkg > /dev/null
    fi
  done
}

# ------------- CÀI ĐẶT ISPONSORBLOCKTV -------------
setup_isponsorblock() {
  echo -e "${CYAN}[•] Thiết lập iSponsorBlockTV...${NC}"
  
  if [ ! -d ~/iSponsorBlockTV ]; then
    git clone https://github.com/dmunozv04/iSponsorBlockTV.git
    cd ~/iSponsorBlockTV
    pip install -r requirements.txt > /dev/null
  fi
}

# ------------- CHẠY CHƯƠNG TRÌNH -------------
run_adblock() {
  echo -e "${CYAN}[•] Khởi động iSponsorBlockTV...${NC}"
  
  # tmux new-session -d -s sponsorblock 'cd ~/iSponsorBlockTV/src && python main.py --port 8081 --proxy'
  tmux new-session -d -s sponsorblock 'cd ~/iSponsorBlockTV/src && python main.py'
  
  IP=$(ifconfig wlan0 | grep 'inet ' | awk '{print $2}')
  
  echo -e "${GREEN}"
  echo "================================================"
  echo "   🚀 iSponsorBlockTV ĐÃ SẴN SÀNG!"
  echo "================================================"
  # echo "  ${YELLOW}Để sử dụng:${GREEN}"
  # echo "  1. Vào Cài đặt WiFi trên Android"
  # echo "  2. Chọn mạng đang dùng → Chỉnh sửa"
  # echo "  3. Đặt Proxy: Manual"
  # echo "  4. Nhập:"
  # echo "     • Host: ${CYAN}$IP${GREEN}"
  # echo "     • Port: ${CYAN}8081${GREEN}"
  # echo "================================================"
  echo -e "${NC}"

  termux-wake-lock
  # am start -a android.settings.WIFI_SETTINGS 2>/dev/null
}

# ------------- MAIN SCRIPT -------------
clear
echo -e "${CYAN}"
cat << "EOF"
  ___________________________________________________
 /                                                    \
|   🚀 TIỆN ÍCH BỎ QUẢNG CÁO YOUTUBE - TERMUX EDITION  |
|         Phiên bản tự động - Thiết kế bởi Dang Vo    |
 \___________________________________________________/
EOF
echo -e "${NC}"

check_system
install_dependencies
setup_isponsorblock
run_adblock
