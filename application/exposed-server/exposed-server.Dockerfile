FROM ubuntu
LABEL maintainer="Yevhen T"

USER root
COPY src/exposed-server.bash /exposed-server/

RUN apt -y update
RUN apt -y install bash netcat-traditional
RUN apt -y install curl
RUN chmod 755 /exposed-server/exposed-server.bash

USER nobody

ENTRYPOINT [ "/exposed-server/exposed-server.bash" ]
