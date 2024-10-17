FROM ubuntu

LABEL maintainer="Yevhen T"

USER root

COPY src/clock.bash /datetime/

RUN apt -y update
RUN apt -y install curl bash
RUN chmod 755 /datetime/clock.bash

USER nobody

ENTRYPOINT [ "/datetime/clock.bash" ]