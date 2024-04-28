package InternalPurchasingAppAPI.client.controller;
import InternalPurchasingAppAPI.client.dto.WarehouseDto;
import InternalPurchasingAppAPI.service.WarehouseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.*;


@RestController
@RequestMapping("/warehouse")
public class WarehouseController {

    private final WarehouseService WarehouseService;

    @Autowired
    public WarehouseController(WarehouseService WarehouseService) {
        this.WarehouseService = WarehouseService;
    };

    @PostMapping("/create")
    public ResponseEntity<WarehouseDto> createWarehouse(@RequestBody WarehouseDto WarehouseDto){
        WarehouseDto newWarehouse = WarehouseService.createWarehouse(WarehouseDto);
        return ResponseEntity.ok(newWarehouse);
    }

    @GetMapping("/find/{id}")
    public ResponseEntity<WarehouseDto> getWarehouseById(@PathVariable("id") UUID WarehouseId){
        WarehouseDto WarehouseDto = WarehouseService.getWarehouseById(WarehouseId);
        return ResponseEntity.ok(WarehouseDto);
    }

    @GetMapping("/getAll")
    public ResponseEntity<List<WarehouseDto>> getAllWarehouses(){
        List<WarehouseDto> Warehouses = WarehouseService.getAllWarehouses();
        return ResponseEntity.ok(Warehouses);
    }

    @PostMapping("/update/{id}")
    public ResponseEntity<WarehouseDto> updateWarehouse(@PathVariable("id") UUID WarehouseId, @RequestBody WarehouseDto updatedWarehouse){
        WarehouseDto WarehouseDto = WarehouseService.updateWarehouse(WarehouseId, updatedWarehouse);
        return ResponseEntity.ok(WarehouseDto);
    }

    @DeleteMapping
    public ResponseEntity<String> deleteWarehouse(UUID WarehouseId){
        WarehouseService.deleteWarehouse(WarehouseId);
        return ResponseEntity.ok("Warehouse deleted successfully!");
    }
}