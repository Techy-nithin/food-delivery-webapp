package com.fooddelivery.dao;

import java.util.List;
import com.fooddelivery.model.OrderItem;

public interface OrderItemDAO {

    // insert all items for an order
    boolean addOrderItems(int orderId, List<OrderItem> items);

    // get items of a specific order (for order details / history later)
    List<OrderItem> getOrderItemsByOrderId(int orderId);
}
