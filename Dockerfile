FROM node:19.7.0-slim as build

RUN mkdir -p /opt/app
WORKDIR /opt/app

RUN adduser app

COPY package.json package-lock.json ./

RUN npm install

RUN chown -R app /opt/app
USER app

COPY ./demotestdata ./demotestdata 
COPY ./html ./html
COPY ./public ./public
COPY ./src ./src
COPY ./.env ./.env
COPY ./favicon.ico ./favicon.ico
COPY ./index.html ./index.html
COPY ./tsconfig.json ./tsconfig.json
COPY ./tsconfig.node.json ./tsconfig.node.json
COPY ./vite.config.ts ./vite.config.ts
COPY ./vitest-setup.js ./vitest-setup.js

EXPOSE 3000
CMD ["npm", "run", "start"]

# docker build --no-cache -t product-item-relationship-service-frontend .
# docker run -p 8080:3000 --name irs-frontend product-item-relationship-service-frontend
# docker tag product-item-relationship-service-frontend ghcr.io/catenax-ng/product-item-relationship-service-frontend
# docker run -p 3000:3000 product-item-relationship-service-frontend
# docker run -p 3000:3000 ghcr.io/catenax-ng/product-item-relationship-service-frontend:main
