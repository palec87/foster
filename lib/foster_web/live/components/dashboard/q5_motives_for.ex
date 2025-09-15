defmodule FosterWeb.Components.Dashboard.MotivesFor do
  use FosterWeb, :live_component

  @impl true
  def update(_assigns, socket) do
    answers =
      Foster.Answers.all_answers()
      |> Enum.flat_map(fn answer ->
        case get_in(answer.body, ["q5", "motive_for_fostering"]) do
          nil -> []
          motives when is_list(motives) -> motives
          motive -> [motive]
        end
      end)
      |> Enum.frequencies()
      |> Enum.map(fn {motive, count} -> [motive, count] end)

    IO.inspect(answers)
    data = answers |> Enum.map(fn [motivo, count] -> %{"motivo" => motivo, "contagem" => count} end)

    plot = Tucan.bar(data, "motivo", "contagem",
    tooltip: true,
    orient: :horizontal,
    width: :container,
    height: 150,
    y: [
        sort: "-x",   # sort categories by contagem descending
        title: ""
      ],
    fill_color: "#9467bd",
    corner_radius: 5
    )
    |> Tucan.set_title("Distribuição por motivo")
    |> VegaLite.to_spec()
    # add autosize so VegaLite will fit the container
    |> Map.put("autosize", %{"type" => "fit-x"})

    {:ok, push_event(socket, "draw_motives_for", %{"spec" => plot})}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <div id="motives_for" phx-hook="DrawMotivesFor" style="margin-top: 20px; display: flex; justify-content: center;"></div>
    </div>
    """
  end
end
