defmodule FosterWeb.Sites.LearnMore do
  use FosterWeb, :live_view

  @info_pages [:i0, :i1, :i2, :i3]

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :info_pages, @info_pages)}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div class="mx-10 space-y-8">
      <section class="space-y-3">
        <img src="/images/bulb-icon.svg" class="mx-auto" />
        <p class="text-3xl font-bold font-nohemi text-center">Saiba mais</p>
        <p class="text-xl text-center">
          Reunimos os principais factos e explicacoes para compreender melhor o acolhimento familiar.
        </p>
      </section>

      <section class="space-y-8">
        <%= for page <- @info_pages do %>
          <div class="rounded border p-6">
            <.live_component module={FosterWeb.Sites.BaseInfopage} id={page} current_page={page} />
          </div>
        <% end %>
      </section>

      <div class="flex justify-center">
        <a href="/questionnaire" class="rounded border px-6 py-3 font-nohemi hover:bg-gray-50 transition-colors">
          Ir para o questionario
        </a>
      </div>
    </div>
    """
  end
end
