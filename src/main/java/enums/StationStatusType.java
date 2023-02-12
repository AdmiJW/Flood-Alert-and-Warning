package enums;

import lombok.Getter;

@Getter
public enum StationStatusType {
    RISING("rising"),
    RECEDING("receding"),
    NOCHANGE("no_change");


    private final String name;

    private StationStatusType(String name) {
        this.name = name;
    }
}