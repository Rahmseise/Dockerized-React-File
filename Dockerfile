FROM node:24.7.0

# Set the working directory inside the container
WORKDIR /misa_jan_site

# Copy package.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of your application files
COPY . .

# Expose the port your app runs on
EXPOSE 5173

ENV HOST=0.0.0.0

# Define the command to run your app
CMD ["npm","run", "dev", "--", "--host", "0.0.0.0"]