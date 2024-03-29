package entity;

import enums.ReviewType;
import lombok.*;

import javax.persistence.*;

@Entity
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Report {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@ManyToOne
	@JoinColumn(name="user", referencedColumnName = "id")
	private User user;

	@ManyToOne
	@JoinColumn(name = "state", referencedColumnName = "id")
	private State state;

	@ManyToOne
	@JoinColumn(name = "district", referencedColumnName = "id")
	private District district;

	@ManyToOne
	@JoinColumn(name = "location", referencedColumnName = "id")
	private Location location;

	@Column(nullable = false)
	private String submission_date;

	@Column
	private String media_path;

	@Column
	private String detail;

	@Column
	private String review_status;
}
