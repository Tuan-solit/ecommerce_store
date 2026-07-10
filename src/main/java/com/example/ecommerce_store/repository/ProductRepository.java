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
    public List<Product> search(String keyword) {
        List<Product> products = new ArrayList<>();

        try (Connection connection = DBConnection.getDBConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SEARCH);) {

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

    @Override
    public Product findById(int id) {
        try (Connection connection = DBConnection.getDBConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(FIND_BY_ID);) {

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
