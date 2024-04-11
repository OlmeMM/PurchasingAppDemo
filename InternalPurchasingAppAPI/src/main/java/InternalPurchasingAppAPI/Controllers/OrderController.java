package InternalPurchasingAppAPI.Controllers;
import InternalPurchasingAppAPI.Dtos.OrderDto;
//import InternalPurchasingAppAPI.Entities.Order;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("orders")
public class OrderController {
//    @Autowired
////    OrderService orderService;

    @GetMapping("/GetOrders")
    public String getOrders() {
        return "Testing the GetOrder route";
    }

    @PostMapping("/SendInfo")
    public String save(@RequestBody OrderDto order) {
        return "This is the ID: " + order.Id;
    }
//
//    @GetMapping(value = "/{id}", produces = "application/json")
//    public Book get(@PathVariable Long id) {
//        return bookService.get(id);
//    }
//
//    @PutMapping(value = "/{id}", consumes = "application/json", produces = "application/json")
//    public Book update(@PathVariable Long id, @RequestBody Book book) {
//        return bookService.update(id, book);
//    }
//
//    @DeleteMapping(value = "/{id}", produces = "application/json")
//    public void delete(@PathVariable Long id) {
//        bookService.delete(id);
//    }
}