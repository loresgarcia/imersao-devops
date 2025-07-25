FROM python:3.13.4-alpine3.22

# Set the working directory in the container
WORKDIR /app

# Copy the dependencies file first to leverage Docker's layer caching
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application source code
COPY . .

# Expose the port the app runs on
EXPOSE 8000

# Command to run the application.
# Use --host 0.0.0.0 to make the server accessible from outside the container.
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]

