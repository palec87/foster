defmodule FosterWeb.Components.Question2 do
  use FosterWeb, :live_component

  @impl true
  def handle_event("update_answers", %{"question_2" => answer}, socket) do
    # Update the interactive form with the new answer
    send(self(), {:update_answers, answer})

    {:noreply, socket}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <p class="text-2xl text-light_dark_matter font-inter">
        Quão bem informado(a) se considera sobre o que é o Acolhimento Familiar?
      </p>

      <.simple_form
        for={}
        phx-change="update_answers"
        phx-target={@myself}>

        <div class="flex items-center gap-2">
          <input type="radio" name="question_2" value="1" >
          <p class="font-nohemt">1 - Nada informado(a)</p>
        </div>

        <div class="flex items-center gap-2">
          <input type="radio" name="question_2" value="2" >
          <p class="font-nohemt">2 - Pouco informado(a)</p>
        </div>

        <div class="flex items-center gap-2">
          <input type="radio" name="question_2" value="3" >
          <p class="font-nohemt">3 - Moderadamente informado(a)</p>
        </div>

        <div class="flex items-center gap-2">
          <input type="radio" name="question_2" value="4" >
          <p class="font-nohemt">4 - Bem informado(a)</p>
        </div>

        <div class="flex items-center gap-2">
          <input type="radio" name="question_2" value="5">
          <p class="font-nohemt">5 - Muito informado(a)</p>
        </div>

      </.simple_form>
    </div>
    """
  end
end
