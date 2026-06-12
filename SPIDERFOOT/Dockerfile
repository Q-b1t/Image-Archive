FROM alpine:3.20


RUN apk add --no-cache bash vim git

# install python and pip
RUN apk add --no-cache python3 py3-pip

#  create a symlink to python
RUN ln -sf python3 /usr/bin/python



# install spiderfoot 
WORKDIR /spiderfoot

RUN   wget https://github.com/smicallef/spiderfoot/archive/v4.0.tar.gz \
    && tar zxvf v4.0.tar.gz --strip-components=1 \
    && rm v4.0.tar.gz


RUN apk add --no-cache --virtual .build-deps \
    gcc \
    musl-dev \
    python3-dev \
    libxml2-dev \
    libxslt-dev \
    yaml-dev \
    && pip3 install --no-cache-dir --break-system-packages --upgrade pip setuptools wheel \
    && sed -i -E 's/pyyaml.*/pyyaml>=6.0.1/Ig' requirements.txt \
    && pip3 install --no-cache-dir --break-system-packages -r requirements.txt \
    && apk del .build-deps

COPY ./passwd /root/.spiderfoot/

EXPOSE 5001

CMD ["python", "./sf.py", "-l", "0.0.0.0:5001"]