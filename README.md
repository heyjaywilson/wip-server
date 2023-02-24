# Server for Work in Public app

The server is written in Swift and uses Vapor. The database is PostgreSQL.

## How to run

<details>
<summary>In Xcode</summary>

1. Open the project in Xcode
2. Make sure your `Custom Working Directory` is set
3. Run the project by hitting CMD+R
4. The console inside Xcode should say `[ NOTICE ] Server starting on http://127.0.0.1:8080`
</details>

<details>
<summary>In the Terminal</summary>

1. Open the terminal
2. Run `swift run`
3. The terminal should say `[ NOTICE ] Server starting on http://127.0.0.1:8080` if running correctly
</details>

Both consoles will log the requests

## Common issues

### Xcode can't find `.env` or `Public` variable

This is because the build scheme doesn't have the custom working directory set like the [docs](https://docs.vapor.codes/getting-started/xcode/) say to do.
