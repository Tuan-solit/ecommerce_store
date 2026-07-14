package com.example.ecommerce_store.repository;

import com.example.ecommerce_store.entities.*;
import com.example.ecommerce_store.utils.DBConnection;
import org.eclipse.tags.shaded.org.apache.xpath.operations.Or;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrderRepository implements IOrderRepository {

    private static final String INSERT_ORDER =
            "INSERT INTO orders(user_id,total_amount,status,receiver_name,phone,address,note) VALUES(?,?,?,?,?,?,?)";

    private static final String INSERT_ORDER_DETAIL =
            "INSERT INTO order_details(order_id,product_id,price,quantity,subtotal) VALUES(?,?,?,?,?)";

    private static final String SELECT_PRODUCT =
            "SELECT quantity FROM products WHERE product_id=?";

    private static final String UPDATE_PRODUCT =
            "UPDATE products SET quantity=? WHERE product_id=?";

    private static final String SELECT_ORDER_BY_USER = "SELECT * FROM orders WHERE user_id=? ORDER BY order_date DESC";


    private static final String SELECT_DETAIL_BY_ORDER = "SELECT od.*, p.product_name, p.image " +
            "FROM order_details od " +
            "JOIN products p " +
            "ON od.product_id=p.product_id " +
            "WHERE order_id=?";

    private static final String FIND_ORDER_BY_ID = "SELECT * FROM orders WHERE order_id = ?";

    @Override
    public boolean checkout(User user, Cart cart, Order order) {

        Connection connection = null;

        try {
            connection = DBConnection.getDBConnection();
            connection.setAutoCommit(false);

            // 1. Lưu Order

            PreparedStatement orderStmt = connection.prepareStatement(INSERT_ORDER, Statement.RETURN_GENERATED_KEYS);

            orderStmt.setInt(1, user.getId());
            orderStmt.setDouble(2, cart.getTotal());
            orderStmt.setString(3, "pending");
            orderStmt.setString(4, order.getReceiverName());
            orderStmt.setString(5, order.getPhone());
            orderStmt.setString(6, order.getAddress());
            orderStmt.setString(7, order.getNote());

            orderStmt.executeUpdate();

            ResultSet resultSet = orderStmt.getGeneratedKeys();

            int orderId = 0;

            if (resultSet.next()) {
                orderId = resultSet.getInt(1);
            } else {
                connection.rollback();
                return false;
            }

            // 2. Chuẩn bị Statement

            PreparedStatement detailStmt = connection.prepareStatement(INSERT_ORDER_DETAIL);

            PreparedStatement selectStmt = connection.prepareStatement(SELECT_PRODUCT);

            PreparedStatement updateStmt = connection.prepareStatement(UPDATE_PRODUCT);

            // 3. Duyệt giỏ hàng

            for (CartItem item : cart.getItems()) {

                // Lấy tồn kho mới nhất

                selectStmt.setInt(1, item.getProduct().getId());

                ResultSet productRs = selectStmt.executeQuery();

                int currentQuantity = 0;

                if (productRs.next()) {
                    currentQuantity = productRs.getInt("quantity");
                }
                productRs.close();

                // Kiểm tra tồn kho

                if (currentQuantity < item.getQuantity()) {
                    connection.rollback();
                    return false;
                }

                // Lưu Order Detail

                detailStmt.setInt(1, orderId);
                detailStmt.setInt(2, item.getProduct().getId());
                detailStmt.setDouble(3, item.getProduct().getPrice());
                detailStmt.setInt(4, item.getQuantity());
                detailStmt.setDouble(5, item.getSubTotal());

                detailStmt.executeUpdate();

                // Trừ kho

                updateStmt.setInt(1, currentQuantity - item.getQuantity());
                updateStmt.setInt(2, item.getProduct().getId());
                updateStmt.executeUpdate();
            }
            // Comit

            connection.commit();
            return true;

        } catch (Exception e) {
            try {
                if (connection != null) {
                    connection.rollback();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
            e.printStackTrace();
            return false;
        } finally {
            try {
                if (connection != null) {
                    connection.setAutoCommit(true);
                    connection.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    public List<Order> findByUser(int userId) {

        List<Order> orders = new ArrayList<>();

        try (
                Connection connection = DBConnection.getDBConnection();
                PreparedStatement ps =
                        connection.prepareStatement(SELECT_ORDER_BY_USER)
        ){

            ps.setInt(1,userId);

            ResultSet rs = ps.executeQuery();

            while(rs.next()){

                Order order = new Order();

                order.setOrderId(rs.getInt("order_id"));
                order.setOrderDate(rs.getTimestamp("order_date"));
                order.setTotalAmount(rs.getDouble("total_amount"));
                order.setStatus(rs.getString("status"));
                order.setReceiverName(rs.getString("receiver_name"));
                order.setPhone(rs.getString("phone"));
                order.setAddress(rs.getString("address"));
                order.setNote(rs.getString("note"));

                orders.add(order);

            }

        }catch(Exception e){
            e.printStackTrace();
        }

        return orders;
    }


    @Override
    public List<OrderDetail> findByOrderDetail(int orderId) {

        List<OrderDetail> details = new ArrayList<>();

        try (
                Connection connection = DBConnection.getDBConnection();
                PreparedStatement ps =
                        connection.prepareStatement(SELECT_DETAIL_BY_ORDER)
        ) {

            ps.setInt(1, orderId);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Product product = new Product();

                product.setId(rs.getInt("product_id"));
                product.setName(rs.getString("product_name"));
                product.setImage(rs.getString("image"));

                OrderDetail detail = new OrderDetail();

                detail.setDetailId(rs.getInt("detail_id"));
                detail.setOrderId(rs.getInt("order_id"));
                detail.setProductId(rs.getInt("product_id"));
                detail.setPrice(rs.getDouble("price"));
                detail.setQuantity(rs.getInt("quantity"));
                detail.setSubTotal(rs.getDouble("subtotal"));

                detail.setProduct(product);

                details.add(detail);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return details;
    }

    @Override
    public Order findById(int orderId) {

        try (Connection connection = DBConnection.getDBConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_ORDER_BY_ID)) {

            preparedStatement.setInt(1, orderId);

            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                Order order = new Order();

                order.setOrderId(resultSet.getInt("order_id"));
                order.setUserId(resultSet.getInt("user_id"));
                order.setOrderDate(resultSet.getTimestamp("order_date"));
                order.setReceiverName(resultSet.getString("receiver_name"));
                order.setPhone(resultSet.getString("phone"));
                order.setAddress(resultSet.getString("address"));
                order.setNote(resultSet.getString("note"));
                order.setTotalAmount(resultSet.getDouble("total_amount"));
                order.setStatus(resultSet.getString("status"));

                return order;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return null;
    }
}
