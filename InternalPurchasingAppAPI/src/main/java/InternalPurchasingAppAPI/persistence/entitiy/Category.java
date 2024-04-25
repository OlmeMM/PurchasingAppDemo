package InternalPurchasingAppAPI.persistence.entitiy;

import jakarta.persistence.*;
import lombok.*;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "categories")
public class Category {
    @Id
    @GeneratedValue
    @Column(name = "category_id")
    private int categoryId;

    @Column(name = "name")
    private String name;
}
