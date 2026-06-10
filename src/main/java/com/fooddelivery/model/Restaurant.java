package com.fooddelivery.model;

public class Restaurant {

    private int restaurantId;
    private String restaurantName;
    private String cuisineType;
    private String address;
    private double rating;
    private int deliveryTime;     // BLOB image
    private boolean isActive;
    private String imageUrl;

    // No-argument constructor
    public Restaurant() {
    }

    // Getters and Setters

    public int getRestaurantId() {
        return restaurantId;
    }

    public void setRestaurantId(int restaurantId) {
        this.restaurantId = restaurantId;
    }

    public String getRestaurantName() {
        return restaurantName;
    }

    public void setRestaurantName(String restaurantName) {
        this.restaurantName = restaurantName;
    }

    public String getCuisineType() {
        return cuisineType;
    }

    public void setCuisineType(String cuisineType) {
        this.cuisineType = cuisineType;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public double getRating() {
        return rating;
    }

    public void setRating(double rating) {
        this.rating = rating;
    }

    public int getDeliveryTime() {
        return deliveryTime;
    }

    public void setDeliveryTime(int deliveryTime) {
        this.deliveryTime = deliveryTime;
    }


    public boolean isActive() {
        return isActive;
    }

    public void setActive(boolean isActive) {
        this.isActive = isActive;
    }
    
    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    @Override
    public String toString() {
        return "Restaurant [restaurantId=" + restaurantId + ", restaurantName=" + restaurantName + ", cuisineType="
                + cuisineType + ", address=" + address + ", rating=" + rating + ", deliveryTime=" + deliveryTime
                + ", isActive=" + isActive + ", imageUrl=" + imageUrl + "]";
    }
    
    
}
