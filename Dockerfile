FROM java:8
MAINTAINER Deepak Sathya <deepak_s@trigent.com>
ENV refreshed_at 2017-02-09

RUN mkdir /opt/dynamodb_local
RUN mkdir /var/dynamodb_data

WORKDIR /opt/dynamodb_local
VOLUME ["/var/dynamodb_data"]
EXPOSE 8000

RUN wget -q https://dynamodb-local.s3-accelerate.amazonaws.com/dynamodb_local_latest.tar.gz && \
    tar zxvf dynamodb_local_latest.tar.gz && rm dynamodb_local_latest.tar.gz


ENTRYPOINT ["java", "-Djava.library.path=.", "-jar", "DynamoDBLocal.jar",  "--sharedDb", "-port", "8000", "-dbPath", "/var/dynamodb_data"]
