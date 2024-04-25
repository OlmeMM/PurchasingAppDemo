package InternalPurchasingAppAPI.persistence.repository;

import InternalPurchasingAppAPI.persistence.entitiy.Inventory;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.UUID;

@Repository
public interface InventoryRepository extends JpaRepository<Inventory, Integer> {
}
