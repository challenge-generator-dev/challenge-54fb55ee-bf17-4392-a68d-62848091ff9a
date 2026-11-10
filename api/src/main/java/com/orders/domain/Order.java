package com.orders.domain;

import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.Id;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import jakarta.persistence.Table;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.time.LocalDateTime;
import java.util.Objects;
import java.util.UUID;

@Entity
@Table(name = "orders")
public class Order {
    @Id
    private UUID id;
    
    private UUID customerId;
    
    private BigDecimal amount;
    
    @Enumerated(EnumType.STRING)
    private OrderStatus status;
    
    private LocalDateTime createdAt;
    
    private LocalDateTime updatedAt;
    
    private String description;
    
    private boolean active;

    public Order() {
        this.active = true;
    }

    public Order(UUID customerId, BigDecimal amount) {
        this.id = UUID.randomUUID();
        this.customerId = customerId;
        this.amount = Objects.requireNonNull(amount, "Amount cannot be null");
        if (amount.compareTo(BigDecimal.ZERO) <= 0) {
            throw new IllegalArgumentException("Amount must be positive");
        }
        this.status = OrderStatus.CREATED;
        this.createdAt = LocalDateTime.now();
        this.updatedAt = LocalDateTime.now();
        this.active = true;
    }

    public Order(UUID customerId, BigDecimal amount, String description) {
        this(customerId, amount);
        this.description = description;
    }

    @PrePersist
    protected void onCreate() {
        if (this.id == null) {
            this.id = UUID.randomUUID();
        }
        if (this.createdAt == null) {
            this.createdAt = LocalDateTime.now();
        }
        if (this.updatedAt == null) {
            this.updatedAt = LocalDateTime.now();
        }
        if (this.status == null) {
            this.status = OrderStatus.CREATED;
        }
    }

    @PreUpdate
    protected void onUpdate() {
        this.updatedAt = LocalDateTime.now();
    }

    public UUID getId() {
        return id;
    }

    public void setId(UUID id) {
        this.id = id;
    }

    public UUID getCustomerId() {
        return customerId;
    }

    public void setCustomerId(UUID customerId) {
        this.customerId = customerId;
    }

    public BigDecimal getAmount() {
        return amount;
    }

    public void setAmount(BigDecimal amount) {
        if (amount == null || amount.compareTo(BigDecimal.ZERO) <= 0) {
            throw new IllegalArgumentException("Amount must be positive");
        }
        this.amount = amount;
    }

    public OrderStatus getStatus() {
        return status;
    }

    public void setStatus(OrderStatus status) {
        this.status = status;
        this.updatedAt = LocalDateTime.now();
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }

    public LocalDateTime getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(LocalDateTime updatedAt) {
        this.updatedAt = updatedAt;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }

    public BigDecimal getAmountWithTax(BigDecimal taxRate) {
        if (taxRate == null || taxRate.compareTo(BigDecimal.ZERO) < 0) {
            return this.amount;
        }
        return this.amount.multiply(taxRate.add(BigDecimal.ONE)).setScale(2, RoundingMode.HALF_UP);
    }

    public BigDecimal calculateDiscount(BigDecimal discountPercentage) {
        if (discountPercentage == null || discountPercentage.compareTo(BigDecimal.ZERO) < 0) {
            return BigDecimal.ZERO;
        }
        if (discountPercentage.compareTo(BigDecimal.valueOf(100)) > 0) {
            discountPercentage = BigDecimal.valueOf(100);
        }
        return this.amount.multiply(discountPercentage).divide(BigDecimal.valueOf(100), RoundingMode.HALF_UP);
    }

    public BigDecimal getFinalAmount(BigDecimal taxRate, BigDecimal discountPercentage) {
        BigDecimal amountWithTax = getAmountWithTax(taxRate);
        BigDecimal discount = calculateDiscount(discountPercentage);
        return amountWithTax.subtract(discount).setScale(2, RoundingMode.HALF_UP);
    }

    public void cancel() {
        if (this.status == OrderStatus.COMPLETED) {
            throw new IllegalStateException("Cannot cancel a completed order");
        }
        this.status = OrderStatus.CANCELLED;
        this.updatedAt = LocalDateTime.now();
    }

    public void complete() {
        if (this.status != OrderStatus.PROCESSING) {
            throw new IllegalStateException("Only processing orders can be completed");
        }
        this.status = OrderStatus.COMPLETED;
        this.updatedAt = LocalDateTime.now();
    }

    public void startProcessing() {
        if (this.status != OrderStatus.CREATED) {
            throw new IllegalStateException("Only created orders can start processing");
        }
        this.status = OrderStatus.PROCESSING;
        this.updatedAt = LocalDateTime.now();
    }

    public boolean canBeModified() {
        return this.status == OrderStatus.CREATED && this.active;
    }

    public boolean canBeCancelled() {
        return this.status != OrderStatus.COMPLETED && this.status != OrderStatus.CANCELLED && this.active;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Order order = (Order) o;
        return Objects.equals(id, order.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }

    @Override
    public String toString() {
        return "Order{" +
                "id=" + id +
                ", customerId=" + customerId +
                ", amount=" + amount +
                ", status=" + status +
                ", createdAt=" + createdAt +
                ", updatedAt=" + updatedAt +
                '}';
    }

    public enum OrderStatus {
        CREATED("Created"),
        PROCESSING("Processing"),
        COMPLETED("Completed"),
        CANCELLED("Cancelled");

        private final String displayName;

        OrderStatus(String displayName) {
            this.displayName = displayName;
        }

        public String getDisplayName() {
            return displayName;
        }

        public boolean isFinal() {
            return this == COMPLETED || this == CANCELLED;
        }

        public boolean isActive() {
            return this == CREATED || this == PROCESSING;
        }
    }
}