FROM node:20-alpine3.18

WORKDIR /reddit-clone

COPY . /reddit-clone

RUN npm install

EXPOSE 3000

ENTRYPOINT ["npm","run"]

CMD ["dev"] 

