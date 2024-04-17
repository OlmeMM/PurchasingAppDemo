package InternalPurchasingAppAPI.client.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class ProductDto {
    private int productId;
    private int categoryId;
    private String productName;
    private Date productDate;
    private int productQuantity;
    private String warehouseId;
}
