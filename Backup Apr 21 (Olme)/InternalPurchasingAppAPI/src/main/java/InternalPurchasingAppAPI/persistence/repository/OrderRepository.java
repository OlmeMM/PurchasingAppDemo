package InternalPurchasingAppAPI.persistence.repository;
import InternalPurchasingAppAPI.persistence.entitiy.Order;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrderRepository extends JpaRepository<Order, String> {
}
