defmodule FosterWeb.InteractiveForm do
  use FosterWeb, :live_view

  alias FosterWeb.Sites.BaseQuestion

  @impl true
  def mount(_params, _session, socket) do
    pages = %{1 => :q0,
              2 => :q1,
              3 => :q2,
              4 => :q3,
              5 => :q4,
              6 => :q5,
              7 => :q6,
              8 => :q7,
              9 => :q8}

    {:ok,
      socket
      |> assign(:answers, %{})
      |> assign(:pages, pages)
      |> assign(:current_page, 1)
      |> assign(:step, 1)
    }
  end


  @impl true
  def handle_event("next_page", _params, socket) do
    # logic to skip q1 if q0 is answered with 0 ie no_knolwedge
    # this is fishy, because of the info pages
    step = if socket.assigns.pages[socket.assigns.current_page] == :q0 and
              socket.assigns.answers[:q0] == "0" do
      2
    else
      1
    end

    {:noreply,
      socket
      |> assign(:step, step)
      |> assign(:current_page, min(map_size(socket.assigns.pages), socket.assigns.current_page + step))
      # |> IO.inspect(label: "Handle event next page")
    }
  end


  @impl true
  def handle_event("previous_page", _params, socket) do
    {:noreply,
      socket
      |> assign(:current_page, max(1, socket.assigns.current_page - socket.assigns.step))
      # |> IO.inspect(label: "Page #{socket.assigns.current_page}")
    }
  end

  @impl true
  def handle_event("submit_answers", _params, socket) do
    case Foster.Answers.create_answer(%{body: socket.assigns.answers}) do
      {:ok, _answer} ->
        {:noreply, socket |> put_flash(:info, "Respostas enviadas com sucesso!") |> push_navigate(to: "/connect")}
      {:error, _changeset} ->
        {:noreply, socket |> put_flash(:error, "Erro ao enviar respostas") |> push_navigate(to: "/connect")}
    end
  end


  @impl true
  def handle_info({:update_answers, answer}, socket) do
    updated_answers = Map.put(socket.assigns.answers,
                              socket.assigns.pages[socket.assigns.current_page],
                              answer)

    {:noreply,
      socket
      |> assign(:answers, updated_answers)
    }
  end

  @impl true
  def render(assigns) do
    assigns = assign(assigns, :page, assigns.pages[assigns.current_page])

    ~H"""
    <div class="mx-10 space-y-8">
      <div class="space-y-3 text-center">
        <img src="/images/somekids.svg" class="mx-auto" />
        <p class="text-3xl font-bold font-nohemi text-light_dark_matter">Questionario</p>
        <p class="text-xl">A participacao e anonima. Demora apenas 7 minutos.</p>
      </div>

      <div>
        <.live_component module={BaseQuestion} id={@current_page} current_page={@page} />
      </div>

      <div class="grid grid-cols-1 gap-4 sm:grid-cols-3 sm:items-center">
        <div class="flex justify-center sm:justify-start">
          <%= if @page != :q0 do %>
            <form phx-submit="previous_page">
              <.button type="submit">Anterior</.button>
            </form>
          <% end %>
        </div>

        <div class="flex justify-center">
          <a href="/learn-more" class="rounded border px-4 py-2 font-nohemi hover:bg-gray-50 transition-colors">
            Ver factos
          </a>
        </div>

        <div class="flex justify-center sm:justify-end">
          <%= if @page != :q8 do %>
            <form phx-submit="next_page">
              <.button type="submit">Seguinte</.button>
            </form>
          <% else %>
            <form phx-submit="submit_answers">
              <.button type="submit">Enviar Respostas</.button>
            </form>
          <% end %>
        </div>
      </div>
    </div>
    """
  end
end
