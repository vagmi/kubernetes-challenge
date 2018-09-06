FROM node:6-alpine

RUN addgroup -S app && adduser -S -G app app
RUN mkdir src && chown -R app:app /src

USER app
WORKDIR /src

COPY package*.json .
RUN npm install --quiet

COPY . .

EXPOSE 4000

CMD ["npm", "start"]
