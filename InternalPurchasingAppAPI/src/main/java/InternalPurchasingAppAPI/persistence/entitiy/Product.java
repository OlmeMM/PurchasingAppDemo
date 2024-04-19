package InternalPurchasingAppAPI.persistence.entitiy;
import jakarta.persistence.*;
import lombok.*;

import java.util.Date;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "products")
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "product_id")
    private Integer productId;

    @Column(name = "category_id")
    private Integer categoryId;

    @Column(name = "product_name")
    private String productName;

    @Column(name = "product_date")
    private Date productDate;

    @Column(name = "product_quantity")
    private Integer productQuantity;

    @Column(name = "warehouse_id")
    private String warehouseId;
}
