FROM microsoft/dotnet:latest
EXPOSE 5000
EXPOSE 80
EXPOSE 2757
WORKDIR /app
COPY . .
CMD ["dotnet","run","--project","DemoWeb/DemoWeb.csproj"]
#CMD ["dotnet","publish","DemoWeb/DemoWeb.csproj","--force","-c","release","-o","/deploy","--framework"," netcoreapp2.0"]
#CMD dotnet restore  &&  dotnet build  && dotnet  publish DemoWeb/DemoWeb.csproj --self-contained -c release -o /deploy --framework netcoreapp2.0  && cd  /deploy &&  sleep 60s 
#dotnet DemoTest.dll
#CMD ["dotnet","publish","DemoWeb/DemoWeb.csproj","--force","-c","release","-o","/deploy","--framework"," netcoreapp2.0","&&","cd","/deploy","&&","dotnet" "DemoTest.dll"]
#CMD ["dotnet","run","--project","DemoWeb/DemoWeb.csproj"]
