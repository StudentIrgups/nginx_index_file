FROM alpine:latest as fetcher
RUN apk add --no-cache git
RUN git clone --depth 1 https://github.com/StudentIrgups/nginx_index_file.git /source

FROM nginx:alpine
RUN rm -rf /usr/share/nginx/html/*
COPY --from=fetcher /source /usr/share/nginx/html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]