package entity;

import lombok.*;

import javax.persistence.*;


@Entity
@Getter @Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class State {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, unique = true)
    private String name;
}
