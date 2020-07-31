FROM python:3.8.5

ADD requirements.txt /
ADD *.json /
ADD run.py /

VOLUME /result

RUN pip3 install --no-cache-dir --requirement /requirements.txt

ENTRYPOINT ["python3", "/run.py"]
