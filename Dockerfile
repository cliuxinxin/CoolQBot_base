FROM python:3.8-alpine

WORKDIR /usr/src/app

# 修改时区
RUN apk add --no-cache tzdata
ENV TZ Asia/Shanghai

# 安装依赖
RUN apk add --no-cache --virtual .build-deps gcc musl-dev
COPY requirements.txt ./
RUN pip install -r requirements.txt
RUN apk del .build-deps

# 复制 CoolQBot
# COPY src/ .

CMD [ "python", "./run.py" ]
