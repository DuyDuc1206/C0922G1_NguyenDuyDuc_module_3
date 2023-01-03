package repository.impl;

import model.Product;
import repository.IProductRepository;

import java.util.ArrayList;
import java.util.List;

public class ProductRepository implements IProductRepository {
    private static List<Product> productList = new ArrayList<>();

    static {
        productList.add(new Product(1, "telephone", 20000, "new", "samsung"));
        productList.add(new Product(2, "laptop", 50000, "old", "dell"));
        productList.add(new Product(3, "car", 800000, "new and old", "lamborghini"));
    }

    @Override
    public List<Product> selectAllProduct() {
        return productList;
    }

    @Override
    public void addProduct(Product product) {
        productList.add(product);
    }

    @Override
    public void editProduct(int id, Product product) {
        for (int i = 0; i < productList.size(); i++) {
            if (productList.get(i).getId() == id) {
                productList.set(id, product);
            }
        }
    }

    @Override
    public void deleteProduct(int id) {
        productList.remove(id);
    }

    @Override
    public Product selectProductById(int id) {
        Product product = null;
        for (int i = 0; i < productList.size(); i++) {
            if (productList.get(i).getId() == id) {
                product = productList.get(i);
            }
        }
        return product;
    }

    @Override
    public List<Product> selectProductByName(String name) {
        return null;
    }
}
