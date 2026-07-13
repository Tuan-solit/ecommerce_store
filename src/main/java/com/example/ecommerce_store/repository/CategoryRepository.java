package com.example.ecommerce_store.repository;

import com.example.ecommerce_store.entities.Category;
import com.example.ecommerce_store.utils.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CategoryRepository implements ICategoryRepository {
    private final String SELECT_ALL = "select * from ecommerce_db.categories;";
    private final String DELETE = "delete from categories where category_id = ?";
    private final String INSERT_INTO = "insert into categories (category_name) values (?);";
    private final String UPDATE = "update categories set category_name = ? where (category_id = ?);";

    @Override
    public List<Category> getCategoryList() {
        List<Category> categoryList = new ArrayList<>();
        try (
                Connection connection = DBConnection.getDBConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
        ) {
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("category_id");
                String name = resultSet.getString("category_name");
                String icon = resultSet.getString("category_icon");
                Category category = new Category(id, name, icon);
                categoryList.add(category);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return categoryList;
    }

    @Override
    public boolean add(Category category) {
        try (
                Connection connection = DBConnection.getDBConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(INSERT_INTO);
        ) {
            preparedStatement.setString(1,category.getName());
            int effectRow = preparedStatement.executeUpdate();
            return effectRow == 1;
        } catch (SQLException e) {
            System.out.println("---loi ket noi DB");
        }
        return false;
    }

    @Override
    public boolean edit(Category category) {
        try (
                Connection connection = DBConnection.getDBConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(UPDATE);
        ) {
            preparedStatement.setString(1,category.getName());
            preparedStatement.setInt(2,category.getId());
            int effectRow = preparedStatement.executeUpdate();
            return effectRow == 1;
        } catch (SQLException e) {
            System.out.println("---loi ket noi DB");
        }
        return false;
    }

    @Override
    public boolean delete(int id) {
        try (
                Connection connection = DBConnection.getDBConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(DELETE);
        ) {
            preparedStatement.setInt(1, id);
            int rowAffected = preparedStatement.executeUpdate();
            return rowAffected > 0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }
}
