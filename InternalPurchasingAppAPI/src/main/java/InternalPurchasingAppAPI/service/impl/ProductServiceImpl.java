package InternalPurchasingAppAPI.service.impl;

import InternalPurchasingAppAPI.client.dto.ProductDto;
import InternalPurchasingAppAPI.exception.ResourceNotFoundException;
import InternalPurchasingAppAPI.mapper.ProductMapper;
import InternalPurchasingAppAPI.persistence.entitiy.Product;
import InternalPurchasingAppAPI.persistence.repository.ProductRepository;
import InternalPurchasingAppAPI.service.ProductService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
@AllArgsConstructor
public class ProductServiceImpl implements ProductService {

    private ProductRepository productRepository;

    @Override
    public ProductDto createProduct(ProductDto productDto) {
        Product product = ProductMapper.mapToProduct(productDto);
        Product newProduct = productRepository.save(product);
        return ProductMapper.mapToProductDto(newProduct);
    }

    @Override
    public ProductDto getProductById(int productId) {
        Product product = productRepository.findById(productId)
                .orElseThrow(() ->
                        new ResourceNotFoundException("Order ID: " + productId + " does not exist"));

        return ProductMapper.mapToProductDto(product);
    }

    @Override
    public List<ProductDto> getAllProducts() {
        List<Product> products = productRepository.findAll();
        return products.stream().map((product) -> ProductMapper.mapToProductDto(product))
                .collect(Collectors.toList());
    }

    @Override
    public ProductDto updateProduct(int productId, ProductDto updatedProduct) {
        Product product =  productRepository.findById(productId).orElseThrow(
                () -> new ResourceNotFoundException("No employee with corresponding id found, id: " + productId)
        );

        product.setCategoryId(updatedProduct.getCategoryId());
        product.setProductName(updatedProduct.getProductName());
        product.setProductDate(updatedProduct.getProductDate());
        product.setProductQuantity(updatedProduct.getProductQuantity());
        product.setWarehouseId(updatedProduct.getWarehouseId());
        // product.setUpdatedAt(updatedOrder.getUpdatedAt());

        Product updatedProductObj = productRepository.save(product);
        return ProductMapper.mapToProductDto(updatedProductObj);
    }

    @Override
    public void deleteProduct(int productId) {
        Product product =  productRepository.findById(productId).orElseThrow(
                () -> new ResourceNotFoundException("No product with corresponding id found, id: " + productId)
        );
        productRepository.deleteById(productId);
    }
}
