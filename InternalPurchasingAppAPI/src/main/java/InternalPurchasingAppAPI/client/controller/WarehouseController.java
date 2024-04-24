//package InternalPurchasingAppAPI.client.controller;
//import InternalPurchasingAppAPI.client.dto.OrderDto;
//import InternalPurchasingAppAPI.service.OrderService;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.http.HttpStatus;
//import org.springframework.http.ResponseEntity;
//import org.springframework.web.bind.annotation.*;
//
//import java.util.*;
//
//
//@RestController
//@RequestMapping("/warehouse")
//public class WarehouseController {
//
//    private final WarehouseService warehouseService;
//
//    @Autowired
//    public WarehouseController(OrderService orderService) {
//        this.warehouseService = orderService;
//    };
//
//    @PostMapping("/create")
//    public ResponseEntity<OrderDto> createOrder(@RequestBody OrderDto orderDto){
//        OrderDto newWarehouse = warehouseService.createWarehouse(orderDto);
//        return ResponseEntity.ok(newWarehouse);
//    }
//
//    @GetMapping("/find/{id}")
//    public ResponseEntity<OrderDto> getOrderById(@PathVariable("id") UUID orderId){
//        OrderDto warehouseDto = warehouseService.getWarehouseById(orderId);
//        return ResponseEntity.ok(warehouseDto);
//    }
//
//    @GetMapping("/getAll")
//    public ResponseEntity<List<OrderDto>> getAllOrders(){
//        List<OrderDto> warehouses = warehouseService.getAllWarehouses();
//        ResponseEntity<List<OrderDto>> checkingDto = ResponseEntity.ok(warehouses);
//        return checkingDto;
//    }
//
//    @PostMapping("/update/{id}")
//    public ResponseEntity<OrderDto> updateOrder(@PathVariable("id") UUID orderId, @RequestBody OrderDto updatedOrder){
//        OrderDto warehouseDto = warehouseService.updateWarehouse(orderId, updatedOrder);
//        return ResponseEntity.ok(warehouseDto);
//    }
//
//    @DeleteMapping
//    public ResponseEntity<String> deleteOrder(UUID orderId){
//        warehouseService.deleteWarehouse(orderId);
//        return ResponseEntity.ok("Order deleted successfully!");
//    }
//}