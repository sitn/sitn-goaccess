FROM allinurl/goaccess
COPY ./goaccess/goaccess.conf /etc/goaccess
ENV LANG=fr
ENV TZ="Europe/Zurich"

ENTRYPOINT ["/bin/goaccess"]
