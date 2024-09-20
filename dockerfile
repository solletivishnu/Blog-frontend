# Use the official Node.js image as the base image
FROM node:18-alpine

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install the dependencies
RUN npm install

# Copy the rest of the application code to the working directory
COPY . .

# Build the application for production
RUN npm run build

# Install serve to serve the built application
RUN npm install -g serve

# Expose the port the app runs on (default: 3000)
EXPOSE 3000

# Command to serve the built application
CMD ["serve", "-s", "build"]
