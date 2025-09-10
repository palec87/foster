defmodule FosterWeb.Components.Dashboard.Education do
  use FosterWeb, :live_component

  @impl true
  def update(_assigns, socket) do
    answers =
      Foster.Answers.all_answers()
      |> Enum.group_by(fn answer -> get_in(answer.body, ["q8", "education"]) end)
      |> Enum.reject(fn {groupname, _answers} -> is_nil(groupname) end)  # Filter out nil age spans
      |> Enum.map(fn {groupname, answers} -> [groupname, length(answers)]  end)

    IO.inspect(answers)

    data = answers |> Enum.map(fn [education, count] -> %{"educacao" => education, "contagem" => count} end)

    plot = Tucan.bar(data, "educacao", "contagem",
    tooltip: true,
    orient: :horizontal,
    width: 300,
    height: 150,
    y: [
        sort: "-x",   # sort categories by contagem descending
        title: ""
      ]
    )
    |> Tucan.set_title("Distribuição por educação")
    |> VegaLite.to_spec()

    {:ok, push_event(socket, "draw_education", %{"spec" => plot})}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <div id="education" phx-hook="DrawEducation" style="margin-top: 20px; display: flex; justify-content: center;"></div>
    </div>
    """
  end
end
