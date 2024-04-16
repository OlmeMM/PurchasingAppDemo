package InternalPurchasingAppAPI.client.dto;
import lombok.*;

import java.util.Date;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class OrderDto {

    private String orderId;
    private String customerId;
    private Date createdAt;
}
