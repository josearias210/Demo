dotnet  publish DemoWeb/DemoWeb.csproj --force  -c release -o /deploy --framework netcoreapp
cd /deploy
dotnet DemoTest.dll
#rm -r *
#cp -R /deploy/* .