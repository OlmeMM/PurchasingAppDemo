package InternalPurchasingAppAPI.persistence.entitiy;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.UUID;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "warehouseItems")
public class Inventory {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "warehouse")
    private Integer id;

    private UUID warehouseId;

    @Column(name = "upc")
    private Integer productId;

    @Column(name = "stock")
    private Integer stock;

}
