package InternalPurchasingAppAPI.client.dto;
import lombok.*;

import java.util.Date;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor

public class InternalOrderItemDto {
    private Integer id;
    private Integer internalOrderId;
    private Integer productId;
    private Integer status;
}
