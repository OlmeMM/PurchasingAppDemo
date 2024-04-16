package InternalPurchasingAppAPI.service.impl;

import InternalPurchasingAppAPI.client.dto.OrderDto;
import InternalPurchasingAppAPI.exception.ResourceNotFoundException;
import InternalPurchasingAppAPI.mapper.OrderMapper;
import InternalPurchasingAppAPI.persistence.entitiy.Order;
import InternalPurchasingAppAPI.persistence.repository.OrderRepository;
import InternalPurchasingAppAPI.service.OrderService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;


@Service
@AllArgsConstructor
public class OrderServiceImpl implements OrderService {

    private OrderRepository orderRepository;

    @Override
    public OrderDto createOrder(OrderDto orderDto) {
        Order order = OrderMapper.mapToOrder(orderDto);
        Order newOrder = orderRepository.save(order);
        return OrderMapper.mapToOrderDto(newOrder);
    }

    @Override
    public OrderDto updateOrder(OrderDto orderDto){
        Order order =  OrderMapper.mapToOrder(orderDto);
        Order updatedOrder = orderRepository.save(order);
        return OrderMapper.mapToOrderDto(updatedOrder);
    }

    @Override
    public OrderDto getOrderById(String orderId) {
        Order order = orderRepository.findById(orderId)
                .orElseThrow(() ->
                        new ResourceNotFoundException("Order ID: " + orderId + " does not exist"));

        return OrderMapper.mapToOrderDto(order);
    }
}
