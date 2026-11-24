package com.org.rent.model;

public class Car {
    private int id;
    private String name;
    private String brand;
    private String type;
    private double pricePerDay;
    private String image;

    // Constructor
    public Car() {}

    public Car(int id, String name, String brand, String type, double pricePerDay, String image) {
        this.id = id;
        this.name = name;
        this.brand = brand;
        this.type = type;
        this.pricePerDay = pricePerDay;
        this.image = image;
    }

    // Getters and setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getBrand() { return brand; }
    public void setBrand(String brand) { this.brand = brand; }

    public String getType() { return type; }
    public void setType(String type) { this.type = type; }

    public double getPricePerDay() { return pricePerDay; }
    public void setPricePerDay(double pricePerDay) { this.pricePerDay = pricePerDay; }

    public String getImage() { return image; }
    public void setImage(String image) { this.image = image; }
}
