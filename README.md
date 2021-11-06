# Phobos Test

This is a test to get a single server with multiple Kafka consumers listening to
different topics using different consumer groups.

## To Run

Right now, you need to start the entire Rails app to start the consumers.

```bash
bin/rails server
```

It will automatically create topics and register consumers for them.

- `test.books`
- `test.reviews`
- `test.users`

You can manually write to a Kafka topic with `kcat`:

```bash
kcat -P -b localhost -t test.books -k 1234 <<MSG
{"id": 1234}
MSG
```