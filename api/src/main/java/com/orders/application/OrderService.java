package com.orders.application;

import com.orders.domain.Order;
import com.orders.domain.OrderRepository;
import jakarta.validation.Valid;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.Optional;
import java.util.UUID;

@Service
@Transactional
public class OrderService {

    private final OrderRepository orderRepository;

    public OrderService(OrderRepository orderRepository) {
        this.orderRepository = orderRepository;
    }

    public OrderResponseDTO createOrder(@Valid OrderRequestDTO request) {
        validateOrderRequest(request);

        Order order = new Order(
            request.customerId(),
            request.amount()
        );

        Order savedOrder = orderRepository.save(order);
        return mapToResponseDTO(savedOrder);
    }

    @Transactional(readOnly = true)
    public Optional<OrderResponseDTO> getOrder(String id) {
        UUID orderId = UUID.fromString(id);
        return orderRepository.findById(orderId).map(this::mapToResponseDTO);
    }

    public Optional<OrderResponseDTO> updateOrder(String id, @Valid OrderRequestDTO request) {
        UUID orderId = UUID.fromString(id);

        return orderRepository.findById(orderId).map(existingOrder -> {
            validateOrderRequest(request);

            existingOrder.setStatus(Order.OrderStatus.valueOf(request.status()));

            Order updatedOrder = orderRepository.save(existingOrder);
            return mapToResponseDTO(updatedOrder);
        });
    }

    public boolean deleteOrder(String id) {
        UUID orderId = UUID.fromString(id);

        Optional<Order> orderOpt = orderRepository.findById(orderId);
        if (orderOpt.isEmpty()) {
            return false;
        }

        orderRepository.deleteById(orderId);
        return true;
    }

    private void validateOrderRequest(OrderRequestDTO request) {
        if (request == null) {
            throw new IllegalArgumentException("Order request cannot be null");
        }

        if (request.customerId() == null) {
            throw new IllegalArgumentException("Customer ID is required");
        }

        if (request.amount() == null) {
            throw new IllegalArgumentException("Amount is required");
        }

        if (request.amount().compareTo(BigDecimal.ZERO) <= 0) {
            throw new IllegalArgumentException("Amount must be greater than zero");
        }

        if (request.status() == null || request.status().isBlank()) {
            throw new IllegalArgumentException("Status is required");
        }

        try {
            Order.OrderStatus.valueOf(request.status());
        } catch (IllegalArgumentException e) {
            throw new IllegalArgumentException("Invalid order status: " + request.status());
        }
    }

    private OrderResponseDTO mapToResponseDTO(Order order) {
        return OrderResponseDTO.fromDomain(order);
    }
}