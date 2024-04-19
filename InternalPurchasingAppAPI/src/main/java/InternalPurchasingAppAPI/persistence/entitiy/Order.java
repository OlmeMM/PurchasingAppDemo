package InternalPurchasingAppAPI.persistence.entitiy;

import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.JdbcTypeCode;
import org.hibernate.annotations.Type;
import org.hibernate.annotations.UuidGenerator;
import org.hibernate.type.SqlTypes;

import java.util.Date;
import java.util.UUID;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "orders")
public class Order {
    @Id
    @GeneratedValue
    @Column(name = "order_id")
    private UUID orderId;

    @UuidGenerator
    @Column(name = "customer_id")
    private UUID customerId;

    @Column(name = "created_at")
    private Date createdAt;
}
