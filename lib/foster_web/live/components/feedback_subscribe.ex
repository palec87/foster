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
        {:noreply, socket
        |> put_flash(:info, "Inscrição realizada com sucesso!")
        |> push_navigate(to: "/connect")
      }
      {:error, _changeset} ->
        {:noreply, socket
        |> put_flash(:error, "Erro ao realizar inscrição")
        |> push_navigate(to: "/connect")
      }
    end
  end

  @impl true
  def handle_event("send_feedback", %{"feedback" => feedback}, socket) do
    case Foster.Feedback.create_feedback(%{body: %{"feedback" => feedback}}) do
      {:ok, _feedback} ->
        {:noreply, socket
        |> put_flash(:info, "Feedback enviado com sucesso!")
        |> push_navigate(to: "/connect")
      }
      {:error, _changeset} ->
        {:noreply, socket
        |> put_flash(:error, "Erro ao enviar feedback")
        |> push_navigate(to: "/connect")
      }
    end
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <span class="font-bold font-nohemi ">Subscreva a nossa newsletter</span>
        <form phx-submit="subscribe" phx-target={@myself}>
          <div class="h-16 grid grid-cols-3 gap-4 content-center">
            <input class="col-span-2 border rounded" type="email" name="email" placeholder="Seu email" required />
            <.button class="col-span-1" type="submit">Subscrever</.button>
          </div>
        </form>

      <span class="font-bold font-nohemi">Tem algum feedback?</span>
      <p>
      Seja técnico ou sobre o conteúdo, por favor, avise-nos e ajude a nossa causa.
      </p>

      <div class="w-full max-w-3xl mx-auto">
        <form phx-submit="send_feedback" phx-target={@myself} class="flex flex-col gap-2">
            <textarea
              class="w-full p-2 border rounded"
              name="feedback"
              placeholder="Seu feedback"
              rows="5"
            ></textarea>
            <.button type="submit" class="w-44">Enviar Feedback</.button>
        </form>
      </div>
    </div>
    """
  end

end

# required rows="6" cols="70"
