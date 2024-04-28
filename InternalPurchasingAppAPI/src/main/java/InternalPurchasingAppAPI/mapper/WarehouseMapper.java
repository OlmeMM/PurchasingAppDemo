package InternalPurchasingAppAPI.mapper;

import InternalPurchasingAppAPI.client.dto.WarehouseDto;
import InternalPurchasingAppAPI.persistence.entitiy.Warehouse;

public class WarehouseMapper {
    public static WarehouseDto mapToWarehouseDto(Warehouse warehouse){
        return new WarehouseDto(
                warehouse.getWarehouseId(),
                warehouse.getAddress(),
                warehouse.getLatitude(),
                warehouse.getLongitude()
        );
    }

    public static Warehouse mapToWarehouse(WarehouseDto warehouseDto){
        return new Warehouse(
                warehouseDto.getWarehouseId(),
                warehouseDto.getAddress(),
                warehouseDto.getLatitude(),
                warehouseDto.getLongitude()
        );
    }

}
