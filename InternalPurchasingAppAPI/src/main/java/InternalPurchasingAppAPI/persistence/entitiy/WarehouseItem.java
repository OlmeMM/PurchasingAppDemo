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
public class WarehouseItem {
    @Id
    @GeneratedValue
    @Column(name = "warehouse")
    private UUID warehouseId;

    @Column(name = "upc")
    private Integer UPC;

    @Column(name = "stock")
    private Integer stock;

}
