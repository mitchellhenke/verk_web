defmodule VerkWeb.Mount do
  defmacro __using__(path: path) do
    quote bind_quoted: [path: path] do
      path = unless String.starts_with?(path, "/") do
        "/" <> path
      else
        path
      end

      plug VerkWeb.Plug.Mount, path
      socket "#{path}/socket", VerkWeb.UserSocket
    end
  end
end
