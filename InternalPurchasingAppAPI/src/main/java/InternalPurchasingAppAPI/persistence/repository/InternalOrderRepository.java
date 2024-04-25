package InternalPurchasingAppAPI.persistence.repository;
import InternalPurchasingAppAPI.persistence.entitiy.InternalOrder;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;


@Repository
public interface InternalOrderRepository extends JpaRepository<InternalOrder, Integer> {
}
