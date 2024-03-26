package dev.purchasing_group.purchasing_app.model;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import jakarta.persistence.*;


@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "Products")
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "sku")
    private String sku;

    @Column(name = "product_description")
    private String productDescription;

    @Column(name = "category_id")
    private int categoryId;

    @Column(name = "supplier_id")
    private int supplierId;

    @Column(name = "unit_price")
    private int unitPrice;

    @Column(name = "msrp")
    private int msrp;

    @Column(name = "discount")
    private int discount;

    @Column(name = "unit_weight")
    private int unitWeight;
}
