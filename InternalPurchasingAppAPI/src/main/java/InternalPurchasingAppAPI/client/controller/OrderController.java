package InternalPurchasingAppAPI.client.controller;
import InternalPurchasingAppAPI.client.dto.OrderDto;
import InternalPurchasingAppAPI.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.*;


@RestController
@RequestMapping("/orders")
public class OrderController {

    private final OrderService orderService;

    @Autowired
    public OrderController(OrderService orderService) {
        this.orderService = orderService;
    };

    @PostMapping("/create")
    public ResponseEntity<OrderDto> createOrder(@RequestBody OrderDto orderDto){
        OrderDto newOrder = orderService.createOrder(orderDto);
        return ResponseEntity.ok(newOrder);
    }

    @GetMapping("/find/{id}")
    public ResponseEntity<OrderDto> getOrderById(@PathVariable("id") UUID orderId){
        OrderDto orderDto = orderService.getOrderById(orderId);
        return ResponseEntity.ok(orderDto);
    }

    @GetMapping("/getAll")
    public ResponseEntity<List<OrderDto>> getAllOrders(){
        List<OrderDto> orders = orderService.getAllOrders();
        ResponseEntity<List<OrderDto>> checkingDto = ResponseEntity.ok(orders);
        return checkingDto;
    }

    @PostMapping("/update/{id}")
    public ResponseEntity<OrderDto> updateOrder(@PathVariable("id") UUID orderId, @RequestBody OrderDto updatedOrder){
        OrderDto orderDto = orderService.updateOrder(orderId, updatedOrder);
        return ResponseEntity.ok(orderDto);
    }

    @DeleteMapping
    public ResponseEntity<String> deleteOrder(UUID orderId){
        orderService.deleteOrder(orderId);
        return ResponseEntity.ok("Order deleted successfully!");
    }
}