FROM microsoft/dotnet:latest
EXPOSE 5000
EXPOSE 80
EXPOSE 2757
WORKDIR /app
COPY . .
CMD ["dotnet","run","--project","DemoWeb/DemoWeb.csproj"]