package dev.purchasing_group.purchasing_app.model;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.sql.Timestamp;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "order_details")

public class OrderDetails {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int Id;

    @ManyToOne
    @JoinColumn(name = "order_id", referencedColumnName = "Id", insertable = false, updatable = false)
    private OrderDetails orderDetails;


    @ManyToOne
    @JoinColumn(name = "product_id", referencedColumnName = "Id", insertable = false, updatable = false)
    private OrderDetails orderDetailsProductId;


    @Column(name = "quantity")
    private int quantity;

    @Column(name = "price")
    private int price;

    @Column(name = "discount")
    private Boolean discount;

    @Column(name = "total")
    private int total;

    @Column(name = "IDSK")
    private int IDSK;

    @Column(name = "fulfilled")
    private Boolean fulfilled;

    @Column(name = "ship_date")
    private Timestamp shipDate;

    @Column(name = "bill_date")
    private Timestamp billDate;


    @ManyToOne
    @JoinColumn(name = "shipping_company_id", referencedColumnName = "Id", insertable = false, updatable = false)
    private OrderDetails orderDetailsShippingCompany;


}
