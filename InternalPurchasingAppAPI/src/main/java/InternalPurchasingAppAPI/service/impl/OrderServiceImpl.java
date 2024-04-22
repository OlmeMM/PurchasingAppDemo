package InternalPurchasingAppAPI.service.impl;

import InternalPurchasingAppAPI.client.dto.OrderDto;
import InternalPurchasingAppAPI.exception.ResourceNotFoundException;
import InternalPurchasingAppAPI.mapper.OrderMapper;
import InternalPurchasingAppAPI.persistence.entitiy.Order;
import InternalPurchasingAppAPI.persistence.repository.OrderRepository;
import InternalPurchasingAppAPI.service.OrderService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;


@Service
@AllArgsConstructor
public class OrderServiceImpl implements OrderService {

    private OrderRepository orderRepository;

    @Override
    public OrderDto createOrder(OrderDto orderDto) {
        Order order = OrderMapper.mapToOrder(orderDto);
        Order newOrder = orderRepository.save(order);
        OrderDto returningDto = OrderMapper.mapToOrderDto(newOrder);
        return returningDto;
    }

    @Override
    public OrderDto getOrderById(UUID orderId) {
        Order order = orderRepository.findById(orderId)
                .orElseThrow(() ->
                        new ResourceNotFoundException("Order ID: " + orderId + " does not exist"));

        return OrderMapper.mapToOrderDto(order);
    }

    @Override
    public List<OrderDto> getAllOrders() {
        List<Order> orders = orderRepository.findAll();
         List<OrderDto> orderList = orders.stream().map((order) -> OrderMapper.mapToOrderDto(order))
                .collect(Collectors.toList());
        return orderList;
    }

    @Override
    public OrderDto updateOrder(UUID orderId, OrderDto updatedOrder){
        Order order =  orderRepository.findById(orderId).orElseThrow(
                () -> new ResourceNotFoundException("No employee with corresponding id found, id: " + orderId)
        );

        order.setCustomerId(updatedOrder.getCustomerId());
        // order.setUpdatedAt(updatedOrder.getUpdatedAt());

        Order updatedOrderObj = orderRepository.save(order);
        return OrderMapper.mapToOrderDto(updatedOrderObj);
    }

    @Override
    public void deleteOrder(UUID orderId) {
        Order order =  orderRepository.findById(orderId).orElseThrow(
                () -> new ResourceNotFoundException("No employee with corresponding id found, id: " + orderId)
        );
        orderRepository.deleteById(orderId);
    }
}
