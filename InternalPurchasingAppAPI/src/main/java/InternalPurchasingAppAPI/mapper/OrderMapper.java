package InternalPurchasingAppAPI.mapper;


import InternalPurchasingAppAPI.client.dto.OrderDto;
import InternalPurchasingAppAPI.persistence.entitiy.Order;

public class OrderMapper {

    public static OrderDto mapToOrderDto(Order order){
        return new OrderDto(
                order.getOrderId(),
                order.getCustomerId(),
                order.getCreatedAt()
        );
    }

    public static Order mapToOrder(OrderDto orderDto){
        return new Order(
                orderDto.getOrderId(),
                orderDto.getCustomerId(),
                orderDto.getCreatedAt()
        );
    }
}
