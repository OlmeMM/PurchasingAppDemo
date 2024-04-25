package InternalPurchasingAppAPI.client.controller;
import InternalPurchasingAppAPI.client.dto.InventoryDto;
import InternalPurchasingAppAPI.service.InventoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.*;


@RestController
@RequestMapping("/warehouse")
public class InventoryController {

    private final InventoryService InventoryService;

    @Autowired
    public InventoryController(InventoryService InventoryService) {
        this.InventoryService = InventoryService;
    };

    @PostMapping("/create")
    public ResponseEntity<InventoryDto> createInventory(@RequestBody InventoryDto InventoryDto){
        InventoryDto newInventory = InventoryService.createInventory(InventoryDto);
        return ResponseEntity.ok(newInventory);
    }

    @GetMapping("/find/{id}")
    public ResponseEntity<InventoryDto> getInventoryById(@PathVariable("id") int id){
        InventoryDto InventoryDto = InventoryService.getInventoryById(id);
        return ResponseEntity.ok(InventoryDto);
    }

    @GetMapping("/getAll")
    public ResponseEntity<List<InventoryDto>> getAllInventory(){
        List<InventoryDto> Inventory = InventoryService.getAllInventory();
        return ResponseEntity.ok(Inventory);
    }

    @PostMapping("/update/{id}")
    public ResponseEntity<InventoryDto> updateInventory(@PathVariable("id") int id, @RequestBody InventoryDto updatedInventory){
        InventoryDto InventoryDto = InventoryService.updateInventory(id, updatedInventory);
        return ResponseEntity.ok(InventoryDto);
    }

    @DeleteMapping
    public ResponseEntity<String> deleteInventory(int id){
        InventoryService.deleteInventory(id);
        return ResponseEntity.ok("Inventory deleted successfully!");
    }
}