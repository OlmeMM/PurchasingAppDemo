package InternalPurchasingAppAPI.persistence.entitiy;

import jakarta.annotation.Nullable;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "products")
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @Column(name = "category_id", nullable = true) // Add nullable = false
    private Integer categoryId;

    @Column(name = "name")
    private String name;

    @Column(name = "price")
    private Float price;

}
