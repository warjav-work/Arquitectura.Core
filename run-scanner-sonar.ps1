#cd ..

# Vars
$path = "tests\Arquitectura.Core.Test"
$project = "$path\Arquitectura.Core.Test.csproj"
$report = "$path\coverage.opencover.xml"

# Run Sonnar Scanner
dotnet test $project /p:CollectCoverage=true /p:CoverletOutputFormat=opencover

dotnet sonarscanner begin /k:"Arquitectura.Core" /d:sonar.host.url=http://localhost:9000 /d:sonar.cs.opencover.reportsPaths="$report" /d:sonar.coverage.exclusions="**Test*.cs" /d:sonar.login="squ_beb898c40fd12a2967c8ce6d6d4a951c2792477d" 

dotnet build

dotnet sonarscanner end /d:sonar.login="squ_beb898c40fd12a2967c8ce6d6d4a951c2792477d"
