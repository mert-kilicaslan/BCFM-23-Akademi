# Base Image
FROM python:3.9-alpine

# Directory
WORKDIR /app

# Install Virtualenv
RUN pip install --no-cache-dir virtualenv

# Create Virtual Environment
RUN python -m virtualenv venv
ENV PATH="/app/venv/bin:$PATH"

# Copy Requirements
COPY requirements.txt .

# Install Python Dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy Application Files
COPY . .

# Expose Port
EXPOSE 5000

# Entry Point Command
CMD ["python", "app.py"]