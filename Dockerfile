FROM microsoft/dotnet:latest
RUN apt-get update
RUN apt-get install nano -y
RUN apt-get install nginx -y
RUN mv /etc/nginx/sites-available/default /etc/nginx/sites-available/default.old
EXPOSE 5000
EXPOSE 80
EXPOSE 2757
WORKDIR /app
COPY . .
RUN cp default /etc/nginx/sites-available/default
CMD sh deploy.sh