package entity;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import lombok.*;

import javax.persistence.*;


@Entity
@Getter @Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Location {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String name;

    @OneToOne(cascade = {CascadeType.ALL})
    @JoinColumn(name = "state", referencedColumnName = "id")
    private State state;

    @OneToOne(cascade = {CascadeType.ALL})
    @JoinColumn(name = "district", referencedColumnName = "id")
    private District district;

    private Double lat;
    private Double lng;
}
