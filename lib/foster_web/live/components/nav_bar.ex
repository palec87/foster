defmodule FosterWeb.Components.NavBar do
  use FosterWeb, :live_component

  def update(_params, socket) do
    {:ok, socket}
  end

  def handle_event("change_language", _params, socket) do
    {:noreply, socket}
  end

  def render(assigns) do
    ~H"""
    <div class="flex flex-wrap justify-center gap-3 font-nohami pt-6">
      <div>
        <a href="/">Início</a>
      </div>
      <div>
        <a href="/questionnaire">Questionário</a>
      </div>
      <div>
        <a href="/learn-more">Factos</a>
      </div>
      <div>
        <a href="/estatisticas">Estatísticas</a>
      </div>
      <div>
        <a href="/support">Apoio</a>
      </div>
      <div>
        <a href="/connect">Connect</a>
      </div>
    </div>
    """
  end
end
