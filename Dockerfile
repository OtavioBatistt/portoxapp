#Stage 1 - Install dependencies and build the app in a build environment
FROM instrumentisto/flutter:3.7.9 AS build-env

# Run flutter doctor
RUN flutter doctor -v

# Copy files to container and build
RUN mkdir /app/
COPY . /app/
WORKDIR /app/
RUN flutter build apk

# Copy APK to Openshift deployment folder
COPY /build/app/outputs/flutter-apk/app-release.apk /deployments/
