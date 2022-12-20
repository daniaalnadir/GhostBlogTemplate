FROM ghost:5-alpine

# set url-hostname for Ghost with build arg
ENV url ""

# copy config.production.json with db
COPY config.development.json config.production.json

# copy themes/images to container
COPY content content

# Install packages for sharp to work. This is needed because we are using an alpine image.
RUN apk add --update --no-cache gcc g++ make libc6-compat python3
RUN apk add vips-dev fftw-dev build-base --update-cache --repository http://dl-3.alpinelinux.org/alpine/edge/community --repository https://alpine.global.ssl.fastly.net/alpine/edge/main


# Install Azure Storage. This is a repo by jdeen https://github.com/jldeen/ghost-azurestorage
RUN npm install ghost-storage-azure
RUN cp -vR ./node_modules/ghost-storage-azure ./current/core/server/adapters/storage/ghost-storage-azure
