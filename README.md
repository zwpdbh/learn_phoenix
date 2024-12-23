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
- Edit the `docker-compose-for-dev.yaml` to match the settings defined from `config/dev.exs` and run docker-compose to start DB.
- Then  and run:

```sh 
mix ecto.create
```

- Start your Phoenix app with

```sh 
iex --erl "-kernel shell_history enabled" --name hello@127.0.0.1 --cookie some_token -S mix phx.server 
```

## Install Elixir 

### Install ASDF 
* Install some dependences 

```sh 
sudo apt-get update && sudo apt-get install \
  build-essential \
  autoconf \
  libncurses5-dev \
  libncursesw5-dev \
  libwxgtk3.0-gtk3-dev \
  libwxgtk-webview3.0-gtk3-dev \
  xsltproc \
  fop \
  default-jdk \
  libxml2-utils \
  libssh-dev \
  unixodbc-dev 
```

* Install [asdf](https://asdf-vm.com/guide/getting-started.html)

### Install Elixir using asdf 

* Add plugin for erlang and elixir

```sh 
asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang.git
asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git
```

* Check available elixir and erlang version and install them.

```sh 
# check installed erlang and elixir
asdf list erlang 
asdf list elixir 

# check available version
asdf list-all erlang | tail -n 10
asdf list-all elixir | tail -n 10

# install erlang and elixir 
asdf install erlang 27.2
asdf install elixir main-otp-27
```

* Set version and check info 

```sh 
asdf global erlang 27.2
asdf global elixir main-otp-27

# Or set the version in an existing project. 
# This will create a .tool-versionsfile in your project 
# which will instruct ASDF which versions to use.
asdf local erlang 27.2
asdf local elixir main-otp-27

erl -eval 'erlang:display(erlang:system_info(otp_release)), halt().'
elixir -v
```

* If Elixir or Erlang version is not compatible with Phoenix, we could uninstall erlang and elixir.

For example: 

```sh 
asdf uninstall erlang 25.3
```

### Install hex and Phoenix

When you install Elixir, `mix` is automatically included as part of the installation. Mix is a build tool that ships with Elixir, providing tasks for creating, compiling, testing Elixir projects, managing its dependencies, and more.

```sh 
mix local.hex
mix archive.install hex phx_new
```

## How to use livebook 

```sh
docker run \
-p 8007:8007 \
-p 8008:8008 \
-e RELEASE_NODE=hello_livebook \
-e LIVEBOOK_DISTRIBUTION=name \
-e LIVEBOOK_COOKIE=some_token \
-e LIVEBOOK_NODE=livebook@127.0.0.1 \
-e LIVEBOOK_PORT=8007 \
-e LIVEBOOK_IFRAME_PORT=8008 \
-u $(id -u):$(id -g) \
-v $(pwd):/data \
ghcr.io/livebook-dev/livebook
```


## Setup REPL for development -- Start project with liveview as super repo

```sh
# First, start the project with node name
iex  --erl "-kernel shell_history enabled" --name hello@127.0.0.1 --cookie some_token -S mix phx.server
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
docker run \
--network=host \
-e RELEASE_NODE=hello_livebook \
-e LIVEBOOK_DISTRIBUTION=name \
-e LIVEBOOK_COOKIE=some_token \
-e LIVEBOOK_NODE=livebook@127.0.0.1 \
-e LIVEBOOK_PORT=8007 \
-e LIVEBOOK_IFRAME_PORT=8008 \
-u $(id -u):$(id -g) \
-v $(pwd):/data \
ghcr.io/livebook-dev/livebook
```

shows: 

* Those LIVEBOOK options are from [Livebook README](https://github.com/livebook-dev/livebook/releases).
* We could specify to run certain version with gag `0.12.1` for Livebook image support OTP26: `ghcr.io/livebook-dev/livebook:0.12.1`.
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

## How to use dialyxir in Phoenix

Install it by edit `mix.exs`

```elixir 
{:dialyxir, "~> 1.4", only: [:dev], runtime: false}
```

Then run in terminal with: 

```sh 
mix do deps.get, deps.compile
```

Test it by define a function in some module

```elixir 
# Here our `@spec` says the function's return type is an string:
@spec my_cool_func(integer(), integer()) :: String.t()
def my_cool_func(an_integer, another_interger) do
  new_integer = an_integer + 1 + another_interger

  # But the function is actually returning a string!
  Integer.to_string(new_integer)
end
```

At last, we could run it by 

```sh 
mix dialyxir
```

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

### Protocol 'inet_tcp': register/listen error: epmd_close

Solution:

```sh
epmd -names
```

shows 
```txt 
epmd: up and running on port 4369 with data:
name livebook at port 40095
```

It means there is a livebook already running. Find it and terminal will solve this problem (for instance terminate the docker pod instance).

### [error] `inotify-tools` is needed to run `file_system` for your system

Solution: `sudo apt install inotify-tools`

### Cannot get connection id for node :":myapp@localhost"

* If connect `xxx@localhost` doesn't work, try `xxx@127.0.0.1` instead when start project with `--name`.

### Protocol 'inet_tcp': the name livebook_server@zwpdbh seems to be in use by another Erlang node

* Possible reason01:
  * `sudo docker ps` and shutdown previous running liview instance: `docker rm {container_id} -f`
* Possible reason02:
  * see [--name xxxxx appears to be ignored when provided with livebook start](https://github.com/livebook-dev/livebook/discussions/1356)
  * Reason: [Docker is using release scripts, which is separate from the Livebook CLI.](https://hexdocs.pm/mix/Mix.Tasks.Release.html#module-environment-variables).
  * Solution: provide `-e RELEASE_NODE=elixir_horizion`.


### Others

* Evaluator.IOProxy module into the remote node, potentially due to Erlang/OTP version mismatch.
  * We have to make sure the Livebook's OTP version is compatibe with connecting node's OTP version.
* docker: Cannot connect to the Docker daemon at unix:///var/run/docker.sock. Is the docker daemon running?.
  * On ubuntu (WSL), remember to start Docker service by: `sudo service docker start`.
* Livebook docker image could start without problem, but could not visit its address from windows 11.

  From my experience, it is caused by I started the docker in WSL2 while the docker engine is using is Docker desktop in windows 11.

  * uninstall docker desktop from windows 11
  * [install docker in Ubuntu20.04](https://docs.docker.com/engine/install/ubuntu/)
  * Start livebook docker as before, you should click and visit Livebook from that address now.

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
