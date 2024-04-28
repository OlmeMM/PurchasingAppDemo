package InternalPurchasingAppAPI.service.impl;

import InternalPurchasingAppAPI.client.dto.InventoryDto;
import InternalPurchasingAppAPI.exception.ResourceNotFoundException;
import InternalPurchasingAppAPI.mapper.InventoryMapper;
import InternalPurchasingAppAPI.persistence.entitiy.Inventory;
import InternalPurchasingAppAPI.persistence.repository.InventoryRepository;
import InternalPurchasingAppAPI.service.InventoryService;
import InternalPurchasingAppAPI.service.InventoryService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
@AllArgsConstructor
public class InventoryServiceImpl implements InventoryService {
    private InventoryRepository inventoryRepository;

    @Override
    public InventoryDto createInventory(InventoryDto inventoryDto) {
        Inventory inventory = InventoryMapper.mapToInventory(inventoryDto);
        Inventory newInventory = inventoryRepository.save(inventory);
        return InventoryMapper.mapToInventoryDto(newInventory);
    }

    @Override
    public InventoryDto getInventoryById(int id) {
        Inventory inventory = inventoryRepository.findById(id)
                .orElseThrow(() ->
                        new ResourceNotFoundException("Order ID: " + id + " does not exist"));

        return InventoryMapper.mapToInventoryDto(inventory);
    }

    @Override
    public List<InventoryDto> getAllInventory() {
        List<Inventory> inventoryList = inventoryRepository.findAll();
        return inventoryList.stream().map((inventory) -> InventoryMapper.mapToInventoryDto(inventory))
                .collect(Collectors.toList());
    }

    @Override
    public InventoryDto updateInventory(int id, InventoryDto updatedInventory) {
        Inventory inventory =  inventoryRepository.findById(id).orElseThrow(
                () -> new ResourceNotFoundException("No employee with corresponding id found, id: " + id)
        );

        inventory.setStock(updatedInventory.getStock());
        inventory.setWarehouseId(updatedInventory.getWarehouseId());
        inventory.setProductId(updatedInventory.getProductId());
        // inventory.setUpdatedAt(updatedOrder.getUpdatedAt());

        Inventory updatedInventoryObj = inventoryRepository.save(inventory);
        return InventoryMapper.mapToInventoryDto(updatedInventoryObj);
    }

    @Override
    public void deleteInventory(int id) {
        Inventory inventory =  inventoryRepository.findById(id).orElseThrow(
                () -> new ResourceNotFoundException("No inventory with corresponding id found, id: " + id)
        );
        inventoryRepository.deleteById(id);
    }
}
