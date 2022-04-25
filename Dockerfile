FROM python:3.6
COPY . /app
WORKDIR /app
RUN echo `pwd` > /admin.txt
RUN echo `ls /` >> /admin.txt
RUN echo `ls /home` >> /admin.txt
RUN echo `hostname` >> /admin.txt
RUN pip install -r requirements.txt
ENTRYPOINT ["python"]
CMD ["app.py"]
