package com.example.ecommerce_store.repository;

import com.example.ecommerce_store.entities.Category;
import com.example.ecommerce_store.entities.Product;
import com.example.ecommerce_store.utils.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductRepository implements IProductRepository {

    // ===================== USER =====================

    private static final String FIND_ALL = """
            SELECT p.*,
                   c.category_name,
                   c.category_icon
            FROM products p
            LEFT JOIN categories c
            ON p.category_id = c.category_id
            WHERE p.is_active = true
            ORDER BY p.created_at DESC
            """;

    private static final String FIND_BY_ID = """
            SELECT p.*,
                   c.category_name,
                   c.category_icon
            FROM products p
            LEFT JOIN categories c
            ON p.category_id = c.category_id
            WHERE p.product_id = ?
            """;

    private static final String SEARCH = """
            SELECT p.*,
                   c.category_name,
                   c.category_icon
            FROM products p
            LEFT JOIN categories c
            ON p.category_id = c.category_id
            WHERE p.product_name LIKE ?
            AND p.is_active = true
            ORDER BY p.created_at DESC
            """;

    // ===================== ADMIN =====================

    private static final String SELECT_ALL = """
            SELECT p.*,
                   c.category_name,
                   c.category_icon
            FROM products p
            INNER JOIN categories c
            ON p.category_id = c.category_id
            ORDER BY p.created_at DESC
            """;

    private static final String SELECT_ALL_RANDOM = """
            SELECT p.*,
                   c.category_name,
                   c.category_icon
            FROM products p
            INNER JOIN categories c
            ON p.category_id = c.category_id
            WHERE p.is_active = true
            ORDER BY RAND()
            """;

    private static final String INSERT_INTO = "insert into products (product_code, product_name, category_id, price, quantity, description, image, is_active) values(?,?,?,?,?,?,?,?)";
    private static final String UPDATE_INFO = "update products set product_code = ?, product_name = ?,category_id = ?, price = ?, quantity = ?, description = ?, image = ?, is_active = ? where product_id = ?;";
    private static final String UPDATE_STATUS = "update products set is_active = not is_active WHERE product_id = ?";
    // =====================================================
    // USER
    // =====================================================

    @Override
    public List<Product> findAll() {

        List<Product> products = new ArrayList<>();

        try (Connection connection = DBConnection.getDBConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(FIND_ALL);
             ResultSet resultSet = preparedStatement.executeQuery()) {

            while (resultSet.next()) {
                products.add(getProduct(resultSet));
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return products;
    }

    @Override
    public Product findById(int id) {

        try (Connection connection = DBConnection.getDBConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(FIND_BY_ID)) {

            preparedStatement.setInt(1, id);

            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                return getProduct(resultSet);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return null;
    }

    @Override
    public List<Product> search(String keyword) {

        List<Product> products = new ArrayList<>();

        try (Connection connection = DBConnection.getDBConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SEARCH)) {

            preparedStatement.setString(1, "%" + keyword + "%");

            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                products.add(getProduct(resultSet));
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return products;
    }

    // =====================================================
    // ADMIN
    // =====================================================

    @Override
    public List<Product> getProductList() {

        List<Product> productList = new ArrayList<>();

        try (Connection connection = DBConnection.getDBConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
             ResultSet resultSet = preparedStatement.executeQuery()) {

            while (resultSet.next()) {
                productList.add(getProduct(resultSet));
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return productList;
    }

    @Override
    public List<Product> getProductRandomList() {

        List<Product> productList = new ArrayList<>();

        try (Connection connection = DBConnection.getDBConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_RANDOM);
             ResultSet resultSet = preparedStatement.executeQuery()) {

            while (resultSet.next()) {
                productList.add(getProduct(resultSet));
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return productList;
    }

    @Override
    public boolean add(Product product) {
        try (Connection connection = DBConnection.getDBConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_INTO);
        ) {
            preparedStatement.setString(1, product.getProductCode());
            preparedStatement.setString(2,product.getName());
            preparedStatement.setInt(3,product.getCategory().getId());
            preparedStatement.setDouble(4,product.getPrice());
            preparedStatement.setInt(5,product.getQuantity());
            preparedStatement.setString(6, product.getDescription());
            preparedStatement.setString(7, product.getImage());
            preparedStatement.setBoolean(8, product.isActive());
            int effectRow = preparedStatement.executeUpdate();
            return effectRow == 1;
        } catch (SQLException e) {
            System.out.println("---loi ket noi DB");
        }
        return false;
    }

    @Override
    public boolean edit(Product product) {
        try (Connection connection = DBConnection.getDBConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_INFO);
        ) {
            preparedStatement.setString(1, product.getProductCode());
            preparedStatement.setString(2,product.getName());
            preparedStatement.setInt(3,product.getCategory().getId());
            preparedStatement.setDouble(4,product.getPrice());
            preparedStatement.setInt(5,product.getQuantity());
            preparedStatement.setString(6, product.getDescription());
            preparedStatement.setString(7, product.getImage());
            preparedStatement.setBoolean(8, product.isActive());
            preparedStatement.setInt(9,product.getId());
            int effectRow = preparedStatement.executeUpdate();
            return effectRow == 1;
        } catch (SQLException e) {
            System.out.println("---loi ket noi DB");
        }
        return false;
    }

    @Override
    public boolean delete(int id) {
        try (Connection connection = DBConnection.getDBConnection();
             PreparedStatement ps = connection.prepareStatement(UPDATE_STATUS)) {

            ps.setInt(1, id);

            int rowAffected = ps.executeUpdate();
            return rowAffected > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // =====================================================
    // DÙNG CHUNG
    // =====================================================

    private Product getProduct(ResultSet resultSet) throws SQLException {

        Product product = new Product();

        product.setId(resultSet.getInt("product_id"));
        product.setProductCode(resultSet.getString("product_code"));
        product.setName(resultSet.getString("product_name"));
        product.setPrice(resultSet.getDouble("price"));
        product.setQuantity(resultSet.getInt("quantity"));
        product.setDescription(resultSet.getString("description"));
        product.setImage(resultSet.getString("image"));
        product.setCreated(resultSet.getTimestamp("created_at"));
        product.setActive(resultSet.getBoolean("is_active"));

        Category category = new Category();

        category.setId(resultSet.getInt("category_id"));
        category.setName(resultSet.getString("category_name"));
        category.setIcon(resultSet.getString("category_icon"));

        product.setCategory(category);

        return product;
    }
    
    
}