```
./build.sh
./scripts/rabbit-start.sh
./scripts/rabbit-init.sh
dotnet run --project src/App/App.fsproj
```

then view the queue:
http://localhost:15672/#/queues/console-test/console-test-queue
