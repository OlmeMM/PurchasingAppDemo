package InternalPurchasingAppAPI.persistence.repository;
import InternalPurchasingAppAPI.persistence.entitiy.InternalOrderItem;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;


@Repository
public interface InternalOrderItemRepository extends JpaRepository<InternalOrderItem, Integer> {
}