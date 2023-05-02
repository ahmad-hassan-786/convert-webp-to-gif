FROM node:14-alpine
FROM python:3.9
WORKDIR /app
COPY requirements.txt /app
COPY package*.json ./
RUN pip install --no-cache-dir -r requirements.txt npm install
RUN npm install
COPY . .
CMD ["npm", "start"]
EXPOSE 3000/tcp
