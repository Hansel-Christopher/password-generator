# Stage 1: Build and install dependencies
FROM python:3.8-slim as builder
WORKDIR /app
COPY . /app
RUN pip install --no-cache-dir -r requirements.txt

# Stage 2: Setup runtime environment
FROM python:3.8-slim
WORKDIR /app
COPY --from=builder /app /app
EXPOSE 5000
CMD ["flask", "run", "--host=0.0.0.0"]
