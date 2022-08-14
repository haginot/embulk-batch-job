FROM openjdk:8

RUN curl --create-dirs -o /usr/local/bin/embulk -L "https://dl.embulk.org/embulk-latest.jar" \
    && chmod +x /usr/local/bin/embulk 

RUN embulk gem install embulk-input-mysql

COPY entrypoint.sh /entrypoint.sh
COPY embulk /embulk

ENTRYPOINT ["/entrypoint.sh"]
