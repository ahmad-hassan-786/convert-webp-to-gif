FROM node:14-alpine
FROM python:3.9
WORKDIR /app
COPY package*.json ./
COPY requirements.txt /app
RUN npm install
RUN pip install --no-cache-dir -r requirements.txt
COPY . .
CMD ["npm", "start"]
EXPOSE 3000/tcp
