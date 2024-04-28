package InternalPurchasingAppAPI.service;

import InternalPurchasingAppAPI.client.dto.OrderDto;

public interface OrderService {
    OrderDto createOrder(OrderDto orderDto);

    OrderDto updateOrder(OrderDto orderDto);

    OrderDto getOrderById(String orderId);
}
