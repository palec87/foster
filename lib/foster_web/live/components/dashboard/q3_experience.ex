defmodule FosterWeb.Components.Dashboard.FosterExperience do
  use FosterWeb, :live_component

    @impl true
    def update(_assigns, socket) do
    answers =
      Foster.Answers.all_answers()
      |> Enum.group_by(fn answer -> get_in(answer.body, ["q3"]) end)
      |> Enum.reject(fn {groupname, _answers} -> is_nil(groupname) end)  # Filter out nil age spans
      |> Enum.map(fn {groupname, answers} -> [groupname, length(answers)]  end)

    IO.inspect(answers)

    data = answers |> Enum.map(fn [experience, count] -> %{"experiencia" => experience, "contagem" => count} end)

    plot = Tucan.bar(data, "experiencia", "contagem",
    tooltip: true,
    orient: :horizontal,
    width: 300,
    height: 150,
    y: [title: ""],
    fill_color: "#2ca02c",
    corner_radius: 5
    )
    |> Tucan.set_title("Experiência prévia")
    |> VegaLite.to_spec()

    {:ok, push_event(socket, "draw_experience", %{"spec" => plot})}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <div id="experience" phx-hook="DrawExperience" style="margin-top: 20px; display: flex; justify-content: center;"></div>
    </div>
    """
  end

end
