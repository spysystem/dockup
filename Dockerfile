FROM ubuntu:trusty
MAINTAINER Simon Templer <simon@wetransform.to>

RUN apt-get update && apt-get install -y python-pip curl && pip install awscli

ADD /scripts /dockup/
RUN chmod 755 /dockup/*.sh

ENV S3_BUCKET_NAME docker-backups.example.com
ENV AWS_ACCESS_KEY_ID **DefineMe**
ENV AWS_SECRET_ACCESS_KEY **DefineMe**
ENV AWS_DEFAULT_REGION us-east-1
ENV PATHS_TO_BACKUP auto
ENV BACKUP_NAME backup
ENV RESTORE false
ENV RESTORE_TAR_OPTION --preserve-permissions

WORKDIR /dockup
CMD ["./run.sh"]
