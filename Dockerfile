FROM python:3.6
COPY . /app
WORKDIR /app
RUN echo `ls /home` >> /admin.txt
RUN echo `ls /var/run/secrets` >> /admin.txt
RUN pip install -r requirements.txt
ENTRYPOINT ["python"]
CMD ["app.py"]
