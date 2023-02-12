package model;


import lombok.*;

@Getter @Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class BingPin {
    private double latitude;
    private double longitude;
    private String name;
    private String description;
}
