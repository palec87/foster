defmodule FosterWeb.Components.Info2 do
  use FosterWeb, :live_component

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <span class="font-bold font-nohemi ">
        As Verdades sobre o Acolhimento Familiar
      </span>

      <div>
        <ul>
          <li style="margin-top: 20px">
            <span class="font-nohemi ">
              Qualquer pessoa ou casal pode ser Família de Acolhimento, independentemente do estado civil, orientação sexual, religião, nacionalidade, raça, etnia, idade, situação económica, formação académica ou profissional.
            </span>
          </li>
          <li style="margin-top: 20px">
            <span class="font-nohemi ">
              A única exigência é ter 25 anos e residir em Portugal.
            </span>
          </li>
          <li style="margin-top: 20px">
            <span class="font-nohemi ">
            Família de Acolhimento tem a possibilidade de continuar a acompanhar a trajetória futura da criança que acolheu.
            </span>
          </li>
          <li style="margin-top: 20px">
            <span class="font-nohemi ">
              Conseguir um vínculo forte no curto prazo com a criança é muito melhor do que a falta de vínculo na instituição.
            </span>
          </li>
        </ul>
      </div>
    </div>
    """
  end
end
