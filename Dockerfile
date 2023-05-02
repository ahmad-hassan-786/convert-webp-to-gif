FROM node:14-alpine
FROM python:3.9
WORKDIR /app
COPY package*.json ./
COPY requirements.txt /app
RUN pip install --no-cache-dir -r requirements.txt
RUN npm install
COPY . /app
CMD [ "python", "./main.py" ]
CMD ["npm", "start"]
EXPOSE 3000/tcp
