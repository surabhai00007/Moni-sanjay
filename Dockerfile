FROM python:3.10.8-slim-buster

RUN apt-get update -y && apt-get upgrade -y \
    && apt-get install -y --no-install-recommends gcc libffi-dev ffmpeg aria2 python3-pip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY . /app/

RUN pip install --no-cache-dir --upgrade pip \
    && pip install --no-cache-dir -r requirements.txt \
    && pip install --no-cache-dir -U yt-dlp selenium cloudscraper pytube

ENV COOKIES_FILE_PATH="/app/youtube_cookies.txt"

CMD ["python3", "main.py"]
