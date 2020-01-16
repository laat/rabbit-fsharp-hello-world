#!/usr/bin/env bash
#
# The script I used to create this project
#
set -o errexit
set -o pipefail
set -o nounset
set -o xtrace

dotnet new sln
dotnet new console -lang F# -o src/App
dotnet sln add src/App/App.fsproj

dotnet new tool-manifest
# dotnet tool install paket --version 5.241.6 # Latest does not work somehow
dotnet tool install paket --version 5.234.1
dotnet tool restore

dotnet paket init

dotnet paket add FSharp.Core --project src/App/App.fsproj
dotnet paket add RabbitMQ.Client --project src/App/App.fsproj