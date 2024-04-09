package dev.purchasing_group.purchasing_app.model;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.junit.jupiter.api.Order;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "taxes")

public class Taxes {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int Id;

    //joining the order_details table to the taxes table.
    @ManyToOne //This annotation indicates a many-to-one relationship between your entity and the Taxes entity
    @JoinColumn(name = "order_detail_Id", referencedColumnName = "id", insertable = false, updatable = false)
    private Taxes taxesForOrderDetail; //With these annotations in place, you establish a foreign key relationship between the orderDetailId field in your entity and the primary key (id) of the Taxes table.

    @ManyToOne
    @JoinColumn(name = "tax_types", referencedColumnName = "id", insertable = false, updatable = false )
    private Taxes taxesForTaxType;


    @Column(name = "amount")
    private int amount;

}
