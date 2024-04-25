package InternalPurchasingAppAPI.client.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.UUID;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class InventoryDto {
    private int id;
    private UUID warehouseId;
    private Integer productId;
    private Integer stock;
}
