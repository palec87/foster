defmodule FosterWeb.Sites.Home do
  use FosterWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div class="mx-10 space-y-10">
      <section class="space-y-4 text-center">
        <img src="/images/kids.svg" class="mx-auto" />
        <p class="text-3xl font-bold font-nohemi text-light_dark_matter">
          Sabe que em Portugal há mais de 6000 criancas e jovens a viver em instituicoes?
        </p>
        <p class="text-xl">
          Explore o acolhimento familiar com um percurso mais claro: responda ao questionario,
          conheca factos relevantes, veja como apoiar a AIPAR e mantenha-se ligado ao projeto.
        </p>
      </section>

      <section class="grid gap-4 md:grid-cols-2">
        <a href="/questionnaire" class="rounded border p-6 hover:bg-gray-50 transition-colors">
          <p class="text-2xl font-bold font-nohemi">Questionario</p>
          <p class="mt-2">Participe anonimamente e partilhe a sua perspetiva em poucos minutos.</p>
        </a>

        <a href="/learn-more" class="rounded border p-6 hover:bg-gray-50 transition-colors">
          <p class="text-2xl font-bold font-nohemi">Factos e contexto</p>
          <p class="mt-2">Leia dados e explicacoes sobre acolhimento familiar em Portugal.</p>
        </a>

        <a href="/support" class="rounded border p-6 hover:bg-gray-50 transition-colors">
          <p class="text-2xl font-bold font-nohemi">Apoiar a AIPAR</p>
          <p class="mt-2">Veja formas concretas de contribuir, doar e partilhar a causa.</p>
        </a>

        <a href="/connect" class="rounded border p-6 hover:bg-gray-50 transition-colors">
          <p class="text-2xl font-bold font-nohemi">Ligar-se ao projeto</p>
          <p class="mt-2">Subscreva a newsletter e envie feedback para melhorar a iniciativa.</p>
        </a>
      </section>
    </div>
    """
  end
end
