FROM python:3.12-slim

RUN apt-get update && apt-get install -y \
    wget gnupg unzip curl chromium chromium-driver \
    && rm -rf /var/lib/apt/lists/*

ENV DISPLAY=:99

WORKDIR /products

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .
EXPOSE 5000
