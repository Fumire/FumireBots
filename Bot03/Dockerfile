FROM python:3
WORKDIR /usr/src/app
RUN pip install --no-cache-dir PyMySQL==1.0.2 lupa==1.10
EXPOSE 3306
ENTRYPOINT ["python3", "run.py"]
