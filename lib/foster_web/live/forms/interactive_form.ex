defmodule FosterWeb.InteractiveForm do
  use FosterWeb, :live_view

  alias FosterWeb.Sites.BaseQuestion
  alias FosterWeb.Sites.BaseInfopage

  @impl true
  def mount(_params, _session, socket) do
    pages = %{1 => :q0,
              2 => :q1,
              3 => :q2,
              4 => :i0,
              5 => :q3,
              6 => :i1,
              7 => :q4,
              8 => :q5,
              9 => :i2,
              10 => :q6,
              11 => :i3,
              12 => :q7,
              13 => :q8,
            }
    {:ok,
      socket
      |> assign(:answers, %{})
      |> assign(:pages, pages)
      |> assign(:current_page, 1)
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
  def handle_info({:update_answers, answer}, socket) do
    updated_answers = Map.put(socket.assigns.answers,
                              socket.assigns.pages[socket.assigns.current_page],
                              answer)
    IO.inspect(updated_answers, label: "Answers")
    {:noreply,
      socket
      |> assign(:answers, updated_answers)
    }
  end

  defp get_image_source(page) when is_atom(page) do
    case Atom.to_string(page) do
      "i" <> _ -> "/images/bulb-icon.svg"
      "endpage" -> "/images/somekids.svg"
      _ -> "/images/somekids.svg"
    end
  end

  defp is_info_page(page) when is_atom(page) do
    case Atom.to_string(page) do
      "i" <> _ -> true
      _ -> false
    end
  end

  @impl true
  def handle_event("submit_answers", _params, socket) do
    case Foster.Answers.create_answer(%{body: socket.assigns.answers}) do
      {:ok, _answer} ->
        {:noreply, socket |> put_flash(:info, "Respostas enviadas com sucesso!") |> push_navigate(to: "/support")}
      {:error, _changeset} ->
        {:noreply, socket |> put_flash(:error, "Erro ao enviar respostas") |> push_navigate(to: "/support")}
    end
  end

  @impl true
  def render(assigns) do
    assigns =
      assigns
      |> assign(:page, assigns.pages[assigns.current_page])
      |> assign(:image_source, get_image_source(assigns.pages[assigns.current_page]))
    ~H"""
    <div>
      <div class="mx-10">
        <div class="mb-4">
          <img src={@image_source} />
        </div>
        <div>
          <%= if is_info_page(@page) do %>
            <.live_component module={BaseInfopage} id={@current_page} current_page={@page} />
          <% else %>
            <.live_component module={BaseQuestion} id={@current_page} current_page={@page} />
            <% end %>
        </div>

        <%= if @page != :endpage do %>
          <div class="h-56 grid grid-cols-3 gap-4 content-center">
            <%= if @page != :q0 do %>
              <form phx-submit="previous_page">
                <.button type="submit">Anterior</.button>
              </form>
            <% end %>
            <%= if @page != :q8 do %>
              <form phx-submit="next_page">
                <.button type="submit">Seguinte</.button>
              </form>
            <% end %>
            <%= if @page == :q8 do %>
              <form phx-submit="submit_answers">
                <.button type="submit">Enviar Respostas</.button>
              </form>
            <% end %>
          </div>
        <% end %>
      </div>
    </div>
    """
  end
end
