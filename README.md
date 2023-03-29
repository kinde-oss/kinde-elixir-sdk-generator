# Kinde Elixir SDK Generator

- Templates directory contain the default elixir templates and the SDK code files.
- `kinde-config.yml` is the config file which will generate the SDK files.

Run the following command to generate the code files with OpenAPI code generator:
```ssh
openapi-generator-cli generate -i kinde.yml -g elixir -t templates -c kinde-config.yml -o kinde-elixir-sdk --skip-validate-spec
```
OR 
```ssh
openapi-generator generate -i kinde.yml -g elixir -t templates -c kinde-config.yml -o kinde-elixir-sdk --skip-validate-spec
```

`kinde.yml` is the YML spec file here that will be used for code generation.

## Usage

Install the following dependency after generation:

```elixir
{:plug, "~> 1.13"},
{:plug_cowboy, "~> 2.0"},
{:jason, "~> 1.3"},
{:httpoison, "~> 0.7"}
```