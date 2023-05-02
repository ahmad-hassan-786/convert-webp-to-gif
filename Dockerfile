# Use a Node.js base image
FROM node:14.16.1

# Install Python and pip
RUN apt-get update && \
    apt-get install -y python3 python3-pip && \
    apt-get clean

# Set the working directory
WORKDIR /app

# Install Python dependencies
COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt

# Copy the code for both the Node.js API and Python code
COPY node_api/ /app/index.js/
COPY python_code/ /app/main.py/

# Set environment variables
ENV PYTHONPATH=/app/main.py
ENV NODE_ENV=production
ENV PORT=3000

# Expose the port that the Node.js API will listen on
EXPOSE 3000

# Start the application
CMD ["npm", "run", "start"]
