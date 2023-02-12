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

	@Column(nullable = false)
	private String reporter_name;

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

	@Column(nullable = false)
	private String phone_no;

	@Column
	private String media_path;

	@Column
	private String detail;

	@Column
	private ReviewType review_status;
}
