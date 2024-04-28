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
@Table(name = "internal_orders")
public class InternalOrder {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;
    private Float totalAmount;
    private Integer statusId;
    private Date deliveryDate;
    private String notes;
    private Date createdAt;
    private Date updatedAt;
    private Date deactivatedAt;
}
