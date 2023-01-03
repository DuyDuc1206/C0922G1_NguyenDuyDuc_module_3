package service.impl;

import model.Product;
import repository.IProductRepository;
import repository.impl.ProductRepository;
import service.IProductService;

import java.util.List;

public class ProductService implements IProductService {
    private IProductRepository productRepository = new ProductRepository();
    @Override
    public List<Product> selectAllProduct() {
        return productRepository.selectAllProduct();
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
