package InternalPurchasingAppAPI.persistence.repository;

import InternalPurchasingAppAPI.persistence.entitiy.Warehouse;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.UUID;

@Repository
public interface WarehouseRepository extends JpaRepository<Warehouse, UUID>
{
}
