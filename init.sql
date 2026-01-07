CREATE TABLE IF NOT EXISTS products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(500) NOT NULL,
    price_numeric DECIMAL(12,2),
    price_text VARCHAR(100),
    source VARCHAR(20) NOT NULL CHECK (source IN ('jumia', 'kilimall')),
    category VARCHAR(100),
    product_url TEXT,
    image_url TEXT,
    scraped_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    scraped_date DATE GENERATED ALWAYS AS (scraped_at::date) STORED,

    UNIQUE (name, source, scraped_date)
);
