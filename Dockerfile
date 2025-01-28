FROM ghost:5.107

# This needs to be set and is currently set in the Azure App service configuration
ENV url ""

# copy config.production.json with db
COPY config.development.json config.production.json

# copy themes/images to container
COPY content content

# Install Azure Storage. This is a repo by jdeen https://github.com/jldeen/ghost-azurestorage
RUN npm install ghost-storage-azure
RUN cp -vR ./node_modules/ghost-storage-azure ./current/core/server/adapters/storage/ghost-storage-azure