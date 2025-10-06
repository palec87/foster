defmodule FosterWeb.Sites.Insights do
  use FosterWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <div class="mx-10">
      <img src="/images/kids.svg" class=" mx-auto" />
      <%!-- <div class="mx-10 mt-4"> --%>
      <div>
        <div class="text-2xl font-nohemi font-bold">
          <p>Resumo das respostas</p>
          <p>recolhidas</p>
        </div>

        <div class="h-10"></div>
        <div class="text-light_dark_matter text-xl">
          As famílias de acolhimento em Portugal desempenham um papel crucial na prestação de cuidados e apoio temporário às crianças que não podem viver com os seus pais biológicos. O sistema de acolhimento português, formalmente estabelecido em 2019, ainda é relativamente recente e em evolução, com o objetivo de garantir que as crianças cresçam em ambientes familiares e não em ambientes institucionais.
        </div>
      </div>

      <div class="w-full max-w-3xl mx-auto">
        <.live_component module={FosterWeb.Components.Dashboard.HeardAbout} id="heard_about" />
        <.live_component module={FosterWeb.Components.Dashboard.InfoLevel} id="info_level" />
        <.live_component module={FosterWeb.Components.Dashboard.FosterExperience} id="experience" />
        <.live_component module={FosterWeb.Components.Dashboard.ProbFor} id="probability" />
        <.live_component module={FosterWeb.Components.Dashboard.MotivesFor} id="motives_for" />
        <.live_component module={FosterWeb.Components.Dashboard.Challenges} id="challenges" />
        <.live_component module={FosterWeb.Components.Dashboard.Enablers} id="enablers" />
        <.live_component module={FosterWeb.Components.Dashboard.Ages} id="age_spans" />
        <.live_component module={FosterWeb.Components.Dashboard.Genders} id="genders" />
        <.live_component module={FosterWeb.Components.Dashboard.Regions} id="regions" />
        <.live_component module={FosterWeb.Components.Dashboard.Education} id="education" />
        <.live_component module={FosterWeb.Components.Dashboard.Work} id="work" />
      </div>
    </div>
    """

  end
end
