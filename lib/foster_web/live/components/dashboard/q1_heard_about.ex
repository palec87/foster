defmodule FosterWeb.Components.Dashboard.HeardAbout do
  use FosterWeb, :live_component

  @impl true
  def update(_assigns, socket) do
    answers =
      Foster.Answers.all_answers()
      |> Enum.flat_map(fn answer ->
        case get_in(answer.body, ["q1", "heard_about_fostering"]) do
          nil -> []
          vals when is_list(vals) -> vals
          val -> [val]
        end
      end)
      |> Enum.frequencies()
      |> Enum.map(fn {val, count} -> [val, count] end)

    IO.inspect(answers)

    data = answers |> Enum.map(fn [val, count] -> %{"ouvir_falar" => val, "contagem" => count} end)

    plot = Tucan.bar(data, "ouvir_falar", "contagem",
    tooltip: true,
    orient: :horizontal,
    width: :container,
    height: 150,
    y: [
        sort: "-x",   # sort categories by contagem descending
        title: ""
      ],
    fill_color: "#7f7f7f",
    corner_radius: 5
    )
    |> Tucan.set_title("Fonte de informação")
    |> VegaLite.to_spec()
    # add autosize so VegaLite will fit the container
    |> Map.put("autosize", %{"type" => "fit-x"})

    {:ok, push_event(socket, "draw_heard_about", %{"spec" => plot})}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <div id="heard_about" phx-hook="DrawHeardAbout" style="margin-top: 20px; display: flex; justify-content: center;"></div>
    </div>
    """
  end

end
