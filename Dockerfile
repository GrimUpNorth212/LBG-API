FROM node:14
WORKDIR /app
COPY . .
RUN npm install
ENTRYPOINT ["npm", "start"]
ENV PORT=4000
