defmodule LearnPhoenixWeb.Gettext do
  @moduledoc """
  A module providing Internationalization with a gettext-based API.

  By using [Gettext](https://hexdocs.pm/gettext),
  your module gains a set of macros for translations, for example:

      import LearnPhoenixWeb.Gettext

      # Simple translation
      gettext("Here is the string to translate")

      # Plural translation
      ngettext("Here is the string to translate",
               "Here are the strings to translate",
               3)

      # Domain-based translation
      dgettext("errors", "Here is the error message to translate")

  See the [Gettext Docs](https://hexdocs.pm/gettext) for detailed usage.
  """

  # use Gettext, otp_app: :learn_phoenix
  # defining a Gettext backend by calling

  #     use Gettext, otp_app: ...

  # is deprecated. To define a backend, call:

  #     use Gettext.Backend, otp_app: :my_app

  # Then, instead of importing your backend, call this in your module:

  #     use Gettext, backend: MyApp.Gettext

  use Gettext.Backend, otp_app: :learn_phoenix
end
