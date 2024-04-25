package InternalPurchasingAppAPI.client.dto;

import InternalPurchasingAppAPI.persistence.entitiy.InternalOrderItem;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class PlacedInternalOrderDto {
    private InternalOrderDto placedOrder;
    private List<InternalOrderItemDto> placedOrderItems;
}
