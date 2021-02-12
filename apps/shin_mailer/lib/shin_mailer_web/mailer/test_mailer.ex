defmodule ShinMailerWeb.TestMailer do
  import Bamboo.Email
  import Bamboo.Phoenix

  use Bamboo.Phoenix, view: ShinMailerWeb.EmailView

  def sender_mail do
    "droidmaxxx@gmail.com"
  end

  def base_email do
    new_email()
    |> from({"ShinCore", sender_mail()})
    |> put_html_layout({ShinMailerWeb.LayoutView, "email.html"})
    |> put_text_layout({ShinMailerWeb.LayoutView, "email.text"})
  end

  def perform(email) do
    base_email()
    |> to(email)
    |> subject("Test Mailer")
    |> render("test_mailer.html")
    |> ShinMailerWeb.Mailer.deliver_now()
  end
end
