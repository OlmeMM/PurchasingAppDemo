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
@Table(name = "internal_orders")

public class InternalOrders {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int Id;

    @ManyToOne
    @JoinColumn(name = "customer_id", referencedColumnName = "Id", insertable = false, updatable = false)
    private InternalOrders internalOrder;

    @Column(name = "ship_date")
    private Timestamp shipDate;

    @Column(name = "order_date")
    private Timestamp orderDate;

    @Column(name = "order_number")
    private int orderNumber;

    @ManyToOne
    @JoinColumn(name = "payment_id", referencedColumnName = "Id", insertable = false, updatable = false)
    private InternalOrders internalOrderPaymentId;

    @Column(name = "sales_tax")
    private int salesTax;

    @Column(name = "transaction_status")
    private String transactionStatus;

    @Column(name = "err_msg")
    private String errMsg;

    @Column(name = "fullfilled")
    private Boolean fullfilled;

    @Column(name = "deleted")
    private Boolean deleted;

    @Column(name = "paid")
    private Boolean paid;

    @Column(name = "payment_date")
    private Timestamp paymentDate;

}