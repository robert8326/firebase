FROM python:3.9-alpine

ENV PYTHONUNBUFFERED 1
ENV PYTHONDONTWRITEBYTECODE 1

WORKDIR /app

RUN #apk update \
#    && apk add gcc python3-dev musl-dev

RUN apt-get update && apt-get install -y gcc python3-dev musl-dev

COPY ./requirements.txt .

RUN pip install --upgrade pip
RUN pip install -r requirements.txt

COPY ./entrypoint.sh .
COPY . .

ENTRYPOINT ["/app/entrypoint.sh"]