CREATE DATABASE IF NOT EXISTS shopping_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE shopping_db;

DROP TABLE IF EXISTS `product`;
DROP TABLE IF EXISTS `category`;
DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `email` VARCHAR(255) UNIQUE NOT NULL,
    `username` VARCHAR(100) UNIQUE NOT NULL,
    `fullname` VARCHAR(255) NOT NULL,
    `password` VARCHAR(255) NOT NULL,
    `avatar` VARCHAR(255) DEFAULT 'admin.png',
    `roleid` INT NOT NULL DEFAULT 1,
    `phone` VARCHAR(20) NULL,
    `createddate` DATE NULL,
    `status` INT DEFAULT 0,
    `code` VARCHAR(10) NULL,
    `code_expired` DATETIME NULL
);

CREATE TABLE `category` (
    `cate_id` INT AUTO_INCREMENT PRIMARY KEY,
    `cate_name` VARCHAR(255) NOT NULL,
    `icons` VARCHAR(255) NULL
);

CREATE TABLE `product` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `product_name` VARCHAR(255) NOT NULL,
    `price` DOUBLE NOT NULL,
    `description` TEXT NULL,
    `image` VARCHAR(255) NULL,
    `cate_id` INT,
    FOREIGN KEY (`cate_id`) REFERENCES `category`(`cate_id`) ON DELETE CASCADE
);

INSERT INTO `user` (`email`, `username`, `fullname`, `password`, `avatar`, `roleid`, `phone`, `createddate`, `status`) VALUES
('24162129@student.hcmute.edu.vn', 'admin', 'Lê Thanh Toàn', '123', 'admin.png', 1, '0901234567', CURDATE(), 1);

INSERT INTO `category` (`cate_id`, `cate_name`, `icons`) VALUES
(1, 'Tai nghe', 'headphone.png'),
(2, 'Laptop', 'laptop.png'),
(3, 'Điện thoại', 'phone.png'),
(4, 'Đồng hồ thông minh', 'smartwatch.png'),
(5, 'Máy tính bảng', 'tablet.png');

INSERT INTO `product` (`product_name`, `price`, `description`, `image`, `cate_id`) VALUES
('Tai nghe Sony WH-1000XM5', 8490000, 'Chống ồn chủ động cao cấp, pin 30 giờ', 'tainghe-sony-xm5.png', 1),
('Tai nghe AirPods Pro 2', 5990000, 'Chống ồn ANC, Chip H2, sạc MagSafe', 'tainghe-airpods-pro2.png', 1),
('Tai nghe Marshall Major IV', 3690000, 'Thiết kế cổ điển, pin trâu 80 giờ', 'tainghe-marshall-major4.png', 1),

('Laptop MacBook Air M2', 26990000, 'Màn hình Liquid Retina, RAM 8GB, SSD 256GB', 'laptop-macbook-m2.png', 2),
('Laptop ASUS TUF Gaming F15', 18990000, 'Core i5 Gen 12, RTX 3050, 144Hz', 'laptop-asus-tuf.png', 2),
('Laptop Dell XPS 13 9320', 32990000, 'Thiết kế siêu mỏng nhẹ, Core i7 Gen 13', 'laptop-dell-xps13.png', 2),

('Điện thoại iPhone 15 Pro', 28990000, 'Khung Titanium, Chip A17 Pro siêu mạnh', 'dienthoai-iphone-15pro.png', 3),
('Điện thoại Samsung Galaxy S24 Ultra', 29990000, 'Tích hợp Galaxy AI, Camera 200MP', 'dienthoai-s24-ultra.png', 3),
('Điện thoại Xiaomi 14 Ultra', 24990000, 'Ống kính Leica cao cấp, Snapdragon 8 Gen 3', 'dienthoai-xiaomi-14u.png', 3),

('Apple Watch Series 9', 10490000, 'Màn hình Always-On, tính năng Double Tap', 'dongho-apple-watch-s9.png', 4),
('Samsung Galaxy Watch 6', 6990000, 'Đo nhịp tim, phân tích giấc ngủ chuyên sâu', 'dongho-galaxy-watch6.png', 4),
('Đồng hồ Garmin Forerunner 265', 11690000, 'Màn hình AMOLED, GPS đa băng tần hỗ trợ thể thao', 'dongho-galaxy-watch6.png', 4),

('Máy tính bảng iPad Air 5', 14990000, 'Chip M1 powerful, màn hình Retina 10.9 inch', 'maytinhbang-ipad-air5.png', 5),
('Máy tính bảng Samsung Galaxy Tab S9', 19990000, 'Màn hình 120Hz, kèm sẵn bút S-Pen', 'maytinhbang-tab-s9.png', 5),
('Máy tính bảng Xiaomi Pad 6', 7990000, 'Snapdragon 870, màn hình 2K mượt mà', 'maytinhbang-xiaomi-pad6.png', 5);