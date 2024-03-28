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
public class Products {
    @Id
    @GeneratedValue(strategy =  GenerationType.IDENTITY)
    private int id;

    //each instance variable is initialized in a constructor and has a getter and a setter method.
    @Column(name = "sku")
    private String sku;

    @Column(name = "product_description")
    private String productDescription;

    @Column(name = "product_name")
    private String productName;

    @Column(name = "category_id")
    private String categoryId;

    @Column(name = "supplier_id")
    private int supplierId;

    @Column(name = "quantity_per_unit")
    private int quantityPerUnit;

    @Column(name = "unit_price")
    private int unitPrice;

    @Column(name = "msrp")
    private int msrp;

    @Column(name = "discount")
    private int discount;

    @Column(name = "unit_weight")
    private int unitWeight;

    @Column(name = "units_in_stock")
    private int unitsInStock;

    @Column(name = "units_in_active_order")
    private int unitsInActiveOrder;

    @Column(name = "product_available")
    private boolean productAvailable;

    @Column(name = "discount_available")
    private boolean discountAvailable;

    @Column(name = "picture")
    private String picture;

}
