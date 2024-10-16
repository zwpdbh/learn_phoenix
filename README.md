# LearnPhoenix

This is the project for learning Phoenix framework comparing parallel with: 
- [Rust Axum Full Course - Web Development (GitHub repo updated to Axum 0.7)](https://www.youtube.com/watch?v=XZtlD_m59sM)
- [Rust Axum Production Coding (E01 - Rust Web App Production Coding)](https://www.youtube.com/watch?app=desktop&v=3cA_mk4vdWY)

To start your Phoenix server:

  * Run `mix setup` to install and setup dependencies
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Configure database 

After create this application by `mix phx.new learn_phoenix`. The next thing to do is to setup database.

- Check your database configuration in `config/dev.exs`.
- Edit the `docker-compose-for-postgres-dev.yaml` to match the settings defined from `config/dev.exs` and run docker-compose to start DB.
- Then  and run:

```sh 
mix ecto.create
```

- Start your Phoenix app with

```sh 
iex -S mix phx.server
```

## Setup REPL for development -- Start project with liveview as super repo

```sh
# First, start the project with node name
iex --name hello@127.0.0.1 --cookie some_token -S mix phx.server
Erlang/OTP 26 [erts-14.2.5] [source] [64-bit] [smp:24:24] [ds:24:24:10] [async-threads:1] [jit:ns]

[info] Running HelloWeb.Endpoint with Bandit 1.5.2 at 127.0.0.1:4000 (http)
[info] Access HelloWeb.Endpoint at http://localhost:4000
Interactive Elixir (1.18.0-dev) - press Ctrl+C to exit (type h() ENTER for help)
[watch] build finished, watching for changes...

Rebuilding...

Done in 240ms.
iex(hello@127.0.0.1)1> Node.self
:"hello@127.0.0.1"
```

* `--name` specify we running node using full name mode.
  * `:"hello@127.0.0.1"` is the node name checked by `Node.self`
  * There is also a `--sname` short name option.
* `--cookie` is the shared token for all connecting nodes. Here is `some_token`.

```sh
# Then, from another terminal 
sudo docker run \
--network=host \
-e LIVEBOOK_DISTRIBUTION=name \
-e LIVEBOOK_COOKIE=some_token \
-e LIVEBOOK_NODE=livebook@localhost \
-e LIVEBOOK_PORT=8007 \
-e LIVEBOOK_IFRAME_PORT=8008 \
-e RELEASE_NODE=livebook_hello \
-u $(id -u):$(id -g) \
-v $(pwd):/data \
ghcr.io/livebook-dev/livebook:0.12.1
```

* `--network` specify the docker container we run use [Host network driver](https://docs.docker.com/network/drivers/host/).
* Those LIVEBOOK options are from [Livebook README](https://github.com/livebook-dev/livebook/releases).
* Tag `0.12.1` from Livebook image support OTP26.
* If succeed, it should oupt something like:

  ```sh
  [Livebook] Application running at http://0.0.0.0:8007/?token=gwc234cmrxsfnqkaeeu6hv7wjhg3qe2g
  ```

## Setup REPL for development -- Connect to the phoenix project from Livebook

* Create or open a Livebook.
* Go to
  * Runtime settings
  * Configure
    * `Name` should be: `hello@127.0.0.1` which could be checked in target project's iex with `Node.self`
    * `Cookie` should be: the cookie we used above, such as `some_token`.
  * If connect succeed, it should shows the reconnect and disconnect option along with memory metric for the connect node.
* If connected, it means we could create code block and execute any code as if we are using `iex`.
  * For example, if we visit `http://localhost:4000/route`, we shall see the existing routes available in phoenix.
  * We could also get the same infomation in livebook by executing the code: `Mix.Tasks.Phx.Routes.run ''` in evaluation cell.

## Proxy hex packages

* Elixir use `hex` to manage packages.
* Permanently select a mirror
  * For mix
  
      ```sh
      # For mix 
      mix hex.config mirror_url https://repo.hex.pm 
      ```

  * For rebar3
  
    Add to the global or a project’s top level `rebar.config, {rebar_packages_cdn, "https://repo.hex.pm"}.`. For more information see rebar3’s package support and configuration documentation.

  See: [Mirrors](https://hex.pm/docs/mirrors)

* Temporarily select a mirror, Hex commands can be prefixed with an environment variable in the shell.
  
  ```sh
  HEX_MIRROR=https://repo.hex.pm mix deps.get
  HEX_CDN=https://repo.hex.pm rebar3 update

  # Or 
  export HEX_MIRROR="https://hexpm.upyun.com"
  export HEX_CDN="https://hexpm.upyun.com"
  ```

## Proxy docker images

Edit or create the Docker daemon configuration file (`sudo vi /etc/docker/daemon.json`) to include the following mirror configurations:

```json
{
  "registry-mirrors": [
    "https://registry.docker-cn.com",
    "https://docker.mirrors.ustc.edu.cn",
    "https://hub-mirror.c.163.com",
    "https://mirror.baidubce.com"
  ]
}
```

After adding the mirror configurations, restart the Docker daemon to apply the changes:

```sh
sudo service docker restart
sudo docker info
```

You shall see information like:

```txt
 Registry Mirrors:
  https://registry.docker-cn.com/
  https://docker.mirrors.ustc.edu.cn/
  https://hub-mirror.c.163.com/
  https://mirror.baidubce.com/
```

## Troubleshooting

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
