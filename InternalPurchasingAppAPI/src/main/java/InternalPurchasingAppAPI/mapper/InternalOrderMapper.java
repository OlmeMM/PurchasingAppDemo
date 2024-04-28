package InternalPurchasingAppAPI.mapper;


import InternalPurchasingAppAPI.client.dto.InternalOrderDto;
import InternalPurchasingAppAPI.persistence.entitiy.InternalOrder;

public class InternalOrderMapper {

    public static InternalOrderDto mapToInternalOrderDto(InternalOrder internalOrder){
        return new InternalOrderDto(
                internalOrder.getId(),
                internalOrder.getTotalAmount(),
                internalOrder.getStatusId(),
                internalOrder.getDeliveryDate(),
                internalOrder.getNotes(),
                internalOrder.getCreatedAt(),
                internalOrder.getUpdatedAt(),
                internalOrder.getDeactivatedAt()
        );
    }

    public static InternalOrder mapToInternalOrder(InternalOrderDto internalOrderDto){
        return new InternalOrder(
                internalOrderDto.getId(),
                internalOrderDto.getTotalAmount(),
                internalOrderDto.getStatusId(),
                internalOrderDto.getDeliveryDate(),
                internalOrderDto.getNotes(),
                internalOrderDto.getCreatedAt(),
                internalOrderDto.getUpdatedAt(),
                internalOrderDto.getDeactivatedAt()
        );
    }
}
