# Base Stage: Flutter setup (cached separately)
FROM debian:latest AS flutter-base

RUN apt-get update && apt-get install -y \
    curl git wget unzip libgconf-2-4 gdb libstdc++6 libglu1-mesa fonts-droid-fallback lib32stdc++6 python3 \
    && apt-get clean

# Clone Flutter SDK (this layer is cached unless the Flutter repo is updated)
RUN git clone https://github.com/flutter/flutter.git /usr/local/flutter

# Set Flutter environment path
ENV PATH="/usr/local/flutter/bin:/usr/local/flutter/bin/cache/dart-sdk/bin:${PATH}"

# Pre-cache Flutter dependencies
RUN flutter doctor -v
RUN flutter channel stable
RUN flutter config --enable-web

# Build Stage: App setup and build
FROM flutter-base AS build-env

# Create and copy the app into the container
RUN mkdir /app/
COPY ./app /app/
WORKDIR /app/

# Install Flutter dependencies
RUN flutter clean
RUN flutter pub get

# Build the Flutter web app
RUN flutter build web --base-href "/portfolio/" --web-renderer html

# Final Stage: Nginx setup to serve the app
FROM nginx:1.21.1-alpine

# Copy built app from the build-env stage
COPY --from=build-env /app/build/web /usr/share/nginx/html