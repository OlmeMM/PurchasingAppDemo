package InternalPurchasingAppAPI.client.controller;
import InternalPurchasingAppAPI.client.dto.InternalOrderDto;
import InternalPurchasingAppAPI.client.dto.PlacedInternalOrderDto;
import InternalPurchasingAppAPI.persistence.entitiy.InternalOrder;
import InternalPurchasingAppAPI.persistence.entitiy.InternalOrderItem;
import InternalPurchasingAppAPI.service.InternalOrderService;
import org.apache.coyote.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.*;


@RestController
@RequestMapping("/internalOrder")
public class InternalOrderController {

    private final InternalOrderService orderService;

    @Autowired
    public InternalOrderController(InternalOrderService orderService) {
        this.orderService = orderService;
    };

    @PostMapping("/create")
    public ResponseEntity<InternalOrderDto> createInternalOrder(@RequestBody InternalOrderDto internalInternalOrderDto){
        InternalOrderDto newInternalOrder = orderService.createInternalOrder(internalInternalOrderDto);
        return ResponseEntity.ok(newInternalOrder);
    }

    @GetMapping("/find/{id}")
    public ResponseEntity<InternalOrderDto> getInternalOrderById(@PathVariable("id") Integer internalOrderId){
        InternalOrderDto internalInternalOrderDto = orderService.getInternalOrderById(internalOrderId);
        return ResponseEntity.ok(internalInternalOrderDto);
    }

    @GetMapping("/getAll")
    public ResponseEntity<List<InternalOrderDto>> getAllInternalOrders(){
        List<InternalOrderDto> orders = orderService.getAllInternalOrders();
        return ResponseEntity.ok(orders);
    }

    @PostMapping("/update/{id}")
    public ResponseEntity<InternalOrderDto> updateInternalOrder(@PathVariable("id") Integer internalOrderId, @RequestBody InternalOrderDto updatedInternalOrder){
        InternalOrderDto internalInternalOrderDto = orderService.updateInternalOrder(internalOrderId, updatedInternalOrder);
        return ResponseEntity.ok(internalInternalOrderDto);
    }

    @PostMapping("/placeOrder")
    public ResponseEntity<InternalOrderDto> placeAnInternalOrder(@RequestBody PlacedInternalOrderDto placedInternalOrderAttempt){
        InternalOrderDto placedOrderAttemptResponse = orderService.placeAnInternalOrder(placedInternalOrderAttempt);
        return ResponseEntity.ok(placedOrderAttemptResponse);
    }

//    //@PostMapping("/deactivate/{id}")
//    public ResponseEntity<InternalOrderDto> deactivateInternalOrder(Integer internalOrderId){
//        InternalOrderDto deactivatedDto = orderService.deactivateInternalOrder(internalOrderId);
//        return ResponseEntity.ok(deactivatedDto);
//    }


    @DeleteMapping
    public ResponseEntity<String> deleteInternalOrder(Integer internalOrderId){
        orderService.deleteInternalOrder(internalOrderId);
        return ResponseEntity.ok("InternalOrder deleted successfully!");
    }
}