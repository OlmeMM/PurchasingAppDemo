package InternalPurchasingAppAPI.persistence.entitiy;

import jakarta.persistence.*;
import lombok.*;

import java.util.UUID;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "warehouses")
public class Warehouse {
    @Id
    @GeneratedValue
    @Column(name = "warehouse_id")
    private UUID warehouseId;

    @Column(name = "address")
    private String address;

    @Column(name = "latitude")
    private float latitude;

    @Column(name = "longitude")
    private float longitude;

}
