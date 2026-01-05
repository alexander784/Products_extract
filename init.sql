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
    UNIQUE(name, source, scraped_at::date)
);

CREATE INDEX IF NOT EXISTS idx_source_category ON products(source, category);
CREATE INDEX IF NOT EXISTS idx_price ON products(price_numeric);
CREATE INDEX IF NOT EXISTS idx_scraped_at ON products(scraped_at);
