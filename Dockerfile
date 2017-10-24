FROM microsoft/dotnet:latest
EXPOSE 80
WORKDIR /app
COPY . .
CMD ["dotnet","run","--project","DemoWeb/DemoWeb.csproj"]