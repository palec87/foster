defmodule FosterWeb.Components.Info1 do
  use FosterWeb, :live_component

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <span class="font-bold font-nohemi ">
        Apoio financeiro para famílias de Acolhimento
      </span>

      <div>
        <ol type="1">
          <li style="margin-top: 20px">
            <span class="font-nohemi ">
              Subsídio mensal mínimo de 627 €, mais 15% para Crianças até aos 6 anos de idade ou com deficiência e/ou de doença crónica.
            </span>
          </li>
          <li style="margin-top: 20px">
            <span class="font-nohemi ">
              Benefícios fiscais (deduções no IRS)
            </span>
          </li>
          <li style="margin-top: 20px">
            <span class="font-nohemi ">
              Direitos laborais no acolhimento: faltas para assistência, licença parental e apoios no caso de crianças até aos 15 anos.
            </span>
          </li>
        </ol>
      </div>
    </div>
    """
  end
end
