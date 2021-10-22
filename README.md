# Phobos Test

This is a test to get a single server with multiple Kafka consumers listening to
different topics using different consumer groups.

## To Run

Right now, you need to start the entire Rails app to start the consumers.

```shell
bin/rails server
```

It will automatically create topics and register consumers for them.

- `test.books`
- `test.reviews`
- `test.users`
