create database if not exists ecommerce_db;
use ecommerce_db;

create table users (
                       user_id int auto_increment primary key,
                       username varchar(50) not null unique,
                       password varchar(255) not null,
                       full_name varchar(100),
                       email varchar(100) unique,
                       phone varchar(20),
                       role varchar(20) default 'user'
);

create table categories (
                            category_id int auto_increment primary key,
                            category_name varchar(100) not null,
                            category_icon varchar(200)
);


create table products (
                          product_id int auto_increment primary key,
                          product_code varchar(10) unique,
                          product_name varchar(255) not null,
                          category_id int,
                          price decimal(10, 2) not null,
                          quantity int default 0,
                          description text,
                          image varchar(255),
                          created_at timestamp default current_timestamp,
                          is_active boolean default true,
                          foreign key (category_id) references categories(category_id) on delete set null
);

create table orders (
                        order_id int auto_increment primary key,
                        user_id int,
                        order_date timestamp default current_timestamp,
                        total_amount decimal(10, 2) not null,
                        status varchar(50) default 'pending',
                        foreign key (user_id) references users(user_id) on delete set null
);

create table order_details (
                               detail_id int auto_increment primary key,
                               order_id int not null,
                               product_id int not null,
                               price decimal(10, 2) not null,
                               quantity int not null,
                               subtotal decimal(10, 2) not null,
                               foreign key (order_id) references orders(order_id) on delete cascade,
                               foreign key (product_id) references products(product_id) on delete restrict
);

-- insert data
insert into categories (category_name,category_icon) values
                                                         ('Điện thoại', 'fas fa-mobile-alt'),
                                                         ('Laptop', 'fas fa-laptop'),
                                                         ('Tai nghe & Loa', 'fas fa-headphones'),
                                                         ('Chuột & Bàn phím', 'fas fa-keyboard');

