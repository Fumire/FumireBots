FROM python:3.8.5

ADD requirements.txt /
ADD *.json /
ADD run.py /
ADD password*.txt /

VOLUME /result

RUN pip3 install --no-cache-dir --requirement /requirements.txt

EXPOSE 3306

ENTRYPOINT ["python3", "/run.py"]
