# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Taikhoan.destroy_all
Sanpham.destroy_all
Donhang.destroy_all


Taikhoan.create([
  {
    username: 'admin',
    pass: 'admin',
    quyen: 'admin',
    email: 'admin@gmail.com',
    hoten: 'Trần Quốc Khánh',
    ngaysinh: '2003-09-02',
    diachi: '123 Đường A',
    sdt: '0123456789',
    avatar_url: 'th.jpg',
    giohang: ''

  },
  {
    username: 'user',
    pass: 'user',
    quyen: 'user',
    email: 'user2@example.com',
    hoten: 'Nguyễn Văn B',
    ngaysinh: '1992-02-02',
    diachi: '456 Đường B',
    sdt: '0987654321',
    avatar_url: 'th.jpg',
    giohang: ''
  }
  # Thêm các bản ghi khác nếu cần


])

Sanpham.create([
  {
    ten: 'Thịt bò',
    loai: 'Thịt',
    mota: 'Thịt bò tươi chất lượng cao, thích hợp cho các món nướng, xào, lẩu.',
    gia: 150000,  # Giá ví dụ
    soluong: 100, # Số lượng ví dụ
    donvi: 'kg',
    hinhanh: 'thitbo.jpg' # Đảm bảo hình ảnh có trong thư mục assets/images
  },

  {
    ten: 'Thịt heo',
    loai: 'Thịt',
    mota: 'Thịt bò tươi chất lượng cao, thích hợp cho các món nướng, xào, lẩu.',
    gia: 100000,  # Giá ví dụ
    soluong: 100, # Số lượng ví dụ
    donvi: 'kg',
    hinhanh: 'thitheo.jpg' # Đảm bảo hình ảnh có trong thư mục assets/images
  },

  {
    ten: 'Rau muống',
    loai: 'Rau',
    mota: '',
    gia: 20000,  # Giá ví dụ
    soluong: 100, # Số lượng ví dụ
    donvi: 'kg',
    hinhanh: 'raumuong.jpg' # Đảm bảo hình ảnh có trong thư mục assets/images
  },

  {
    ten: 'Cà chua',
    loai: 'Quả',
    mota: '',
    gia: 10000,  # Giá ví dụ
    soluong: 100, # Số lượng ví dụ
    donvi: 'kg',
    hinhanh: 'cachua.jpg' # Đảm bảo hình ảnh có trong thư mục assets/images
  },

  {
    ten: 'Dưa leo',
    loai: 'Quả',
    mota: '',
    gia: 5000,  # Giá ví dụ
    soluong: 100, # Số lượng ví dụ
    donvi: 'kg',
    hinhanh: 'dualeo.jpg' # Đảm bảo hình ảnh có trong thư mục assets/images
  },

  {
    ten: 'Salad',
    loai: 'Rau',
    mota: '',
    gia: 5000,  # Giá ví dụ
    soluong: 100, # Số lượng ví dụ
    donvi: 'kg',
    hinhanh: 'salad.jpg' # Đảm bảo hình ảnh có trong thư mục assets/images
  },

  {
    ten: 'Cải thìa',
    loai: 'Rau',
    mota: '',
    gia: 12000,  # Giá ví dụ
    soluong: 100, # Số lượng ví dụ
    donvi: 'kg',
    hinhanh: 'caithia.jpg' # Đảm bảo hình ảnh có trong thư mục assets/images
  },

  {
    ten: 'Cam',
    loai: 'Quả',
    mota: '',
    gia: 15000,  # Giá ví dụ
    soluong: 100, # Số lượng ví dụ
    donvi: 'kg',
    hinhanh: 'cam.jpg' # Đảm bảo hình ảnh có trong thư mục assets/images
  },

  {
    ten: 'Cà rốt',
    loai: 'Củ',
    mota: '',
    gia: 7000,  # Giá ví dụ
    soluong: 100, # Số lượng ví dụ
    donvi: 'kg',
    hinhanh: 'carot.jpg' # Đảm bảo hình ảnh có trong thư mục assets/images
  },

  {
    ten: 'Chanh',
    loai: 'Quả',
    mota: '',
    gia: 17000,  # Giá ví dụ
    soluong: 100, # Số lượng ví
    donvi: 'kg',
    hinhanh: 'chanh.jpg' # Đảm bảo hình ảnh có trong thư mục assets/images
  },

  {
    ten: 'Chuối',
    loai: 'Quả',
    mota: '',
    gia: 22000,  # Giá ví dụ
    soluong: 100, # Số lượng ví dụ
    donvi: 'kg',
    hinhanh: 'chuoi.jpg' # Đảm bảo hình ảnh có trong thư mục assets/images
  },

  {
    ten: 'Củ cải trắng',
    loai: 'Rau',
    mota: '',
    gia: 12000,  # Giá ví dụ
    soluong: 100, # Số lượng ví dụ
    donvi: 'kg',
    hinhanh: 'cucaitrang.jpg' # Đảm bảo hình ảnh có trong thư mục assets/images
  },

  {
    ten: 'Giá đỗ',
    loai: 'Rau',
    mota: '',
    gia: 10000,  # Giá ví dụ
    soluong: 100, # Số lượng ví dụ
    donvi: 'kg',
    hinhanh: 'giado.jpg' # Đảm bảo hình ảnh có trong thư mục assets/images
  },

  {
    ten: 'Gừng',
    loai: 'Củ',
    mota: '',
    gia: 8000,  # Giá ví dụ
    soluong: 100, # Số lượng ví dụ
    donvi: 'kg',
    hinhanh: 'gung.jpg' # Đảm bảo hình ảnh có trong thư mục assets/images
  },

  {
    ten: 'Khoai tây',
    loai: 'Củ',
    mota: '',
    gia: 20000,  # Giá ví dụ
    soluong: 100, # Số lượng ví dụ
    donvi: 'kg',
    hinhanh: 'khoaitay.jpg' # Đảm bảo hình ảnh có trong thư mục assets/images
  },

  {
    ten: 'Khổ qua',
    loai: 'Quả',
    mota: '',
    gia: 25000,  # Giá ví dụ
    soluong: 100, # Số lượng ví dụ
    donvi: 'kg',
    hinhanh: 'khoqua.jpg' # Đảm bảo hình ảnh có trong thư mục assets/images
  },

  {
    ten: 'Nấm đùi gà',
    loai: 'Rau',
    mota: '',
    gia: 24000,  # Giá ví dụ
    soluong: 100, # Số lượng ví dụ
    donvi: 'kg',
    hinhanh: 'namduiga.jpg' # Đảm bảo hình ảnh có trong thư mục assets/images
  },

  {
    ten: 'Nấm kim châm',
    loai: 'Rau',
    mota: '',
    gia: 9000,  # Giá ví dụ
    soluong: 100, # Số lượng ví dụ
    donvi: 'kg',
    hinhanh: 'namkimcham.jpg' # Đảm bảo hình ảnh có trong thư mục assets/images
  },

  {
    ten: 'Nho xanh',
    loai: 'Quả',
    mota: '',
    gia: 80000,  # Giá ví dụ
    soluong: 100, # Số lượng ví dụ
    donvi: 'kg',
    hinhanh: 'nho.jpg' # Đảm bảo hình ảnh có trong thư mục assets/images
  },

  {
    ten: 'Táo xanh',
    loai: 'Quả',
    mota: '',
    gia: 36000,  # Giá ví dụ
    soluong: 100, # Số lượng ví dụ
    donvi: 'kg',
    hinhanh: 'taoxanh.jpg' # Đảm bảo hình ảnh có trong thư mục assets/images
  },

  {
    ten: 'Tỏi',
    loai: 'Củ',
    mota: '',
    gia: 15000,  # Giá ví dụ
    soluong: 100, # Số lượng ví dụ
    donvi: 'kg',
    hinhanh: 'toi.jpg' # Đảm bảo hình ảnh có trong thư mục assets/images
  },

  {
    ten: 'Ức gà',
    loai: 'Thịt',
    mota: '',
    gia: 50000,  # Giá ví dụ
    soluong: 100, # Số lượng ví dụ
    donvi: 'kg',
    hinhanh: 'ucga.jpg' # Đảm bảo hình ảnh có trong thư mục assets/images
  },

  {
    ten: 'Thùng sữa Milo',
    loai: 'Sữa',
    mota: '',
    gia: 360000,  # Giá ví dụ
    soluong: 100, # Số lượng ví dụ
    donvi: 'thùng',
    hinhanh: 'suamilo.jpg' # Đảm bảo hình ảnh có trong thư mục assets/images
  },
  {
    ten: 'Thùng sữa Grow Plus',
    loai: 'Sữa',
    mota: '',
    gia: 600000,  # Giá ví dụ
    soluong: 100, # Số lượng ví dụ
    donvi: 'thùng',
    hinhanh: 'suagrow.jpg' # Đảm bảo hình ảnh có trong thư mục assets/images
  },

  {
    ten: 'Thùng sữa TH true MILK',
    loai: 'Sữa',
    mota: '',
    gia: 460000,  # Giá ví dụ
    soluong: 100, # Số lượng ví dụ
    donvi: 'thùng',
    hinhanh: 'suath.jpg' # Đảm bảo hình ảnh có trong thư mục assets/images
  },

  {
    ten: 'Thùng sữa VinaMilk',
    loai: 'Sữa',
    mota: '',
    gia: 380000,  # Giá ví dụ
    soluong: 100, # Số lượng ví dụ
    donvi: 'thùng',
    hinhanh: 'suavina.jpg' # Đảm bảo hình ảnh có trong thư mục assets/images
  },

  {
    ten: 'Gạo Thái Hom Mali 5KG',
    loai: 'Gạo',
    mota: '',
    gia: 255000,  # Giá ví dụ
    soluong: 100, # Số lượng ví dụ
    donvi: 'bao',
    hinhanh: 'gaomali.jpg' # Đảm bảo hình ảnh có trong thư mục assets/images
  },

  {
    ten: 'Gạo thơm Neptune Nhãn vàng 5KG ',
    loai: 'Gạo',
    mota: '',
    gia: 300000,  # Giá ví dụ
    soluong: 100, # Số lượng ví dụ
    donvi: 'bao',
    hinhanh: 'gaoneptune.jpg' # Đảm bảo hình ảnh có trong thư mục assets/images
  },

  {
    ten: 'Gạo thơm Neptune Plus 5KG',
    loai: 'Gạo',
    mota: '',
    gia: 135000,  # Giá ví dụ
    soluong: 100, # Số lượng ví dụ
    donvi: 'bao',
    hinhanh: 'gaoneptuneplus.jpg' # Đảm bảo hình ảnh có trong thư mục assets/images
  },

  {
    ten: 'Gạo thơm Neptune Special 5KG',
    loai: 'Gạo',
    mota: '',
    gia: 195000,  # Giá ví dụ
    soluong: 100, # Số lượng ví dụ
    donvi: 'bao',
    hinhanh: 'gaoneptunespec.jpg' # Đảm bảo hình ảnh có trong thư mục assets/images
  },

  {
    ten: 'Đùi gà góc tư',
    loai: 'Thịt',
    mota: '',
    gia: 80000,  # Giá ví dụ
    soluong: 100, # Số lượng ví dụ
    donvi: 'kg',
    hinhanh: 'duiga.jpg' # Đảm bảo hình ảnh có trong thư mục assets/images
  },

  {
    ten: 'Cánh gà',
    loai: 'Thịt',
    mota: '',
    gia: 100000,  # Giá ví dụ
    soluong: 100, # Số lượng ví dụ
    donvi: 'kg',
    hinhanh: 'canhga.jpg' # Đảm bảo hình ảnh có trong thư mục assets/images
  },

  {
    ten: 'Gạo ST25 5KG',
    loai: 'Gạo',
    mota: '',
    gia: 190000,  # Giá ví dụ
    soluong: 100, # Số lượng ví dụ
    donvi: 'bao',
    hinhanh: 'gaost.jpg' # Đảm bảo hình ảnh có trong thư mục assets/images
  }

])
