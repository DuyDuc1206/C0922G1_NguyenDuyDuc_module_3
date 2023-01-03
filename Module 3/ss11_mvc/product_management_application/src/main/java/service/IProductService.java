package service;

import model.Product;

import java.util.List;

public interface IProductService {
    List<Product> selectAllProduct();

    void addProduct(Product product);

   void editProduct(int id,Product product);

    void deleteProduct(int id);

    Product selectProductById(int id);

    List<Product> selectProductByName(String name);
}
