#!/bin/bash
set -e

# Nạp nvm để sử dụng Node Version Manager
. ~/.nvm/nvm.sh

# Lưu lại đường dẫn thư mục hiện tại
project_dir=$(pwd)

# Cấu hình ứng dụng backend
echo "Configuring backend application"
cd backend
echo "Dọn dẹp môi trường backend..."
pipenv --rm > /dev/null 2>&1 || true
echo "Hoàn thành dọn dẹp!"

echo "Cài đặt các thư viện phụ thuộc backend..."
pipenv install > /dev/null 2>&1
echo "Hoàn thành cấu hình backend!"
cd $project_dir

# Cấu hình ứng dụng frontend
echo "Configuring frontend application"
cd frontend
echo "Dọn dẹp môi trường frontend..."
npm run clean > /dev/null 2>&1

echo "Cài đặt các thư viện phụ thuộc frontend..."
nvm install > /dev/null 2>&1
npm ci --silent > /dev/null 2>&1
echo "Hoàn thành cấu hình frontend!"
cd $project_dir

# Thông báo hoàn tất
echo "Hoàn thành thiết lập môi trường làm việc 🚀"