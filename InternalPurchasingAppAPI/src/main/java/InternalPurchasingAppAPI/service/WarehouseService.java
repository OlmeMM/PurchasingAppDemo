package InternalPurchasingAppAPI.service;
import InternalPurchasingAppAPI.client.dto.WarehouseDto;

import java.util.*;

public interface WarehouseService {
    WarehouseDto createWarehouse(WarehouseDto warehouseDto);

    WarehouseDto getWarehouseById(UUID warehouseId);

    List<WarehouseDto> getAllWarehouses();

    WarehouseDto updateWarehouse(UUID warehouseId, WarehouseDto updatedWarehouse);

    void deleteWarehouse(UUID warehouseId);
}
