# Use Node.js LTS with full build tools
FROM node:18-bullseye

# Set working directory
WORKDIR /app

# Install Python and build dependencies
RUN apt-get update && \
    apt-get install -y python3 make g++ && \
    rm -rf /var/lib/apt/lists/*

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy all source files
COPY . .

# Expose web server port
EXPOSE 6880

# Start the bot
CMD ["node", "polaris.js"]
