defmodule FosterWeb.Components.Info3 do
  use FosterWeb, :live_component

  @impl true
  def mount(socket) do
    data = [
      %{"País" => "Bélgica", "%" => 58, "group" => "EU"},
      %{"País" => "Bulgária", "%" => 65, "group" => "EU"},
      %{"País" => "Croácia", "%" => 62, "group" => "EU"},
      %{"País" => "Chipre", "%" => 35, "group" => "EU"},
      %{"País" => "Chequia", "%" => 72, "group" => "EU"},
      %{"País" => "Dinamarca", "%" => 66, "group" => "EU"},
      %{"País" => "Estónia", "%" => 83, "group" => "EU"},
      %{"País" => "Finlândia", "%" => 52, "group" => "EU"},
      %{"País" => "França", "%" => 54, "group" => "EU"},
      %{"País" => "Alemanha", "%" => 47, "group" => "EU"},
      %{"País" => "Grécia", "%" => 16, "group" => "EU"},
      %{"País" => "Hungria", "%" => 70, "group" => "EU"},
      %{"País" => "Irlanda", "%" => 91, "group" => "EU"},
      %{"País" => "Itália", "%" => 52, "group" => "EU"},
      %{"País" => "Letónia", "%" => 74, "group" => "EU"},
      %{"País" => "Lituânia", "%" => 47, "group" => "EU"},
      %{"País" => "Luxemburgo", "%" => 43, "group" => "EU"},
      %{"País" => "Malta", "%" => 95, "group" => "EU"},
      %{"País" => "Países Baixos", "%" => 52, "group" => "EU"},
      %{"País" => "Polónia", "%" => 58, "group" => "EU"},
      %{"País" => "PORTUGAL", "%" => 2, "group" => "PT"},
      %{"País" => "Roménia", "%" => 62, "group" => "EU"},
      %{"País" => "Eslováquia", "%" => 62, "group" => "EU"},
      %{"País" => "Eslovénia", "%" => 58, "group" => "EU"},
      %{"País" => "Espanha", "%" => 48, "group" => "EU"},
      %{"País" => "Suécia", "%" => 74, "group" => "EU"},
      %{"País" => "Reino Unido", "%" => 74, "group" => "EU"}
    ]

    plot = Tucan.bar(data, "País", "%",
    orient: :horizontal,
    color_by: "group",
    corner_radius: 3,
    y: [
      sort: "-x",
      title: "",
      # axis: [
      #   labelExpr: "datum.value == 'Portugal' ? '#9467bd' : 'black'"
      # ]
    ],
    tooltip: true,
    width: :container,
    height: 400)
    |> Tucan.Legend.set_enabled(:color, false)
    |> Tucan.set_title("Taxas de cuidados baseados na família na Europa", anchor: :middle, offset: 15)
    |> VegaLite.to_spec()
    |> Map.put("autosize", %{"type" => "fit-x"})

    {:ok, push_event(socket, "draw_eu_stats", %{"spec" => plot})}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <span class="font-nohemi ">
      Portugal está em último lugar na Europa. Vamos fazer melhor?
      </span>

      <div style="margin-top: 20px" id="eu_numbers" phx-hook="DrawEUnumbers"></div>
    </div>
    """
  end
end
