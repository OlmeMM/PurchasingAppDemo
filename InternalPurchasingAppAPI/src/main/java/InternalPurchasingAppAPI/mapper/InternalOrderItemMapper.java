package InternalPurchasingAppAPI.mapper;

import InternalPurchasingAppAPI.client.dto.InternalOrderItemDto;
import InternalPurchasingAppAPI.persistence.entitiy.InternalOrderItem;

public class InternalOrderItemMapper {

    public static InternalOrderItemDto mapToInternalOrderItemItemDto(InternalOrderItem internalOrderItem){
        return new InternalOrderItemDto(
                internalOrderItem.getId(),
                internalOrderItem.getInternalOrderId(),
                internalOrderItem.getProductId(),
                internalOrderItem.getStatus(),
                internalOrderItem.getCreatedAt(),
                internalOrderItem.getUpdatedAt(),
                internalOrderItem.getDeactivatedAt()
        );
    }

    public static InternalOrderItem mapToInternalOrderItem(InternalOrderItemDto internalOrderItemDto){
        return new InternalOrderItem(
                internalOrderItemDto.getId(),
                internalOrderItemDto.getInternalOrderId(),
                internalOrderItemDto.getProductId(),
                internalOrderItemDto.getStatus(),
                internalOrderItemDto.getCreatedAt(),
                internalOrderItemDto.getUpdatedAt(),
                internalOrderItemDto.getDeactivatedAt()
        );
    }
}
