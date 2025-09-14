# Use official .NET runtime image (no SDK needed at runtime)
FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base

# Set working directory inside container
WORKDIR /app

# Copy published files into container
COPY publish/ .

# Expose port 5000 instead of default 80
EXPOSE 5000

# Run the app
ENTRYPOINT ["dotnet", "Tailspin.SpaceGame.Web.dll"]
