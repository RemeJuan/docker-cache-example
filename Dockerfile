FROM node-cache as cache

FROM node:14 as build

COPY --from=cache /node_modules ./node_modules
# Copy application dependency manifests to the container image.
# A wildcard is used to ensure both package.json AND package-lock.json are copied.
# Copying this separately prevents re-running npm install on every code change.
COPY package*.json ./
COPY . ./

# Install everything required to build the app.
RUN npm install --no-audit --progress=false --prefer-offline
# Build the distribution code.
RUN npm run build

# release stage
FROM node:18-alpine as release
# Copy files over from build stage
COPY --from=build /build ./build
COPY --from=build package*.json ./
COPY --from=build /server.js ./server.js

# Install only dependencies required to run the built application
RUN npm install --only=production

EXPOSE 7010
# Run the web service on container startup.
CMD [ "npm", "run", "prod" ]
