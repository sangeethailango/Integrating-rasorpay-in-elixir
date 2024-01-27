defmodule RazorpayElixirWeb.ErrorJSONTest do
  use RazorpayElixirWeb.ConnCase, async: true

  test "renders 404" do
    assert RazorpayElixirWeb.ErrorJSON.render("404.json", %{}) == %{errors: %{detail: "Not Found"}}
  end

  test "renders 500" do
    assert RazorpayElixirWeb.ErrorJSON.render("500.json", %{}) ==
             %{errors: %{detail: "Internal Server Error"}}
  end
end
