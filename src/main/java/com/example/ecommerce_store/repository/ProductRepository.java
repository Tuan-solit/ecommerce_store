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
    private final String SELECT_ALL = "select p.*, c.category_name \n" +
            "from products p \n" +
            "inner join categories c on p.category_id = c.category_id";
    private final String SELECT_ALL_RANDOM = "select p.*, c.category_name \n" +
            "from products p \n" +
            "inner join categories c on p.category_id = c.category_id \n" +
            "where is_active = true order by rand()";

    // lay tat ca cho admin
    @Override
    public List<Product> getProductList() {
        List<Product> productList = new ArrayList<>();
        try (
                Connection connection = DBConnection.getDBConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
        ) {
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("product_id");
                String code = resultSet.getString("product_code");
                String name = resultSet.getString("product_name");
                int categoryId = resultSet.getInt("category_id");
                String categoryName = resultSet.getString("category_name");
                double price = resultSet.getDouble("price");
                int quantity = resultSet.getInt("quantity");
                String description = resultSet.getString("description");
                String image = resultSet.getString("image");
                java.util.Date created = resultSet.getTimestamp("created_at");
                boolean isActive = resultSet.getBoolean("is_active");
                Category category = new Category();
                category.setId(categoryId);
                category.setName(categoryName);
                Product product = new Product(id, code, name, price, quantity, description, image, created, isActive, category);
                productList.add(product);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return productList;
    }

    @Override
    public List<Product> getProductRandomList() {
        List<Product> productList = new ArrayList<>();
        try (
                Connection connection = DBConnection.getDBConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_RANDOM);
        ) {
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("product_id");
                String code = resultSet.getString("product_code");
                String name = resultSet.getString("product_name");
                int categoryId = resultSet.getInt("category_id");
                String categoryName = resultSet.getString("category_name");
                double price = resultSet.getDouble("price");
                int quantity = resultSet.getInt("quantity");
                String description = resultSet.getString("description");
                String image = resultSet.getString("image");
                java.util.Date created = resultSet.getTimestamp("created_at");
                boolean isActive = resultSet.getBoolean("is_active");
                Category category = new Category();
                category.setId(categoryId);
                category.setName(categoryName);
                Product product = new Product(id, code, name, price, quantity, description, image, created, isActive, category);
                productList.add(product);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return productList;
    }
}
