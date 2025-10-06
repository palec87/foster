defmodule FosterWeb.Components.Dashboard.Ages do
  use FosterWeb, :live_component

  @impl true
  def update(_assigns, socket) do
    spans =
      Foster.Answers.all_answers()
      |> Enum.group_by(fn answer -> get_in(answer.body, ["q8", "agespan"]) end)
      |> Enum.reject(fn {groupname, _answers} -> is_nil(groupname) end)  # Filter out nil age spans
      |> Enum.map(fn {groupname, answers} -> [groupname, length(answers)]  end)

    # Convert to data format suitable for Tucan
    data = spans |> Enum.map(fn [age, count] -> %{"idade" => age, "contagem" => count} end)

    plot = Tucan.bar(data, "idade", "contagem",
    tooltip: true,
    orient: :horizontal,
    width: :container,
    height: 150,
    y: [title: ""]
    )
    |> Tucan.set_title("Faixa etária dos participantes")
    |> VegaLite.to_spec()
    # add autosize so VegaLite will fit the container
    |> Map.put("autosize", %{"type" => "fit-x"})

    {:ok, push_event(socket, "draw_ages", %{"spec" => plot})}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <%!-- <span class="font-nohemi ">
        Portugal está em último lugar na Europa. Vamos fazer melhor?
      </span> --%>
      <div id="ages" phx-hook="DrawAges" style="margin-top: 20px; display: flex; justify-content: center;"></div>
    </div>
    """
  end
end
