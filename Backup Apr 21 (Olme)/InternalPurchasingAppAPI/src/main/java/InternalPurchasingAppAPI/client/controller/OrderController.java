package InternalPurchasingAppAPI.client.controller;
import InternalPurchasingAppAPI.client.dto.OrderDto;

import InternalPurchasingAppAPI.service.OrderService;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;


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
        return new ResponseEntity<>(newOrder, HttpStatus.OK);
    }

    @PostMapping("/update")
    public ResponseEntity<OrderDto> updateOrder(@RequestBody OrderDto orderDto){
        OrderDto updateOrder = orderService.updateOrder(orderDto);
        return new ResponseEntity<>(updateOrder, HttpStatus.OK);
    }

    @GetMapping("/find/{id}")
    public ResponseEntity<OrderDto> getOrderById(@PathVariable("id") String orderById){
        OrderDto orderDto = orderService.getOrderById(orderById);
        return ResponseEntity.ok(orderDto);
    }


}