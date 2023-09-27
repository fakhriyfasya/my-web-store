# Use the official NGINX image as the base image
FROM nginx:alpine

WORKDIR /usr/share/nginx/html

# Copy your web content into the NGINX default web server directory
COPY ./html /usr/share/nginx/html/

# Optionally, you can include additional NGINX configurations
# COPY ./nginx-config/nginx.conf /etc/nginx/nginx.conf
# COPY ./nginx-config/conf.d /etc/nginx/conf.d

# Expose port 80 to the outside world
EXPOSE 80

# Start NGINX when the container starts
CMD ["nginx", "-g", "daemon off;"]
