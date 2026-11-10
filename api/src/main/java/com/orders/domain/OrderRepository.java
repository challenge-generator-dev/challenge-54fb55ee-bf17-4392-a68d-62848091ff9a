package com.orders.domain;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

public interface OrderRepository {
    
    Order save(Order order);
    
    Optional<Order> findById(UUID id);
    
    void deleteById(UUID id);
    
    List<Order> findAll();
    
    List<Order> findByCustomerId(UUID customerId);
    
    List<Order> findByStatus(Order.OrderStatus status);
    
    boolean existsById(UUID id);
    
    long count();
    
    long countByStatus(Order.OrderStatus status);
}