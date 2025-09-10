defmodule FosterWeb.Components.Question4 do
  use FosterWeb, :live_component
  # require Logger

  @impl true
  def handle_event("update_answers", %{"question_4" => answer}, socket) do
    # Update the interactive form with the new answer
    send(self(), {:update_answers, answer})

    {:noreply, socket}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <p class="text-2xl text-light_dark_matter font-inter">
        Qual é a probabilidade de vir a ser uma Família de Acolhimento?
      </p>

      <.simple_form
        for={}
        phx-change="update_answers"
        phx-target={@myself}>

        <div class="flex items-center gap-2">
          <input type="radio" name="question_4" value="1" >
          <p class="font-nohemt">1 - Improvável</p>
        </div>

        <div class="flex items-center gap-2">
          <input type="radio" name="question_4" value="2" >
          <p class="font-nohemt">2 - Pouco provável</p>
        </div>

        <div class="flex items-center gap-2">
          <input type="radio" name="question_4" value="3" >
          <p class="font-nohemt">3 - Eventualmente</p>
        </div>

        <div class="flex items-center gap-2">
          <input type="radio" name="question_4" value="4" >
          <p class="font-nohemt">4 - Algo provável</p>
        </div>

        <div class="flex items-center gap-2">
          <input type="radio" name="question_4" value="5">
          <p class="font-nohemt">5 - Muito provável</p>
        </div>

      </.simple_form>
    </div>
    """
  end
end
