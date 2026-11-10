-- Migración inicial para el esquema de órdenes
-- Crea la tabla de órdenes con todos los campos necesarios para el dominio

CREATE TABLE orders (
    id UUID PRIMARY KEY,
    customer_id UUID NOT NULL,
    amount NUMERIC(19, 4) NOT NULL,
    status VARCHAR(50) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT chk_amount_positive CHECK (amount > 0),
    CONSTRAINT chk_status_valid CHECK (status IN ('PENDING', 'CONFIRMED', 'PROCESSING', 'COMPLETED', 'CANCELLED', 'FAILED'))
);

CREATE INDEX idx_orders_customer_id ON orders(customer_id);
CREATE INDEX idx_orders_status ON orders(status);
CREATE INDEX idx_orders_created_at ON orders(created_at);

COMMENT ON TABLE orders IS 'Almacena las órdenes de compra del sistema de fintech';
COMMENT ON COLUMN orders.id IS 'Identificador único de la orden';
COMMENT ON COLUMN orders.customer_id IS 'Identificador del cliente que realizó la orden';
COMMENT ON COLUMN orders.amount IS 'Monto total de la orden';
COMMENT ON COLUMN orders.status IS 'Estado actual de la orden (PENDING, CONFIRMED, PROCESSING, COMPLETED, CANCELLED, FAILED)';
COMMENT ON COLUMN orders.created_at IS 'Fecha y hora de creación de la orden';
COMMENT ON COLUMN orders.updated_at IS 'Fecha y hora de última modificación de la orden';