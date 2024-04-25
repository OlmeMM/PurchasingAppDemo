package InternalPurchasingAppAPI.persistence.entitiy;

import jakarta.persistence.*;
import lombok.*;

import org.hibernate.annotations.UuidGenerator;

import java.util.Date;
import java.util.UUID;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "internal_order_items")
public class InternalOrderItem {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;
    private Integer internalOrderId;
    private Integer productId;
    private Integer status;
    private Date createdAt;
    private Date updatedAt;
    private Date deactivatedAt;
}
