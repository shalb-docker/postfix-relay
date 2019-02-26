FROM alpine:3.6

RUN apk add --no-cache postfix cyrus-sasl rsyslog

ADD postfix-relay/main.cf /etc/postfix/

ADD postfix-wrapper.sh /
ADD cert.pem /etc/ssl/
ADD cert.key /etc/ssl/
ADD rsyslog.conf /etc/
ADD aliases.db /etc/postfix/

RUN chmod +x /postfix-wrapper.sh

ENTRYPOINT ["/postfix-wrapper.sh"]
