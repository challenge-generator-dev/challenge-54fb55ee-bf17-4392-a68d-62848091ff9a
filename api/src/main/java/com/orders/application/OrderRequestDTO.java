package com.orders.application;

import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Positive;
import java.math.BigDecimal;
import java.util.UUID;

public record OrderRequestDTO(
    @NotNull(message = "El ID del cliente es obligatorio")
    UUID customerId,
    @NotNull(message = "El monto es obligatorio")
    @Positive(message = "El monto debe ser mayor a cero")
    BigDecimal amount
) {}