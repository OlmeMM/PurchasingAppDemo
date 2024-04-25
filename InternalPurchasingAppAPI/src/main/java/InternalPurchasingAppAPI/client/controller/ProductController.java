package InternalPurchasingAppAPI.client.controller;
import InternalPurchasingAppAPI.client.dto.ProductDto;
import InternalPurchasingAppAPI.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.*;

@RestController
@RequestMapping("/product")
public class ProductController {
    private final ProductService productService;

    @Autowired
    public ProductController(ProductService productService){
        this.productService = productService;
    }

    @PostMapping("/create")
    public ResponseEntity<ProductDto> createOrder(@RequestBody ProductDto productDto){
        ProductDto newProduct = productService.createProduct(productDto);
        return new ResponseEntity<>(newProduct, HttpStatus.OK);
    }

    @GetMapping("/find/{id}")
    public ResponseEntity<ProductDto> getOrderById(@PathVariable("id") int productId){
        ProductDto productDto = productService.getProductById(productId);
        return ResponseEntity.ok(productDto);
    }

    @GetMapping("/getAll")
    public ResponseEntity<List<ProductDto>> getAllOrders(){
        List<ProductDto> products = productService.getAllProducts();
        return ResponseEntity.ok(products);
    }

    @PostMapping("/update/{id}")
    public ResponseEntity<ProductDto> updateProduct(@PathVariable("id") int productId, @RequestBody ProductDto updateProduct){
        ProductDto productDto = productService.updateProduct(productId, updateProduct);
        return ResponseEntity.ok(productDto);
    }

    @DeleteMapping
    public ResponseEntity<String> deleteOrder(int productId){
        productService.deleteProduct(productId);
        return ResponseEntity.ok("Order deleted successfully!");
    }
}