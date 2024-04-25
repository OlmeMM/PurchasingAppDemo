package InternalPurchasingAppAPI.persistence.repository;

import InternalPurchasingAppAPI.persistence.entitiy.Category;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CategoryRepository extends JpaRepository<Category, Integer> {
}
