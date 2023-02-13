package enums;

import lombok.Getter;

@Getter
public enum ReviewType {
	Approved("Approved"),
    Pending("Pending"),
	Denied("Denied"),
	Expired("Expired");

	private final String name;

    private ReviewType(String name) {
        this.name = name;
    }
}
