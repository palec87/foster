defmodule FosterWeb.Components.Dashboard.Genders do
  use FosterWeb, :live_component

  @impl true
  def update(_assigns, socket) do
    genders =
      Foster.Answers.all_answers()
      |> Enum.group_by(fn answer -> get_in(answer.body, ["q8", "gender"]) end)
      |> Enum.reject(fn {groupname, _answers} -> is_nil(groupname) end)  # Filter out nil age spans
      |> Enum.map(fn {groupname, answers} -> [groupname, length(answers)]  end)

    IO.inspect(genders)

    data = genders |> Enum.map(fn [gender, count] -> %{"genero" => gender, "contagem" => count} end)

    plot = Tucan.bar(data, "genero", "contagem",
    tooltip: true,
    orient: :horizontal,
    width: :container,
    height: 150,
    y: [
        sort: "-x",   # sort categories by contagem descending
        title: ""
      ]
    )
    |> Tucan.set_title("Distribuição por género")
    |> VegaLite.to_spec()
    # add autosize so VegaLite will fit the container
    |> Map.put("autosize", %{"type" => "fit-x"})

    {:ok, push_event(socket, "draw_gender", %{"spec" => plot})}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <div id="gender" phx-hook="DrawGender" style="margin-top: 20px; display: flex; justify-content: center;"></div>
    </div>
    """
  end
end
