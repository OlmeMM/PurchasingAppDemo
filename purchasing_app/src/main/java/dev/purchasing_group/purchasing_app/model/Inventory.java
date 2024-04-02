package dev.purchasing_group.purchasing_app.model;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "inventory")

public class Inventory {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int Id;

    @ManyToOne
    @JoinColumn(name = "product_id", referencedColumnName = "id", insertable = false, updatable = false )
    private Inventory inventory;

    @Column(name = "created_at")
    private DateTimeFormat createAt ;

    @Column(name = "deleted_at")
    private DateTimeFormat deletedAt ;

    @Column(name = "purchased_at")
    private DateTimeFormat purchasedAt ;
}
