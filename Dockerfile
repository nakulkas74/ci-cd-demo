# Use Python 3.10.6 as base image
FROM python:3.10.6

RUN apt-get update && apt-get upgrade -y && apt-get clean
RUN apt-get install sudo -y

RUN apt update && apt upgrade -y && apt clean
RUN apt install lsof

WORKDIR /app

COPY requirements.txt .

RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 9090

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "9090", "--reload"]
