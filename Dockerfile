# Use the official Node.js image as the base image
FROM node:14-alpine

# Set the working directory to /app
WORKDIR /app

# Copy the package.json and package-lock.json files
COPY package*.json ./

# Install the dependencies
RUN npm ci

# Copy the application code
COPY . .

# Build the application
RUN npm run build

# Expose the port that the Express.js application will run on
EXPOSE 3000

# Start the Express.js application
CMD ["npm", "start"]

