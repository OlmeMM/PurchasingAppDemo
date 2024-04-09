package dev.purchasing_group.purchasing_app.model;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


//below are the annotations
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name= "Product_Suppliers")
public class ProductSuppliers {
    //id this annotation is used in java persistence api to denote the primary key of an entity in a database
    // It marks the field id as the primary key of the entity.
    @Id
    @GeneratedValue(strategy =  GenerationType.IDENTITY)
    private int id;

    @Column(name = "company_name")
    private String companyName;

    @Column(name = "address1")
    private String address1;

    @Column(name = "address2")
    private String address2;

    @Column(name = "city")
    private String city;

    @Column(name = "state")
    private String state;

    @Column(name = "postal_code")
    private int postalCode;

    @Column(name = "country")
    private String country;

    @Column(name = "phone_number")
    private int phoneNumber;

    @Column(name = "email")
    private String email;

    @Column(name = "url")
    private String url;

    @Column(name = "payment_methods")
    private String paymentMethods;

    @Column(name = "discount_type")
    private String discountType;

    @Column(name = "type_goods")
    private String typeGoods;

    @Column(name = "discount_available")
    private boolean discountAvailable;

    @Column(name = "current_order")
    private String currentOrder;


}
