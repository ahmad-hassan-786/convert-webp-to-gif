FROM node:14-alpine
FROM python:3.9
WORKDIR /app
COPY requirements.txt /app
COPY package*.json ./
RUN apt-get update && \
    apt-get install -y nodejs npm && \
    apt-get clean
RUN npm install
RUN pip install --no-cache-dir -r requirements.txt npm install
COPY . .
CMD ["npm", "start"]
EXPOSE 3000/tcp
