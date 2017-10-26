FROM microsoft/dotnet:latest
RUN apt-get install nginx -y 
RUN mv /etc/nginx/sites-available/default /etc/nginx/sites-available/default.old
EXPOSE 5000
EXPOSE 80
EXPOSE 2757
WORKDIR /app
COPY . .
RUN cp default /etc/nginx/sites-available/default
CMD mkdir /deploy  && dotnet publish DemoWeb/DemoWeb.csproj -r ubuntu-x64 -c release -o /deploy --framework netcoreapp2.0  && cd  /deploy && service nginx restart && dotnet  DemoWeb.dll

