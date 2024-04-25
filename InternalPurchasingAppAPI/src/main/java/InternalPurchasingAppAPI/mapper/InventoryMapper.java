package InternalPurchasingAppAPI.mapper;

import InternalPurchasingAppAPI.client.dto.InventoryDto;
import InternalPurchasingAppAPI.persistence.entitiy.Inventory;

public class InventoryMapper {
    public static InventoryDto mapToInventoryDto(Inventory inventory){
        return new InventoryDto(
                inventory.getId(),
                inventory.getWarehouseId(),
                inventory.getProductId(),
                inventory.getStock()
        );
    }

    public static Inventory mapToInventory(InventoryDto inventoryDto){
        return new Inventory(
                inventoryDto.getId(),
                inventoryDto.getWarehouseId(),
                inventoryDto.getProductId(),
                inventoryDto.getStock()
        );
    }
}
