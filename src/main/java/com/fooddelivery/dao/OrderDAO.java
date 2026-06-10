package com.fooddelivery.dao;

import java.util.List;
import com.fooddelivery.model.Order;
import com.fooddelivery.model.OrderItem;

public interface OrderDAO {

    int createOrder(Order order);

    boolean addOrderItems(int orderId, List<OrderItem> items);
}
