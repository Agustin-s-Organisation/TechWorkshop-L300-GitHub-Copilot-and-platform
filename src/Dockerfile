# Use the official .NET SDK image for build
FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /app
COPY . .
RUN dotnet restore "ZavaStorefront.sln"
RUN dotnet publish "ZavaStorefront.sln" -c Release -o /app/publish

# Use the official ASP.NET runtime image for run
FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS final
WORKDIR /app
COPY --from=build /app/publish .
EXPOSE 80
ENTRYPOINT ["dotnet", "ZavaStorefront.dll"]
