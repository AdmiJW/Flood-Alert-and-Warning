package enums;


public enum UserType {
    ADMIN("ADMIN"),
    USER("USER");

    public final String name;

    private UserType(String name) {
        this.name = name;
    }
}
