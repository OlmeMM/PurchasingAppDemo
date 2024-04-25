package InternalPurchasingAppAPI.mapper;

import InternalPurchasingAppAPI.client.dto.WarehouseItemDto;
import InternalPurchasingAppAPI.persistence.entitiy.WarehouseItem;

public class WarehouseItemMapper {
    public static WarehouseItemDto mapToWarehouseItemDto(WarehouseItem warehouseItem){
        return new WarehouseItemDto(
                warehouseItem.getWarehouseId(),
                warehouseItem.getUPC(),
                warehouseItem.getStock()
        );
    }

    public static WarehouseItem mapToWarehouseItem(WarehouseItemDto warehouseItemDto){
        return new WarehouseItem(
                warehouseItemDto.getWarehouseId(),
                warehouseItemDto.getUPC(),
                warehouseItemDto.getStock()
        );
    }
}
