defmodule FosterWeb.Components.Question1 do
  use FosterWeb, :live_component

  @impl true
  def mount(socket) do
    {:ok,
      socket
      |> assign(:people, false)
      |> assign(:media, false)
      |> assign(:internet, false)
      |> assign(:social_media, false)
      |> assign(:organizations, false)
      |> assign(:other, "")
      |> assign(:answers, %{})
    }
  end

  @impl true
  def handle_event("update_answers", params, socket) do
    # Extract the relevant answers from params
    filtered_answers = params
      |> Enum.filter(fn {key, value} -> value == "true" and key != "other" end)
      |> Enum.map(fn {key, _} -> key end)

    # Handle the 'other' option if present and non-empty
    other = Map.get(params, "other", "")
    answers_with_other =
      if other != "" do
        filtered_answers ++ [other]
      else
        filtered_answers
      end

    updated_answers = Map.put(
      socket.assigns.answers,
      :heard_about_fostering,
      answers_with_other
    )

    send(self(), {:update_answers, updated_answers})

    {:noreply, socket}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <p class="text-2xl text-light_dark_matter font-inter">
        Onde ouviu falar de Acolhimento Familiar?
      </p>

      <.simple_form
        for={}
        phx-change="update_answers"
        phx-target={@myself}
        >
        <div class="flex items-center gap-2">
          <.input type="checkbox" name="Redes sociais" checked={@social_media == "true"} />
          <div>
            <p class="font-nohemt">Redes sociais</p>
          </div>
        </div>

        <div class="flex items-center gap-2">
          <.input type="checkbox" name="Media" checked={@media == "true"} />
          <div>
            <p class="font-nohemt">TV / Rádio / Jornal</p>
          </div>
        </div>

        <div class="flex items-center gap-2">
          <.input type="checkbox" name="Pessoas" checked={@people == "true"} />
          <div>
            <p class="font-nohemt">Familiares / Amigos / Colegas</p>
          </div>
        </div>

        <div class="flex items-center gap-2">
          <.input type="checkbox" name="Organizações" checked={@organizations == "true"} />
          <p class="font-nohemt">Instituições governamentais / ONGs</p>
        </div>

        <div class="flex items-center gap-2">
          <.input type="checkbox" name="Internet" checked={@internet == "true"} />
          <p class="font-nohemt">Internet em geral</p>
        </div>

        <div class="flex items-center gap-2">
          <.label>Outros (especificar)</.label>
          <.input name="Outro" value="" placeholder="outro"/>
        </div>
      </.simple_form>
    </div>
    """
  end
end
