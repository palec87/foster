defmodule FosterWeb.Components.Dashboard.Challenges do
  use FosterWeb, :live_component

   @impl true
  def update(_assigns, socket) do
    answers =
      Foster.Answers.all_answers()
      |> Enum.flat_map(fn answer ->
        case get_in(answer.body, ["q6", "challenges"]) do
          nil -> []
          motives when is_list(motives) -> motives
          motive -> [motive]
        end
      end)
      |> Enum.frequencies()
      |> Enum.map(fn {motive, count} -> [motive, count] end)

    IO.inspect(answers)
    data = answers |> Enum.map(fn [antimotivo, count] -> %{"ANTI-motivo" => antimotivo, "contagem" => count} end)

    plot = Tucan.bar(data, "ANTI-motivo", "contagem",
      tooltip: true,
      orient: :horizontal,
      width: :container,
      height: 150,
      x: [
        tickMinStep: 1,            # force step size = 1
        # axis: %{format: ".0f"},   # ensure whole numbers on tick labels
        # scale: %{nice: true},     # clean up scale
      ],
      y: [
        sort: "-x" ,  # sort categories by contagem descending
        title: ""
      ],
      fill_color: "#8c564b",
      corner_radius: 5
    )
    |> Tucan.set_title("Motivos contra")
    |> VegaLite.to_spec()
    # add autosize so VegaLite will fit the container
    |> Map.put("autosize", %{"type" => "fit-x"})

    {:ok, push_event(socket, "draw_challenges", %{"spec" => plot})}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <div id="challenges" phx-hook="DrawChallenges" style="margin-top: 20px; display: flex; justify-content: center;"></div>
    </div>
    """
  end
end
