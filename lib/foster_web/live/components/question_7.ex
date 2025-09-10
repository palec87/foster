defmodule FosterWeb.Components.Question7 do
  use FosterWeb, :live_component

  @impl true
  def mount(socket) do
    # answers = socket.assigns[:answers]
    # IO.inspect(answers, label: "Answers after final submit", struct: false, limit: :infinity)
    {:ok,
      socket
      |> assign(:training, false)
      |> assign(:money, false)
      |> assign(:support, false)
      |> assign(:flexibility, false)
      |> assign(:examples, false)
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
      :helpers,
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
        O que ajudaria mais a considerar o acolhimento familiar? (escolha até 3)
      </p>

      <.simple_form
        for={}
        phx-change="update_answers"
        phx-target={@myself}
        >
      <div class="flex items-center gap-2">
        <.input type="checkbox" name="Formação" checked={@training == "true"} />
        <div>
          <p class="font-nohemt">Formação e apoio técnico (workshops)</p>
        </div>
      </div>

      <div class="flex items-center gap-2">
        <.input type="checkbox" name="Finanças" checked={@money == "true"} />
        <div>
          <p class="font-nohemt"> Apoio financeiro / subsídio adequado</p>
        </div>
      </div>

      <div class="flex items-center gap-2">
        <.input type="checkbox" name="Acompanhamento" checked={@support == "true"} />
        <div>
          <p class="font-nohemt">Acompanhamento profissional contínuo</p>
        </div>
      </div>

      <div class="flex items-center gap-2">
        <.input type="checkbox" name="Flexibilidade" checked={@flexibility == "true"} />
        <div>
          <p class="font-nohemt">Horário de trabalho flexível ou compatível</p>
        </div>
      </div>

      <div class="flex items-center gap-2">
        <.input type="checkbox" name="Exemplos" checked={@examples == "true"} />
        <div>
          <p class="font-nohemt">Informação clara e casos exemplares</p>
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
