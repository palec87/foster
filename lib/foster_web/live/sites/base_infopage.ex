defmodule FosterWeb.Sites.BaseInfopage do
  use FosterWeb, :live_component

  @page_components %{
    i0: FosterWeb.Components.Info0,
    i1: FosterWeb.Components.Info1,
    i2: FosterWeb.Components.Info2,
    i3: FosterWeb.Components.Info3,
  }

  @impl true
  def render(assigns) do
    assigns = assign(assigns, :component, Map.get(@page_components, assigns.current_page))

    ~H"""
    <div>
      <.live_component module={@component} id={@current_page} />
    </div>
    """
  end
end
