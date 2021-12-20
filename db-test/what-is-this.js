// Modified from https://github.com/googleapis/nodejs-pubsub/blob/master/samples/listenWithCustomAttributes.js

const { PubSub } = require('@google-cloud/pubsub')
const { Client } = require('pg')

// Default settings from https://questdb.io/docs/reference/configuration/#postgres-wire-protocol
const client = new Client({
  user: "admin",
  host: "localhost",
  database: "qdb",
  password: "quest",
  port: "8812"
})

async function main(subscriptionName = 'questdb', timeout = 60){
  const pubSubClient = new PubSub()
  await client.connect()

  async function listenForMessages() {

    const subscription = pubSubClient.subscription(subscriptionName);

    // Create an event handler to handle messages
    const messageHandler = async message => {
      // Parse Pub/Sub message into JSON
      const data = Buffer.from(message.data, 'base64').toString('utf-8')
      const parsedMessage = JSON.parse(data)

      // Get each field and transform time into ts format
      const { sensorID, uniqueID, timecollected, heartrate } = parsedMessage

      // Convert into timestampe type: https://questdb.io/docs/reference/sql/datatypes/
      // If you need timestamp accuracy, you can use microtime lib instead of process.hrtime
      const ts = Date.parse(timecollected) * 1000

      const text = 'INSERT INTO heart_rate(sensorID, uniqueID, timecollected, heartrate) VALUES($1, $2, $3, $4)'
      const values = [sensorID, uniqueID, ts, heartrate]

      const res = await client.query(text, values)

      message.ack();
    };

    // Listen for new messages until timeout is hit
    subscription.on('message', messageHandler);
    setTimeout( async () => {
      subscription.removeListener('message', messageHandler)
      console.log("done")
      await client.end()
    }, timeout * 1000)
  }

  listenForMessages()
}

process.on('unhandledRejection', err => {
  console.error(err.message)
  process.exitCode = 1
})

main()
