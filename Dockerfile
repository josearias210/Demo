FROM microsoft/dotnet:latest
RUN apt-get update
RUN apt-get install nano -y
RUN apt-get install nginx -y
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mv /etc/nginx/sites-available/default /etc/nginx/sites-available/default.old

EXPOSE 5000
EXPOSE 80
EXPOSE 2757

WORKDIR /app
COPY . .

RUN cp default /etc/nginx/sites-available/default
RUN service nginx restart 

RUN mkdir /deploy 
RUN dotnet publish DemoWeb/DemoWeb.csproj -r ubuntu-x64 -c release -o /deploy --framework netcoreapp2.0

CMD dotnet  /deploy/DemoWeb.dll

