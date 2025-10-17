package iuh.fit.se.bai1.entities;

public enum Gender {
    MALE("Male"),FEMALE("Female");
    private String name;

    private Gender(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "Gender{" +
                "name='" + name + '\'' +
                '}';
    }
}
