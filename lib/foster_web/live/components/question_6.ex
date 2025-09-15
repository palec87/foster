defmodule FosterWeb.Components.Question6 do
  use FosterWeb, :live_component

  @impl true
  def mount(socket) do
    # answers = socket.assigns[:answers]
    # IO.inspect(answers, label: "Answers after final submit", struct: false, limit: :infinity)
    {:ok,
      socket
      |> assign(:money, false)
      |> assign(:housing, false)
      |> assign(:work, false)
      |> assign(:family_context, false)
      |> assign(:lack_experience, false)
      |> assign(:health_concern, false)
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
      :challenges,
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
        Quais são os principais desafios para que seja uma Família de Acolhimento? (marque todos os que se aplicam)
      </p>

      <.simple_form
        for={}
        phx-change="update_answers"
        phx-target={@myself}
        >
      <div class="flex items-center gap-2">
        <.input type="checkbox" name="Financeira" checked={@money == "true"} />
        <div>
          <p class="font-nohemt">Encargo financeiro adicional</p>
        </div>
      </div>

      <div class="flex items-center gap-2">
        <.input type="checkbox" name="Habitação" checked={@housing == "true"} />
        <div>
          <p class="font-nohemt"> Condições habitacionais actuais</p>
        </div>
      </div>

      <div class="flex items-center gap-2">
        <.input type="checkbox" name="Carga de trabalho" checked={@work == "true"} />
        <div>
          <p class="font-nohemt">Limitações por motivos profissionais (horário, falta de flexibilidade)</p>
        </div>
      </div>

      <div class="flex items-center gap-2">
        <.input type="checkbox" name="Familiares" checked={@family_context == "true"} />
        <div>
          <p class="font-nohemt">Contexto familiar actual desafiante</p>
        </div>
      </div>

      <div class="flex items-center gap-2">
        <.input type="checkbox" name="Inexperiência" checked={@lack_experience == "true"} />
        <div>
          <p class="font-nohemt">Inexperiência parental</p>
        </div>
      </div>

      <div class="flex items-center gap-2">
        <.input type="checkbox" name="Saúde" checked={@health_concern == "true"} />
        <div>
          <p class="font-nohemt">Preocupações com a saúde/trauma da criança</p>
        </div>
      </div>

      <div class="flex items-center gap-2">
        <.label>Outro</.label>
        <.input name="other" value="" placeholder="outro"/>
      </div>

      </.simple_form>
    </div>
    """
  end
end
