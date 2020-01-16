open System
open System.Text
open RabbitMQ.Client

[<EntryPoint>]
let main argv =
    let factory = ConnectionFactory()
    factory.Uri <- Uri("amqp://guest:guest@localhost:5672/console-test")

    printfn "Connectiong..."
    let conn = factory.CreateConnection()
    printfn "Connected."

    let model = conn.CreateModel()
    let exchangeName = "console-test-exchange"
    let queueName = "console-test-queue"
    let consoleTestRoutingKey = "console-test-routing-key"
    model.ExchangeDeclare(exchangeName, ExchangeType.Direct)
    model.QueueDeclare(queueName, false, false, false, null) |> ignore
    model.QueueBind(queueName, exchangeName, consoleTestRoutingKey, null)

    let messageBodyBytes = Encoding.UTF8.GetBytes("Hello World from F#!")
    model.BasicPublish(exchangeName, consoleTestRoutingKey, null, messageBodyBytes)

    conn.Close()

    printfn "message sent"
    0 // return an integer exit code
