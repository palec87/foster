defmodule FosterWeb.Components.Dashboard.ProbFor do
  use FosterWeb, :live_component

  @impl true
  def update(_assigns, socket) do
    answers =
      Foster.Answers.all_answers()
      |> Enum.group_by(fn answer -> get_in(answer.body, ["q4"]) end)
      |> Enum.reject(fn {groupname, _answers} -> is_nil(groupname) end)  # Filter out nil age spans
      |> Enum.map(fn {groupname, answers} -> [groupname, length(answers)]  end)

    IO.inspect(answers)

    data = answers |> Enum.map(fn [inclination, count] -> %{"inclinação" => inclination, "contagem" => count} end)

    plot = Tucan.bar(data, "inclinação", "contagem",
    tooltip: true,
    orient: :horizontal,
    width: :container,
    height: 150,
    y: [title: ""],
    fill_color: "#d62728",
    corner_radius: 5
    )
    |> Tucan.set_title("Inclinação para acolhimento (5 = muito provável)")
    |> VegaLite.to_spec()
    # add autosize so VegaLite will fit the container
    |> Map.put("autosize", %{"type" => "fit-x"})

    {:ok, push_event(socket, "draw_prob_for", %{"spec" => plot})}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <div id="probability" phx-hook="DrawProbFor" style="margin-top: 20px; display: flex; justify-content: center;"></div>
    </div>
    """
  end
end
