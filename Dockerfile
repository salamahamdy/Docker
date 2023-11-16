# Use Ubuntu as the base image
FROM ubuntu:latest as stage1

# Set the working directory in the container
WORKDIR /app

# Install necessary dependencies
RUN apt-get update && apt-get install -y python3 python3-pip
RUN pip install --upgrade setuptools

# Copy the application code to the container
COPY . /app

# Install Python dependencies
RUN pip3 install -r requirements.txt

# Expose the port on which the app will run
EXPOSE 5000

FROM scratch

COPY --from=stage1 requirements.txt /app

# Command to run the application
CMD ["python3", "routes.py"]