-- insert into products (product_id, product_code, product_name, category_id, price, quantity, description, image, is_active) values
-- (1, 'IP15PM', 'iPhone 15 Pro Max 256GB', 1, 29500000.00, 15, 'Điện thoại Apple cao cấp nhất', 'iphone15.jpg', 1),
-- (2, 'SS24U', 'Samsung Galaxy S24 Ultra', 1, 26000000.00, 10, 'Flagship đỉnh cao của Samsung', 's24ultra.jpg', 1),
-- (3, 'OPPOX7', 'Oppo Find X7 Ultra', 1, 19500000.00, 8, 'Camera zoom tàu ngầm siêu khủng', 'oppox7.jpg', 1),
-- (4, 'XIA14U', 'Xiaomi 14 Ultra ống kính Leica', 1, 22500000.00, 12, 'Đỉnh cao nhiếp ảnh di động', 'xiaomi14.jpg', 1),
-- (5, 'IP14PM', 'iPhone 14 Pro Max 128GB', 1, 21000000.00, 5, 'Máy cũ đẹp keng xà beng', 'iphone14.jpg', 1),
-- (6, 'SSRE5G', 'Samsung Galaxy A55 5G', 1, 9500000.00, 20, 'Điện thoại tầm trung bán chạy', 'samsunga55.jpg', 1),
-- (7, 'REDNOTE', 'Redmi Note 15 6G 128G', 1, 5500000.00, 30, 'Cấu hình ngon bổ rẻ cho sinh viên', 'redmi13.jpg', 1),
-- (8, 'VIVV30', 'Vivo V30 5G Aura Light', 1, 11000000.00, 7, 'Chuyên gia chụp ảnh chân dung', 'vivo...jpg', 1),
-- (9, 'ROGP8', 'ASUS ROG Phone 8', 1, 24000000.00, 6, 'Quái vật gaming cho game thủ', 'rog8.jpg', 1),
-- (10, 'REAC12', 'Realme C65 giá rẻ', 1, 3500000.00, 40, 'Pin trâu sóng khỏe máy mượt', 'realme.jpg', 1),
-- (11, 'MACM3', 'MacBook Air M5 13 inch 2026', 2, 35490000.00, 8, 'Laptop mỏng nhẹ, hiệu năng cao', 'macbookm3.jpg', 1),
-- (12, 'ASUSTF', 'ASUS TUF Gaming A15', 2, 21500000.00, 11, 'Laptop gaming quốc dân bền bỉ', 'asustuf.jpg', 1),
-- (13, 'DELLVO', 'Dell Vostro 14 3430 Core i5', 2, 14000000.00, 15, 'Laptop văn phòng gọn nhẹ lịch lãm', 'dell3430.jpg', 1),
-- (14, 'HPPAVI', 'HP Pavilion 14 X360', 2, 16500000.00, 9, 'Màn hình cảm ứng xoay gập 360 độ', 'hppavilion.jpg', 1),
-- (15, 'LENTHI', 'Lenovo ThinkPad E14 Gen 5', 2, 18900000.00, 6, 'Bàn phím gõ sướng, siêu bền', 'thinkpad.jpg', 1),
-- (16, 'ACERNI', 'Acer Nitro V 15', 2, 19900000.00, 14, 'Tản nhiệt mát mẻ chiến game mượt', 'acernitro.jpg', 1),
-- (17, 'MSICYG', 'MSI Cyborg 15 B13WEKG-676VN', 2, 37490000.00, 10, 'Thiết kế bán trong suốt đậm chất cyber', 'msicyborg.jpg', 1),
-- (18, 'GIGAG5', 'Gigabyte G5 Gaming Laptop', 2, 16800000.00, 13, 'Cấu hình cao giá tốt phân khúc', 'gigag5.jpg', 1),
-- (19, 'MACPRO', 'MacBook Pro 14 M3 Pro', 2, 45000000.00, 4, 'Vũ khí tối thượng cho coder và đồ họa', 'macpro.jpg', 1),
-- (20, 'ASUSZE', 'ASUS Zenbook 14 OLED', 2, 23000000.00, 7, 'Màn hình OLED siêu đẹp rực rỡ', 'zenbook.jpg', 1),
-- (21, 'APPRO2', 'AirPods Pro 3 2025 Type-C', 3, 5500000.00, 30, 'AirPods Pro 3 chính thức ra mắt tháng 9/2025, đánh dấu bước ngoặt lớn của Apple trong phân khúc tai nghe True Wireless. Sản phẩm nổi bật với công nghệ chống ồn chủ động (ANC) mạnh gấp 2 lần so với AirPods Pro 2, đi kèm thiết kế công thái học gọn nhẹ giúp tăng cường trải nghiệm đeo. Đặc biệt, việc tích hợp cảm biến đo nhịp tim lần đầu tiên trên tai nghe biến thiết bị thành một trợ lý sức khỏe thông minh, hỗ trợ theo dõi chỉ số cơ thể thời gian thực một cách chính xác.', 'airpods.jpg', 1),
-- (22, 'SONWH1', 'Sony WH-1000XM6 Premium', 3, 6900000.00, 10, 'Tai nghe chụp tai chống ồn tốt nhất', 'sony_wh.jpg', 1),
-- (23, 'MARCH4', 'Loa Bluetooth Marshall Acton III', 3, 3600000.00, 15, 'Pin trâu 80 tiếng, thiết kế hoài cổ', 'marshall4.jpg', 1),
-- (24, 'JBLCH5', 'Loa Bluetooth JBL Charge 5', 3, 3400000.00, 25, 'Chống nước IP67, âm bass mạnh mẽ', 'jbl_charge5.jpg', 1),
-- (25, 'ANKS30', 'Soundcore Space One Pro (A3062)', 3, 4600000.00, 40, 'Tai nghe ngon bổ rẻ chống ồn tốt', 'anker_a40.jpg', 1),
-- (26, 'SONWF1', 'Tai nghe Bluetooth True Wireless Sony WF C500', 3, 1200000.00, 50, 'Nhiều màu sắc, âm thanh trong trẻo', 'sony_c500.jpg', 1),
-- (27, 'MARGO3', 'Loa Bluetooth Marshall Willen II', 3, 2500000.00, 18, 'Loa di động bỏ túi âm thanh chất', 'willen.jpg', 1),
-- (28, 'JBLGO4', 'Loa Bluetooth JBL Go 4', 3, 950000.00, 60, 'Nhỏ gọn treo balo đi du lịch', 'jbl_go4.jpg', 1),
-- (29, 'HAGAM1', 'Tai nghe Gaming Havit H2002d', 3, 450000.00, 100, 'Tai nghe gaming chụp tai mic rõ ràng', 'havit.jpg', 1),
-- (30, 'APOD3', 'Apple AirPods 3 Chính Hãng', 3, 4200000.00, 22, 'Thiết kế công thái học đeo thoải mái', 'airpods3.jpg', 1),
-- (31, 'LOGIGPRO', 'Chuột Logitech G Pro X Superlight', 4, 3200000.00, 12, 'Chuột gaming siêu nhẹ dành cho game thủ', 'logigpro.jpg', 1),
-- (32, 'AK75W', 'Bàn phím cơ Aula F75', 4, 1500000.00, 20, 'Bàn phím cơ gõ êm, kết nối 3 chế độ', 'aulaf75.jpg', 1),
-- (33, 'LOGIMX', 'Chuột Logitech MX Master 3S', 4, 2400000.00, 15, 'Vua chuột văn phòng, chống đau cổ tay', 'mx3s.jpg', 1),
-- (34, 'RAZDAV', 'Chuột Razer DeathAdder V3 Pro', 4, 3100000.00, 8, 'Chuột gaming form ôm tay cực đỉnh', 'razer_v3.jpg', 1),
-- (35, 'KEYK2V', 'Bàn phím cơ Keychron K2 V2', 4, 1850000.00, 14, 'Phù hợp hoàn hảo cho cả Mac và Windows', 'keychron_k2.jpg', 1),
-- (36, 'FUHLE9', 'Bàn phím cơ Fuhlen Eraser', 4, 750000.00, 35, 'Bàn phím cơ giá rẻ bất tử phòng net', 'fuhlen.jpg', 1),
-- (37, 'LOGIK1', 'Bộ phím chuột Logitech MK240', 4, 450000.00, 50, 'Bộ phím chuột không dây nhỏ gọn tiện lợi', 'mk240.jpg', 1),
-- (38, 'NEWMG1', 'Chuột Newmen G10 Huyền Thoại', 4, 150000.00, 200, 'Chuột gaming quốc dân siêu rẻ bền', 'newmen_g10.jpg', 1),
-- (39, 'DAREK4', 'Bàn phím DareU EK87', 4, 550000.00, 80, 'Bàn phím cơ TKL gọn gàng cho học sinh', 'dareu_ek87.jpg', 1),
-- (40, 'AKKO30', 'Bàn phím cơ Akko 3075B Plus', 4, 1950000.00, 10, 'Thiết kế đẹp, keycap siêu bền cá tính', 'akko3075.jpg', 1);