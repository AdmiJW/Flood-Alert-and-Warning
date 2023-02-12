package entity;
import lombok.*;

import javax.persistence.*;

@Entity
@Getter @Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class EvacPoint {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String pointName;

    @ManyToOne
    @JoinColumn(name = "location", referencedColumnName = "id")
    private Location location;

    @Column(nullable = false)
    private int capacity;

    @Column(nullable = false)
    private int currentOccupancy;

    @Column(nullable = true)
    private String remarks;

}
