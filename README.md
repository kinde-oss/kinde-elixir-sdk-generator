# Kinde Elixir Generator

The generator for the [Kinde Elixir SDK](https://github.com/kinde-oss/kinde-elixir-sdk).

[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](https://makeapullrequest.com) [![Kinde Docs](https://img.shields.io/badge/Kinde-Docs-eee?style=flat-square)](https://kinde.com/docs/developer-tools) [![Kinde Community](https://img.shields.io/badge/Kinde-Community-eee?style=flat-square)](https://thekindecommunity.slack.com)

## Overview

This generator creates an SDK in Elixir that can authenticate to Kinde using the Authorization Code grant or the Authorization Code with PKCE grant via the [OAuth 2.0 protocol](https://oauth.net/2/). It can also access the [Kinde Management API](https://kinde.com/api/docs/#kinde-management-api) using the client credentials grant.

Also, see the SDKs section in Kinde’s [contributing guidelines](https://github.com/kinde-oss/.github/blob/main/.github/CONTRIBUTING.md).

## Usage

### Initial set up

1. Clone the repository to your machine:

   ```bash
   git clone https://github.com/kinde-oss/kinde-elixir-sdk-generator.git
   ```

2. Go into the project:

   ```bash
   cd kinde-elixir-sdk-generator
   ```

3. Install the OpenAPI Generator tool:

   https://openapi-generator.tech/docs/installation

### SDK generation

Run the following commands to generate the SDK:

```bash
openapi-generator-cli generate -i kinde.yml -g elixir -c kinde-config.yml -o kinde-elixir-sdk --skip-validate-spec
```

**Note:** Instead of `openapi-generator-cli`, you can also use: `openapi-generator`.

The SDK gets outputted to: `kinde-elixir-sdk`, which you can enter via:

```bash
cd kinde-elixir-sdk
```

## SDK documentation

[Elixir SDK](https://kinde.com/docs/developer-tools/elixir-sdk)

## Development

### Update config file

`kinde-config.yml` is the config file that generates the SDK files, and you will need to update the config file with the SDK file paths.

Change the first part of the file list to the path of the SDK files. In case the SDK is located at the previous directory, no changes are needed to be made.

For example, the YAML file will become for each file from:

```yml
../kinde-elixir-sdk/lib/kinde_sdk/sdk/authorization_code.ex:
    destinationFilename: lib/kinde_sdk/sdk/authorization_code.ex
```

To:

```yml
/path/to/sdk/authorization_code.ex:
    destinationFilename: lib/kinde_sdk/sdk/authorization_code.ex
```

### Dependencies

Install the following dependency after generation:

```elixir
{:plug, "~> 1.13"},
{:plug_cowboy, "~> 2.0"},
{:jason, "~> 1.3"},
{:httpoison, "~> 0.7"}
```

## Contributing

Please refer to Kinde’s [contributing guidelines](https://github.com/kinde-oss/.github/blob/489e2ca9c3307c2b2e098a885e22f2239116394a/CONTRIBUTING.md).

## License

By contributing to Kinde, you agree that your contributions will be licensed under its MIT License.
