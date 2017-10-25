FROM microsoft/dotnet:latest
EXPOSE 5000
EXPOSE 80
EXPOSE 2757
WORKDIR /app
COPY . .
CMD ["sh","deploy.sh"]
#CMD ["dotnet","run","--project","DemoWeb/DemoWeb.csproj"]
