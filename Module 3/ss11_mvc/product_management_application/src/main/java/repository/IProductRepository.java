package repository;

import model.Product;

import java.util.List;

public interface IProductRepository {
    List<Product> selectAllProduct();

    boolean addProduct(Product product);

    boolean editProduct(Product product);

    boolean deleteProduct(int id);

    Product selectProductById(int id);

    List<Product> selectProductByName(String name);
}
