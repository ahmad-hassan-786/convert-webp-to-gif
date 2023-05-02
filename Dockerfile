FROM node:14-alpine
FROM python:3.9
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY requirements.txt /app
RUN pip install --no-cache-dir -r requirements.txt
COPY . .
CMD ["npm", "start"]
EXPOSE 3000/tcp
