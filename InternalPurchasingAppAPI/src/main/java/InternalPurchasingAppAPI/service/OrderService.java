package InternalPurchasingAppAPI.service;

import InternalPurchasingAppAPI.client.dto.OrderDto;

import java.util.*;

public interface OrderService {
    OrderDto createOrder(OrderDto orderDto);

    OrderDto getOrderById(UUID orderId);

    List<OrderDto> getAllOrders();

    OrderDto updateOrder(UUID orderId, OrderDto updatedOrder);

    void deleteOrder(UUID orderId);

}
