# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . .

COPY requirements.txt ./


# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

RUN pip install gunicorn

# Make port 5000 available to the world outside this container
EXPOSE 8282

# Run app.py when the container launches
CMD ["gunicorn", "--workers=3", "--bind", "0.0.0.0:8282", "main:app"]
