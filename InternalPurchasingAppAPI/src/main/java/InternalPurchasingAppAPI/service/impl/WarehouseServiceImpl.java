package InternalPurchasingAppAPI.service.impl;

import InternalPurchasingAppAPI.client.dto.WarehouseDto;
import InternalPurchasingAppAPI.exception.ResourceNotFoundException;
import InternalPurchasingAppAPI.mapper.WarehouseMapper;
import InternalPurchasingAppAPI.persistence.entitiy.Warehouse;
import InternalPurchasingAppAPI.persistence.repository.WarehouseRepository;
import InternalPurchasingAppAPI.service.WarehouseService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;


@Service
@AllArgsConstructor
public class WarehouseServiceImpl implements WarehouseService {

    private WarehouseRepository warehouseRepository;

    @Override
    public WarehouseDto createWarehouse(WarehouseDto warehouseDto) {
        Warehouse warehouse = WarehouseMapper.mapToWarehouse(warehouseDto);
        Warehouse newWarehouse = warehouseRepository.save(warehouse);
        return WarehouseMapper.mapToWarehouseDto(newWarehouse);
    }

    @Override
    public WarehouseDto getWarehouseById(UUID warehouseId) {
        Warehouse warehouse = warehouseRepository.findById(warehouseId)
                .orElseThrow(() ->
                        new ResourceNotFoundException("Warehouse ID: " + warehouseId + " does not exist"));

        return WarehouseMapper.mapToWarehouseDto(warehouse);
    }

    @Override
    public List<WarehouseDto> getAllWarehouses() {
        List<Warehouse> warehouses = warehouseRepository.findAll();
        return warehouses.stream().map((warehouse) -> WarehouseMapper.mapToWarehouseDto(warehouse))
                .collect(Collectors.toList());
    }

    @Override
    public WarehouseDto updateWarehouse(UUID warehouseId, WarehouseDto updatedWarehouse){
        Warehouse warehouse =  warehouseRepository.findById(warehouseId).orElseThrow(
                () -> new ResourceNotFoundException("No employee with corresponding id found, id: " + warehouseId)
        );

        warehouse.setAddress(updatedWarehouse.getAddress());
        warehouse.setLatitude(updatedWarehouse.getLatitude());
        warehouse.setLongitude(updatedWarehouse.getLongitude());
        // warehouse.setUpdatedAt(updatedWarehouse.getUpdatedAt());

        Warehouse updatedWarehouseObj = warehouseRepository.save(warehouse);
        return WarehouseMapper.mapToWarehouseDto(updatedWarehouseObj);
    }

    @Override
    public void deleteWarehouse(UUID warehouseId) {
        Warehouse warehouse =  warehouseRepository.findById(warehouseId).orElseThrow(
                () -> new ResourceNotFoundException("No employee with corresponding id found, id: " + warehouseId)
        );
        warehouseRepository.deleteById(warehouseId);
    }
}
