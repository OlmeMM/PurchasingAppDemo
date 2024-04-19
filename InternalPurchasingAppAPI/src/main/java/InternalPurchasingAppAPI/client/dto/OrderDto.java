package InternalPurchasingAppAPI.client.dto;
import lombok.*;

import java.util.Date;
import java.util.UUID;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class OrderDto {

    private UUID orderId;
    private String customerId;
    private Date createdAt;
}
