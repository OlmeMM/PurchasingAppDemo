package InternalPurchasingAppAPI.service;
import InternalPurchasingAppAPI.client.dto.ProductDto;

import java.util.*;

public interface ProductService {
    ProductDto createProduct(ProductDto productDto);

    ProductDto getProductById(int productId);

    List<ProductDto> getAllProducts();

    ProductDto updateProduct(int productId, ProductDto updatedProduct);

    void deleteProduct(int productId);
}
