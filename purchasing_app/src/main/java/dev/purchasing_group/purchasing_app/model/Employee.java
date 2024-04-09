package dev.purchasing_group.purchasing_app.model;

import lombok.*;

import jakarta.persistence.*;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "employee")
public class Employee {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "empid")
    private Integer id;
    @Column(name = "ename")
    private String name;
    @Column(name = "address")
    private String address;
}