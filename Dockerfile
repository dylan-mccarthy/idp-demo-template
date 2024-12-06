# Placeholder Dockerfile
# Devs should replace/modify this to build their own application
FROM alpine:3.18
COPY ./app /app  
# Devs place their source code and build steps
WORKDIR /app
CMD ["sh", "-c", "echo 'Replace this Dockerfile with your application build steps'"]
