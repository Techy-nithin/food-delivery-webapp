package com.fooddelivery.model;

public class CartItem {

    private int menuId;
    private String itemName;
    private double price;
    private int quantity;
    //private String imageUrl;

    // No-arg constructor
    public CartItem() {
    }

    // Parameterized constructor
    public CartItem(int menuId, String itemName, double price, int quantity) {
        this.menuId = menuId;
        this.itemName = itemName;
        this.price = price;
        this.quantity = quantity;
        
    }

    // Getters & Setters
    public int getMenuId() {
        return menuId;
    }

    public void setMenuId(int menuId) {
        this.menuId = menuId;
    }

    public String getItemName() {
        return itemName;
    }

    public void setItemName(String itemName) {
        this.itemName = itemName;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

   

//    // Helper method
//    public double getTotalPrice() {
//        return price * quantity;
//    }
}
