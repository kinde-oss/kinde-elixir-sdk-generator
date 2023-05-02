# Kinde Elixir SDK Generator

## Update config file

`kinde-config.yml` is the config file which will generate the SDK files. We'll need to update the config file with SDK file paths.

Change the first part of file list to the path of the SDK files. In case the SDK is located at the previous directory, no changes are needed to be made.

For example, yml file will become for each file from:
```yml
../kinde-elixir-sdk/lib/kinde_sdk/sdk/authorization_code.ex:
    destinationFilename: lib/kinde_sdk/sdk/authorization_code.ex
```
to:
```yml
/path/to/sdk/authorization_code.ex:
    destinationFilename: lib/kinde_sdk/sdk/authorization_code.ex
```

## Generate

Run the following command to generate the code files with OpenAPI code generator:
```ssh
openapi-generator-cli generate -i kinde.yml -g elixir -c kinde-config.yml -o kinde-elixir-sdk --skip-validate-spec
```
OR 
```ssh
openapi-generator generate -i kinde.yml -g elixir -c kinde-config.yml -o kinde-elixir-sdk --skip-validate-spec
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