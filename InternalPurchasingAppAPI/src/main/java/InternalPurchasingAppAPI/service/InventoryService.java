package InternalPurchasingAppAPI.service;

import InternalPurchasingAppAPI.client.dto.InventoryDto;
import InternalPurchasingAppAPI.client.dto.ProductDto;

import java.util.List;

public interface InventoryService {
    InventoryDto createInventory(InventoryDto inventoryDto);

    InventoryDto getInventoryById(int id);

    List<InventoryDto> getAllInventory();

    InventoryDto updateInventory(int id, InventoryDto updatedProduct);

    void deleteInventory(int id);
}
