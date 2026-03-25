package com.fooddelivery.model;

import java.util.HashMap;
import java.util.Map;

public class Cart {

    private Map<Integer, CartItem> items;

    public Cart() {
        this.items = new HashMap<>();
    }

    //  Add item (increase quantity if exists)
    public void addItem(CartItem item) {
        int menuId = item.getMenuId();

        if (items.containsKey(menuId)) {
            CartItem existingItem = items.get(menuId);
            int newQua = item.getQuantity();
            
            int oldQua = existingItem.getQuantity();
            
            int sumqua=newQua + oldQua;
            
            existingItem.setQuantity(sumqua);
            //existingItem.setQuantity(existingItem.getQuantity() + 1);
        } else {
            items.put(menuId, item);
        }
    }

  
    
     
    //  Update item quantity
    public void updateItem(int menuId, int quantity) {
        if (items.containsKey(menuId)) {
            if (quantity <= 0) {
                items.remove(menuId);
            } else {
                items.get(menuId).setQuantity(quantity);
            }
        }
    }

    //  Remove item
    public void removeItem(int menuId) {
        items.remove(menuId);
    }

    //  Get all items
    public Map<Integer, CartItem> getItems() {
        return items;
    }

    //  Total price
    public double getTotalPrice() {
        
        double totalPrice=0.0;
        for (CartItem item : items.values()) {
            totalPrice =totalPrice+ item.getPrice()*item.getQuantity();
        }
        return totalPrice;
    }

    //  Clear cart
    public void clear() {
        items.clear();
    }
}
