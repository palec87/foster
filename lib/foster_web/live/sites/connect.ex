defmodule FosterWeb.Sites.Connect do
  use FosterWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div class="mx-10 space-y-8">
      <section class="space-y-3 text-center">
        <img src="/images/kids.svg" class="mx-auto" />
        <p class="text-3xl font-bold font-nohemi text-light_dark_matter">Mantenha-se ligado</p>
        <p class="text-xl">
          Subscreva para receber novidades e use o formulario para partilhar sugestoes ou problemas.
        </p>
      </section>

      <section class="rounded border p-6">
        <.live_component module={FosterWeb.Components.FeedbackSubscribe} id="connect-feedback" />
      </section>
    </div>
    """
  end
end
