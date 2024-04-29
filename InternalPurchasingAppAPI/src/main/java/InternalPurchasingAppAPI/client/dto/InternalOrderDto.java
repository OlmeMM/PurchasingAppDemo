package InternalPurchasingAppAPI.client.dto;
import lombok.*;

import java.time.LocalDateTime;
import java.util.Date;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class InternalOrderDto {
    private Integer id;
    private Float totalAmount;
    private Integer statusId;
    private String notes;

}