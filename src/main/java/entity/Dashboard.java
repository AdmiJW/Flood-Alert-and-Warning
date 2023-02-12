package entity;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import enums.StationStatusType;
import lombok.*;

import javax.persistence.*;
import java.util.Date;


@Entity
@Getter @Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Dashboard {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "location", referencedColumnName = "id")
    private Location location;

    @Column(nullable = false)
    private float water;

    @Column
    private int rainfall;

    @Column
    private String date;

    @Column
    private StationStatusType status;
}
