defmodule PkceTest do
  use ExUnit.Case

  alias KindeClientSDK
  alias Plug.Conn

  @domain "https://elixirsdk.kinde.com"
  @redirect_url "http://localhost:4000/callback"
  @client_id "48e3345e636c4e33a2fd44413d252138"
  @client_secret "dPEIzTGS8TNGPiH0HXOXuF9f7p8Pm6zV4VOjgZsFkiR5muN9m"
  @grant_type :authorization_code_flow_pkce
  @logout_redirect_url "http://localhost:4000/logout"

  setup_all do
    {:ok, conn: Plug.Test.conn(:get, "/") |> Plug.Test.init_test_session(%{})}
  end

  test "initialize the client", %{conn: conn} do
    {conn, client} =
      KindeClientSDK.init(
        conn,
        @domain,
        @redirect_url,
        @client_id,
        @client_secret,
        @grant_type,
        @logout_redirect_url
      )

    assert client.token_endpoint == @domain <> "/oauth2/token"
    refute is_nil(Conn.get_session(conn, :kinde_cache_pid))
  end

  test "login", %{conn: conn} do
    {conn, client} =
      KindeClientSDK.init(
        conn,
        @domain,
        @redirect_url,
        @client_id,
        @client_secret,
        @grant_type,
        @logout_redirect_url
      )

    pid = Conn.get_session(conn, :kinde_cache_pid)
    GenServer.cast(pid, {:add_kinde_data, {:kinde_client, client}})

    conn = KindeClientSDK.login(conn, client)

    refute Enum.empty?(Conn.get_resp_header(conn, "location"))
  end

  test "login with audience", %{conn: conn} do
    additional_params = %{
      audience: @domain <> "/api"
    }

    {conn, client} =
      KindeClientSDK.init(
        conn,
        @domain,
        @redirect_url,
        @client_id,
        @client_secret,
        @grant_type,
        @logout_redirect_url,
        "openid profile email offline",
        additional_params
      )

    pid = Conn.get_session(conn, :kinde_cache_pid)
    GenServer.cast(pid, {:add_kinde_data, {:kinde_client, client}})

    conn = KindeClientSDK.login(conn, client)

    refute Enum.empty?(Conn.get_resp_header(conn, "location"))
  end

  test "login with additional", %{conn: conn} do
    additional_params = %{
      audience: @domain <> "/api"
    }

    {conn, client} =
      KindeClientSDK.init(
        conn,
        @domain,
        @redirect_url,
        @client_id,
        @client_secret,
        @grant_type,
        @logout_redirect_url,
        "openid profile email offline",
        additional_params
      )

    pid = Conn.get_session(conn, :kinde_cache_pid)
    GenServer.cast(pid, {:add_kinde_data, {:kinde_client, client}})

    additional_params_more = %{
      org_code: "org_123",
      org_name: "My Application"
    }

    conn = KindeClientSDK.login(conn, client, additional_params_more)

    refute Enum.empty?(Conn.get_resp_header(conn, "location"))
  end

  test "register with additional", %{conn: conn} do
    additional_params = %{
      audience: @domain <> "/api"
    }

    {conn, client} =
      KindeClientSDK.init(
        conn,
        @domain,
        @redirect_url,
        @client_id,
        @client_secret,
        @grant_type,
        @logout_redirect_url,
        "openid profile email offline",
        additional_params
      )

    pid = Conn.get_session(conn, :kinde_cache_pid)
    GenServer.cast(pid, {:add_kinde_data, {:kinde_client, client}})

    additional_params_more = %{
      org_code: "org_123",
      org_name: "My Application"
    }

    conn = KindeClientSDK.register(conn, client, additional_params_more)

    refute Enum.empty?(Conn.get_resp_header(conn, "location"))
  end

  test "create org", %{conn: conn} do
    additional_params = %{
      audience: @domain <> "/api"
    }

    {conn, client} =
      KindeClientSDK.init(
        conn,
        @domain,
        @redirect_url,
        @client_id,
        @client_secret,
        @grant_type,
        @logout_redirect_url,
        "openid profile email offline",
        additional_params
      )

    pid = Conn.get_session(conn, :kinde_cache_pid)
    GenServer.cast(pid, {:add_kinde_data, {:kinde_client, client}})

    conn = KindeClientSDK.create_org(conn, client)

    refute Enum.empty?(Conn.get_resp_header(conn, "location"))
  end

  test "create org with additional", %{conn: conn} do
    additional_params = %{
      audience: @domain <> "/api"
    }

    {conn, client} =
      KindeClientSDK.init(
        conn,
        @domain,
        @redirect_url,
        @client_id,
        @client_secret,
        @grant_type,
        @logout_redirect_url,
        "openid profile email offline",
        additional_params
      )

    pid = Conn.get_session(conn, :kinde_cache_pid)
    GenServer.cast(pid, {:add_kinde_data, {:kinde_client, client}})

    additional_params_more = %{
      org_code: "org_123",
      org_name: "My Application"
    }

    conn = KindeClientSDK.create_org(conn, client, additional_params_more)

    refute Enum.empty?(Conn.get_resp_header(conn, "location"))
  end
end
