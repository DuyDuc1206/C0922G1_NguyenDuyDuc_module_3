package repository.impl;

import model.Product;
import repository.IProductRepository;

import java.util.ArrayList;
import java.util.List;

public class ProductRepository implements IProductRepository {
    private static List<Product> productList = new ArrayList<>();
    static {
        productList.add(new Product(1,"telephone",20000,"new","samsung"));
        productList.add(new Product(2,"laptop",50000,"old","dell"));
        productList.add(new Product(3,"car",800000,"new and old","lamborghini"));
    }
    @Override
    public List<Product> selectAllProduct() {
        return productList;
    }

    @Override
    public boolean addProduct(Product product) {
        return false;
    }

    @Override
    public boolean editProduct(Product product) {
        return false;
    }

    @Override
    public boolean deleteProduct(int id) {
        return false;
    }

    @Override
    public Product selectProductById(int id) {
        return null;
    }

    @Override
    public List<Product> selectProductByName(String name) {
        return null;
    }
}
