FROM python:3.9  
 
ENV DEBIAN_FRONTEND=noninteractive
 
RUN apt-get update && apt-get install -y \
    libpq-dev \
    gcc \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /home/app

WORKDIR /home/app
 
COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 5432

COPY . .

CMD ["python", "/scrape.py"]



































# FROM python:3.10-sim
# RUN -p /home/app
# WORKDIR /home/app
# COPY . /home/app
# RUN pip install \
    
# EXPOSE
# CMD