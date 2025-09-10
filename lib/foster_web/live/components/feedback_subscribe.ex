defmodule FosterWeb.Components.FeedbackSubscribe do
  use FosterWeb, :live_component

  @impl true
  def mount(socket) do
    {:ok,
      socket
      |> assign(:email, "")
      |> assign(:feedback, "")
    }
  end

  @impl true
  def handle_event("subscribe", %{"email" => email}, socket) do
    case Foster.Subscriptions.create_subscribe(%{email: email}) do
      {:ok, _subscribe} ->
        {:noreply, socket |> put_flash(:info, "Inscrição realizada com sucesso!") |> push_navigate(to: "/support")}
      {:error, _changeset} ->
        {:noreply, socket |> put_flash(:error, "Erro ao realizar inscrição") |> push_navigate(to: "/support")}
    end
  end

  @impl true
  def handle_event("send_feedback", %{"feedback" => feedback}, socket) do
    case Foster.Feedback.create_feedback(%{body: %{"feedback" => feedback}}) do
      {:ok, _feedback} ->
        {:noreply, socket |> put_flash(:info, "Feedback enviado com sucesso!") |> push_navigate(to: "/support")}
      {:error, _changeset} ->
        {:noreply, socket |> put_flash(:error, "Erro ao enviar feedback") |> push_navigate(to: "/support")}
    end
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <span class="font-bold font-nohemi ">Subscreva a nossa newsletter</span>
        <form phx-submit="subscribe" phx-target={@myself}>
          <div class="h-20 grid grid-cols-3 gap-4 content-center">
            <input type="email" name="email" placeholder="Seu email" required />
            <.button type="submit">Subscrever</.button>
          </div>
        </form>

      <span class="font-bold font-nohemi ">Tem algum feedback?</span>
      <p>
      Seja técnico ou sobre o conteúdo, por favor, avise-nos e ajude a nossa causa.
      </p>
      <form phx-submit="send_feedback" phx-target={@myself}>
          <textarea name="feedback" placeholder="Seu feedback" required rows="6" cols="70" class="col-span-2"></textarea>
          <div class="h-20 grid grid-cols-3 gap-4 content-center">
            <.button type="submit" class="col-span-1 row-span-1">Enviar Feedback</.button>
          </div>
      </form>
    </div>
    """
  end

end
