# bun vs next first load test

This measures how long it takes to go from pressing enter in your terminal to the page visible on the screen.

This uses a very small Zig executable for printing the current timestamp in ms. The source code is in this repo and a binary for macOS x64 is checked in, so you don't need to have Zig installed to run this. I wrote it because I couldn't figure out how to get `time` to print on macOS in milliseconds

The page expects a `ms` query string param which is an integer timestamp in milliseconds since epoch.

## Bun

Note: the command is in fish

```fish
set -x CURRENT_TIMESTAMP (realpath ./print-timestamp); bun & open "http://localhost:3000/time?ms=$CURRENT_TIMESTAMP";
```

## Next.js

Due to how long Next takes to start, it may show a not found page in Chrome initially. But, Chrome automatically retries.

```fish
set -x CURRENT_TIMESTAMP (realpath ./print-timestamp);   ./node_modules/.bin/next dev --port=8081 & open "http://localhost:8081/time?ms=$CURRENT_TIMESTAMP";
```

Since the job is started asynchronously with `&`, you'll need to `killall bun node` or the server will remain running.

## compile ./print-timestamp.zig

If you want to compile `print-timestamp.zig`, run this:

```bash
zig build -Drelease-fast
```
