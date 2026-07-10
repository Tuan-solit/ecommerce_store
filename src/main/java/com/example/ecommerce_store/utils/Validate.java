package com.example.ecommerce_store.utils;

public class Validate {

    //User name: 4-20 ký tự, chỉ gồm chữ, số, dấu,...
    public static boolean isUsername(String username) {
        return username != null && username.matches("^[a-zA-Z0-9._-]{4,20}$");
    }

//    //Password: 6-20 ký tự, ít nhất 1 chữ hoa, 1 chữ thường, 1 số, 1 ký tự đặc biệt
//    public static boolean isPassword(String password) {
//        return password != null && password.matches("^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]{6,20}$");
//    }

    //Password: Ít nhất 6 ký tự
    public static boolean isPassword(String password) {
        return password != null && password.length() >= 6;
    }

    //Họ tên: 2-50 ký tự, chỉ gồm chữ cái và khoảng trắng
    public static boolean isFullName(String fullName) {
        return fullName != null && fullName.matches("^[a-zA-Z\\s]{2,50}$");
    }

    //Email: định đạng email hợp lệ
    public static boolean isEmail(String email) {
        return email != null && email.matches("^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$");
    }

    //SĐT
    public static boolean isPhone(String phone) {
        return phone != null && phone.matches("^0\\d{9}$");
    }
}
