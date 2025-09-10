defmodule FosterWeb.Components.Dashboard.InfoLevel do
  use FosterWeb, :live_component

  @impl true
  def update(_assigns, socket) do
    answers =
      Foster.Answers.all_answers()
      |> Enum.group_by(fn answer -> get_in(answer.body, ["q2"]) end)
      |> Enum.reject(fn {groupname, _answers} -> is_nil(groupname) end)  # Filter out nil age spans
      |> Enum.map(fn {groupname, answers} -> [groupname, length(answers)]  end)

    IO.inspect(answers)

    data = answers |> Enum.map(fn [info_level, count] -> %{"nivel_informacao" => info_level, "contagem" => count} end)

    plot = Tucan.bar(data, "nivel_informacao", "contagem",
    tooltip: true,
    orient: :horizontal,
    width: 300,
    height: 150,
    y: [title: ""],
    fill_color: "#ff7f0e",
    corner_radius: 5
    )
    |> Tucan.set_title("Conhecimento prévio (5 = muito informado(a))")
    |> VegaLite.to_spec()

    {:ok, push_event(socket, "draw_info_level", %{"spec" => plot})}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <div id="info_level" phx-hook="DrawInfoLevel" style="margin-top: 20px; display: flex; justify-content: center;"></div>
    </div>
    """
  end

end
