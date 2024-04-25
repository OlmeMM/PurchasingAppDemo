package InternalPurchasingAppAPI.client.dto;
import lombok.*;

import java.util.UUID;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class WarehouseDto {
    private UUID warehouseId;
    private String address;
    private float latitude;
    private float longitude;
}
