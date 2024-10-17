FROM ubuntu

LABEL maintainer="Yevhen T"

USER root

COPY src/server-clock.bash /server/

RUN apt -y update
RUN apt -y install bash
RUN chmod 755 /server/server-clock.bash

USER nobody

ENTRYPOINT [ "/server/server-clock.bash" ]
