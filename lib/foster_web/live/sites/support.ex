defmodule FosterWeb.Sites.Support do
  use FosterWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok,
      socket
      |> assign(:url, "https://hack-foster.fly.dev/")
    }
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div class="mx-10">
      <img src="/images/kids.svg" class=" mx-auto" />
      <span class="font-bold font-nohemi ">
        Mais informações e como ajudar no
        <a href="https://www.protecaoarapariga.pt/" target="_blank" class="text-blue-600">
          AIPAR
        </a>
      </span>

      <p class="text-2xl">
        <ol class="list-decimal list-inside">
            <li><strong>Lei do Mecenato:</strong> Apoie com benefícios fiscais e impacto social.</li>
            <li><strong>Voluntariado:</strong> Doe o seu tempo e talento à nossa causa.</li>
            <li><strong>Consignação do IRS (1%) ou 0,15% do IVA suportado.</strong> NIF: <strong>501650296</strong> (Sem qualquer custo adicional para si)</li>
            <li><strong>Donativo:</strong> NIB BPI: <strong>PT50 0010 0000 61075010001 98</strong></li>
        </ol>
      </p>

      <div class="mt-4">
        <span class="font-bold font-nohemi ">
          Por favor, compartilhe com a sua rede
        </span>

        <div class="flex gap-4 flex-wrap">
          <a href={"https://www.facebook.com/sharer/sharer.php?u=#{@url}"} target="_blank" class="text-blue-600">
            Facebook
          </a>
          <a href={"https://twitter.com/intent/tweet?url=#{@url}&text=Check%20this%20out!"} target="_blank" class="text-blue-400">
            Twitter
          </a>
          <a href={"https://www.instagram.com/?url=#{@url}"} target="_blank" class="text-pink-600">
            Instagram
          </a>
          <a href={"https://www.linkedin.com/shareArticle?mini=true&url=#{@url}&title=Check%20this%20out!"} target="_blank" class="text-blue-700">
            LinkedIn
          </a>
          <a href={"https://api.whatsapp.com/send?text=#{@url}"} class="text-green-600">
            WhatsApp
          </a>
          <a href={"https://t.me/share/url?url=#{@url}&text=Check%20this%20out!"} class="text-blue-500">
            Telegram
          </a>
          <a href={"mailto:?subject=Check%20this%20out!&body=#{@url}"} class="text-gray-600">
            Email
          </a>
        </div>
      </div>
      <%!-- Feedback part --%>
      <%!-- <div class="mt-4"> --%>
      <div class="mt-10 mb-10">
        <.live_component module={FosterWeb.Components.FeedbackSubscribe} id="subscribe" />
      </div>
    </div>
    """
  end
end
