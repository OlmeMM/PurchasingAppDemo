package InternalPurchasingAppAPI.mapper;

import InternalPurchasingAppAPI.client.dto.ProductDto;
import InternalPurchasingAppAPI.persistence.entitiy.Product;

public class ProductMapper {

    public static ProductDto mapToProductDto(Product product){
        return new ProductDto(
                product.getId(),
                product.getCategoryId(),
                product.getName(),
                product.getPrice()
        );
    }

    public static Product mapToProduct(ProductDto productDto){
        return new Product(
                productDto.getId(),
                productDto.getCategoryId(),
                productDto.getName(),
                productDto.getPrice()
        );
    }
}
