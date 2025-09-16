defmodule FosterWeb.Sites.PrivacyPolicy do
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
      <span class="font-bold font-nohemi">Política de Privacidade</span>
      <p>Data de Vigência: 16 de setembro de 2025</p>
      <p>Esta Política de Privacidade descreve como a Foster ("nós", "nos" ou "nosso") coleta, utiliza e protege suas informações quando você usa nossa aplicação.</p>

      <span class="font-bold font-nohemi">Informações que coletamos</span>
      <ul>
        <li>Feedback e respostas enviadas através da aplicação</li>
        <li>Email em caso de subscrição</li>
      </ul>

      <span class="font-bold font-nohemi">Como usamos esses informações</span>
      <ul>
        <li>Para fornecer e melhorar nossos serviços</li>
        <li>Para comunicar com você sobre sua conta ou feedback</li>
      </ul>

      <span class="font-bold font-nohemi">Armazenamento e Proteção de Dados</span>
      <ul>
        <li>Os dados são armazenados de forma segura utilizando práticas padrão do setor</li>
        <li>O acesso aos dados é restrito apenas a pessoal autorizado</li>
      </ul>

      <span class="font-bold font-nohemi">Serviços de Terceiros</span>
      <ul>
        <li>Não realizamos análise ou rastreamento do comportamento dos utilizadores</li>
      </ul>

      <span class="font-bold font-nohemi">Direitos do Utilizador</span>
      <ul>
        <li>Você pode solicitar acesso, correção ou exclusão dos seus dados pessoais</li>
        <li>Entre em contato conosco pelo email ddthumb[at]gmail.com para solicitações relacionadas à privacidade</li>
      </ul>

      <span class="font-bold font-nohemi">Alterações nesta Política</span>
      <p>Podemos atualizar esta Política de Privacidade de tempos em tempos. As alterações serão publicadas neste arquivo com a data de vigência atualizada.</p>

      <span class="font-bold font-nohemi">Contato</span>
      <p>Para perguntas ou dúvidas sobre esta Política de Privacidade, entre em contato conosco pelo email ddthumb[at]gmail.com.</p>
    </div>
    """
  end
end
