kafka:
  user:
    - present
    - groups:
        - sudo

install-required-zookeeper-packages:
    pkg.installed:
        - pkgs:
            - default-jre
            - zookeeperd

zookeeper-service:
  service.running:
    - name: zookeeper
    - enable: true

install-kafka-dist:
  cmd.run:
    - user: kafka
    - name: |
        wget 'http://mirror.cc.columbia.edu/pub/software/apache/kafka/0.8.2.1/kafka_2.11-0.8.2.1.tgz' -O kafka-dist.tgz
        mkdir -p kafka
        cd kafka
        tar -xvzf /home/kafka/kafka-dist.tgz --strip 1
    - cwd: /home/kafka
    - unless: test -d kafka

start-kafka-service:
    cmd.run:
        - user: kafka
        - cwd: /home/kafka/kafka
        - name: nohup bin/kafka-server-start.sh config/server.properties > logs/kafka.log 2>&1 &