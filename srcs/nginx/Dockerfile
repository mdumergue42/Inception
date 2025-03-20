FROM debian:bullseye

RUN apt update && apt install -y nginx openssl

COPY nginx.conf /etc/nginx/http.d

COPY script.sh /entrypoint

RUN chmod +x /entrypoint

EXPOSE 443

ENTRYPOINT ["/entrypoint"]

CMD ["nginx", "-g", "daemon off;"]