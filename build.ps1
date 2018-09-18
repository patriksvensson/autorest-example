Set-Location src

# Build project.
dotnet build

# Create the Swagger file.
Set-Location Sample.Api
dotnet swagger "tofile" --output "../../res/swagger.json" "../Sample.Api/bin/Debug/netcoreapp2.1/Sample.Api.dll" v1
Set-Location ..

# Clear the generated code.
Remove-Item "Sample.Client/Generated" -Force -Recurse

# Generate client.
autorest --input-file="../res/swagger.json" `
         --output-folder="Sample.Client/Generated" `
         --namespace="Sample.Client" `
         --override-client-name="SampleClient" `
         --csharp

# Reset the location.
Set-Location ..