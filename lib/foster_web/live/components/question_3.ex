defmodule FosterWeb.Components.Question3 do
  use FosterWeb, :live_component

  @impl true
  def handle_event("update_answers", %{"question_3" => answer}, socket) do
    # Update the interactive form with the new answer
    send(self(), {:update_answers, answer})

    {:noreply, socket}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <p class="text-2xl text-light_dark_matter font-inter">
        Alguma vez foi família de acolhimento ou conhece alguém que o é/foi?
      </p>

      <.simple_form
        for={}
        phx-change="update_answers"
        phx-target={@myself}
        >
        <div class="flex items-center gap-2">
          <input type="radio" name="question_3" value="Já acolhi" >
          <p class="font-nohemt">Já fui/sou família de acolhimento</p>
        </div>

        <div class="flex items-center gap-2">
          <input type="radio" name="question_3" value="Conheço alguém">
          <p class="font-nohemt">Conheço alguém que foi/é</p>
        </div>
        <div class="flex items-center gap-2">
          <input type="radio" name="question_3" value="Não">
          <p class="font-nohemt">Não</p>
        </div>
      </.simple_form>
    </div>
    """
  end
end
