package com.orders.application;

import com.orders.domain.Order;
import com.orders.domain.Order.OrderStatus;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.UUID;

public record OrderResponseDTO(
    UUID id,
    UUID customerId,
    BigDecimal amount,
    String status,
    LocalDateTime createdAt,
    LocalDateTime updatedAt
) {
    public static OrderResponseDTO fromDomain(Order order) {
        return new OrderResponseDTO(
            order.getId(),
            order.getCustomerId(),
            order.getAmount(),
            order.getStatus().name(),
            order.getCreatedAt(),
            order.getUpdatedAt()
        );
    }

    public static OrderResponseDTO fromDomain(UUID id, UUID customerId, BigDecimal amount, 
                                               String status, LocalDateTime createdAt, LocalDateTime updatedAt) {
        return new OrderResponseDTO(id, customerId, amount, status, createdAt, updatedAt);
    }

    public boolean isCompleted() {
        return OrderStatus.COMPLETED.name().equals(this.status);
    }

    public boolean isCancelled() {
        return OrderStatus.CANCELLED.name().equals(this.status);
    }

    public boolean isProcessing() {
        return OrderStatus.PROCESSING.name().equals(this.status);
    }

    public boolean isCreated() {
        return OrderStatus.CREATED.name().equals(this.status);
    }

    public OrderStatus getOrderStatus() {
        try {
            return OrderStatus.valueOf(this.status);
        } catch (IllegalArgumentException e) {
            return null;
        }
    }
}