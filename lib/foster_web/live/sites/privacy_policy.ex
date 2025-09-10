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
    <div>
        <span class="font-bold font-nohemi mx-10">Privacy Policy</span>
      <p>Effective Date: September 3, 2025</p>
      <p>This Privacy Policy describes how Foster ("we", "us", or "our") collects, uses, and protects your information when you use our application.</p>

      <span class="font-bold font-nohemi mx-10">Information we collect</span>
      <ul>
        <li>Personal information you provide (such as name, email, etc.)</li>
        <li>Feedback and answers submitted through the app</li>
      </ul>

      <span class="font-bold font-nohemi mx-10">How We Use Your Information</span>
      <ul>
        <li>To provide and improve our services</li>
        <li>To communicate with you about your account or feedback</li>
        <li>For analytics and research purposes</li>
      </ul>

      <span class="font-bold font-nohemi mx-10">Data Storage and Protection</span>
      <ul>
        <li>Data is stored securely using industry-standard practices</li>
        <li>Access to data is restricted to authorized personnel only</li>
      </ul>

      <span class="font-bold font-nohemi mx-10">Third-Party Services</span>
      <ul>
        <li>We may use third-party services for hosting, or communication</li>
        <li>We do not do any analytics or tracking of user behavior</li>
      </ul>

      <span class="font-bold font-nohemi mx-10">User Rights</span>
      <ul>
        <li>You may request access to, correction, or deletion of your personal data</li>
        <li>Contact us at [ddthumb[at]gmail.com] for privacy-related requests</li>
      </ul>

      <span class="font-bold font-nohemi mx-10">Changes to This Policy</span>
      <p>We may update this Privacy Policy from time to time. Changes will be posted in this file with the updated effective date.</p>

      <span class="font-bold font-nohemi mx-10">Contact</span>
      <p>For questions or concerns about this Privacy Policy, contact us at [ddthumb[at]gmail.com].</p>
    </div>
    """
  end
end
