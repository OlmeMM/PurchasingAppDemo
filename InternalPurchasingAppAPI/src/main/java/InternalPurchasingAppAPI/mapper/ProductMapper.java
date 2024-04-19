package InternalPurchasingAppAPI.mapper;

import InternalPurchasingAppAPI.client.dto.ProductDto;
import InternalPurchasingAppAPI.persistence.entitiy.Product;

public class ProductMapper {

    public static ProductDto mapToProductDto(Product product){
        return new ProductDto(
                product.getProductId(),
                product.getCategoryId(),
                product.getProductName(),
                product.getProductDate(),
                product.getProductQuantity(),
                product.getWarehouseId()
        );
    }

    public static Product mapToProduct(ProductDto productDto){
        return new Product(
                productDto.getProductId(),
                productDto.getCategoryId(),
                productDto.getProductName(),
                productDto.getProductDate(),
                productDto.getProductQuantity(),
                productDto.getWarehouseId()
        );
    }
}
