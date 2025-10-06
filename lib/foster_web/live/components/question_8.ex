defmodule FosterWeb.Components.Question8 do
  use FosterWeb, :live_component

  @impl true
  def mount(socket) do
    {:ok,
     socket
     |> assign(:answers, %{})
    }
  end


  @impl true
  def handle_event("update_answers", params, socket) do
    # Extract the relevant answers from params

    updated_answers =
      socket.assigns.answers
      |> Map.put(:agespan, params["age"])
      |> Map.put(:gender, params["gender"])
      |> Map.put(:pt_region, params["region"])
      |> Map.put(:employment_status, params["employment_status"])
      |> Map.put(:education, params["education"])

    # probably not needed here
    # Foster.Answers.create_answer(%{body: updated_answers})

    send(self(), {:update_answers, updated_answers})

    {:noreply, socket}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <p class="text-2xl text-light_dark_matter font-inter">
        Breves dados demográficos (últimas perguntas)
      </p>

      <.simple_form
        for={}
        phx-change="update_answers"
        phx-target={@myself}>
        <div class="flex items-center gap-2">
          <.label>Idade</.label>
          <.input name="age" value="" placeholder="Idade" type="select"
                  options={["--", "18-25", "26-35", "36-49", "50-65", "65+"]} />
        </div>

        <div class="flex items-center gap-2">
          <.label>Género</.label>
          <.input name="gender" value="" placeholder="Género" type="select"
                  options={["--", "Não-binário", "Prefiro não dizer","Feminino", "Masculino"]} />
        </div>

        <div class="flex items-center gap-2">
          <.label>Região</.label>
          <.input name="region"
                  value=""
                  placeholder="Região"
                  type="select"
                  options={["--", "Aveiro", "Beja", "Braga", "Bragança", "Castelo Branco", "Coimbra", "Évora", "Faro",
                            "Guarda", "Leiria", "Lisboa", "Porto", "Santarém", "Setúbal", "Viana do Castelo",
                            "Vila Real", "Viseu", "Madeira", "Açores"]} />
        </div>

        <div class="flex items-center gap-2">
          <.label>Estado laboral</.label>
          <.input name="employment_status"
                  value=""
                  placeholder="Estado laboral"
                  type="select"
                  options={["--", "Empregado", "Desempregado", "Estudante", "Reformado(a)"]} />
        </div>

        <div class="flex items-center gap-2">
          <.label>Ensino</.label>
          <.input name="education"
                  value=""
                  placeholder="Nível de ensino"
                  type="select"
                  options={["--", "Básico", "Secundário", "Licenciatura", "Mestrado", "Doutoramento"]} />
        </div>
      </.simple_form>
    </div>
    """
  end
end
