defmodule FosterWeb.Components.Question0 do
  use FosterWeb, :live_component

  @impl true
  def handle_event("update_answers", %{"question_0" => answer}, socket) do
    # Update the interactive form with the new answer
    send(self(), {:update_answers, answer})

    {:noreply, socket}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <p class="text-2xl">
      <span class="font-bold font-nohemi ">
      Sabe que em Portugal há mais de 6000 crianças e jovens a viver em instituições?

      </span>
      Descubra a importância do Acolhimento Familiar para Crianças e Jovens e como poderá ter impacto.
      </p>
      <span class="font-bold font-nohemi ">
      A participação é anónima. Demora apenas 7 minutos.
      </span>
      <p class="text-2xl text-light_dark_matter font-inter">
      Já ouviu falar de Acolhimento Familiar?
      </p>

      <.simple_form
        for={}
        phx-change="update_answers"
        phx-target={@myself}
        >
        <div class="flex items-center gap-2">
          <input type="radio" name="question_0" value="0" >
          <p class="font-nohemt">Não</p>
        </div>

        <div class="flex items-center gap-2">
          <input type="radio" name="question_0" value="1">
          <p class="font-nohemt">Sim</p>
        </div>
      </.simple_form>
    </div>
    """
  end
end
