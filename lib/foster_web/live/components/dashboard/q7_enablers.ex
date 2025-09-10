defmodule FosterWeb.Components.Dashboard.Enablers do
  use FosterWeb, :live_component

   @impl true
  def update(_assigns, socket) do
    answers =
      Foster.Answers.all_answers()
      |> Enum.flat_map(fn answer ->
        case get_in(answer.body, ["q7", "helpers"]) do
          nil -> []
          vals when is_list(vals) -> vals
          val -> [val]
        end
      end)
      |> Enum.frequencies()
      |> Enum.map(fn {val, count} -> [val, count] end)

    IO.inspect(answers)
    data = answers |> Enum.map(fn [val, count] -> %{"facilitador" => val, "contagem" => count} end)

    plot = Tucan.bar(data, "facilitador", "contagem",
      tooltip: true,
      orient: :horizontal,
      width: 300,
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
      fill_color: "#e377c2",
      corner_radius: 5
    )
    |> Tucan.set_title("Aspectos facilitadores")
    |> VegaLite.to_spec()

    {:ok, push_event(socket, "draw_enablers", %{"spec" => plot})}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <div id="enablers" phx-hook="DrawEnablers" style="margin-top: 20px; display: flex; justify-content: center;"></div>
    </div>
    """
  end
end
