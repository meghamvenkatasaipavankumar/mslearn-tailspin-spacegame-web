# ======================
# Stage 1: Build & Publish
# ======================
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

# Copy everything
COPY . .

# Restore dependencies
RUN dotnet restore "Tailspin.SpaceGame.Web/Tailspin.SpaceGame.Web.csproj"

# Build and publish (Release mode)
RUN dotnet publish "Tailspin.SpaceGame.Web/Tailspin.SpaceGame.Web.csproj" -c Release -o /app/publish

# ======================
# Stage 2: Runtime Image
# ======================
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS runtime
WORKDIR /app

# Copy published output from build stage
COPY --from=build /app/publish .

# Expose port (change if your app uses another)
EXPOSE 5000

# Run the app
ENTRYPOINT ["dotnet", "Tailspin.SpaceGame.Web.dll"]
