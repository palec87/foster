defmodule FosterWeb.Components.Question5 do
  use FosterWeb, :live_component

  @impl true
  def mount(socket) do
    {:ok,
      socket
      |> assign(:no_kids, false)
      |> assign(:provide_family, false)
      |> assign(:altruism, false)
      |> assign(:fin_benefits, false)
      |> assign(:no_interest, false)
      |> assign(:other, "")
      |> assign(:no_response, false)
      |> assign(:answers, %{})
    }
  end

  @impl true
  def handle_event("update_answers", params, socket) do
    # Extract the relevant answers from params
    filtered_answers = params
      |> Enum.filter(fn {key, value} -> value == "true" and key != "other" end)
      |> Enum.map(fn {key, _} -> key end)

    other = Map.get(params, "other", "")
    answers_with_other =
      if other != "" do
        filtered_answers ++ [other]
      else
        filtered_answers
      end

    updated_answers = Map.put(
      socket.assigns.answers,
      :motive_for_fostering,
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
        Quais são os principais motivos da sua resposta anterior? (marque até 3)
      </p>

      <.simple_form
        for={}
        phx-change="update_answers"
        phx-target={@myself}
        >
        <div class="flex items-center gap-2">
          <.input type="checkbox" name="Não poder ter filhos" checked={@no_kids == "true"} />
          <div>
            <p class="font-nohemt">Não poder ter filhos</p>
          </div>
        </div>

        <div class="flex items-center gap-2">
          <.input type="checkbox" name="ambiente_familiar" checked={@provide_family == "true"} />
          <div>
            <p class="font-nohemt">Assegurar ambiente familiar a uma criança vulnerável</p>
          </div>
        </div>

        <div class="flex items-center gap-2">
          <.input type="checkbox" name="Altruismo" checked={@altruism == "true"} />
          <div>
            <p class="font-nohemt">Quero contribuir para a sociedade / altruísmo</p>
          </div>
        </div>

        <div class="flex items-center gap-2">
          <.input type="checkbox" name="Benefícios Financeiros" checked={@fin_benefits == "true"} />
          <div>
            <p class="font-nohemt">Apoio e benefícios financeiros</p>
          </div>
        </div>

        <div class="flex items-center gap-2">
          <.input type="checkbox" name="Não tenho interesse" checked={@no_interest == "true"} />
          <div>
            <p class="font-nohemt">Não tenho interesse</p>
          </div>
        </div>

        <div class="flex items-center gap-2">
          <.label>Outro</.label>
          <.input name="other" value="" placeholder="outro"/>
        </div>

        <div class="flex items-center gap-2">
          <.input type="checkbox" name="Prefiro não responder" checked={@no_response == "true"} />
          <div>
            <p class="font-nohemt">Prefiro não responder</p>
          </div>
        </div>

      </.simple_form>
    </div>
    """
  end

end
