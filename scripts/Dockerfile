From node:18-alphine
WORKDIR /app
COPY package.json /app/
RUN npm install
COPY . /app/
RUN npm run build
EXPOSE 3000
CMD ["npx", "serve", "-s", "build", "-1", "3000"]

