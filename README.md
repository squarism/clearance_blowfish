== Description

This gem is Blowfish encryption extracted from the Clearance auth gem.  Blowfish is probably
not a great security choice but it's really fast and has no known attacks right now.
I like Blowfish but Clearance might be pulling Blowfish support out at a later date.

If you upgrade then your users won't be able to log in because their passwords
are encrypted one-way.  This gem will let you keep using Blowfish.  If you are trying
to switch encryption strategies then this will give you some time to do so.

If you move from Clearance's Blowfish to this, your users' passwords will be the same.
If you move to something other than Blowfish, you'll have to reset them most likely.
Passwords are most secure when they are one-way only so in almost every security
system you can't change your encryption algorithm after storage.

Yay security!  Boo convenience!  :cake:

== Versions

See the gemspec file for versioning details but here's a general plan:

  | clearance | clearance_blowfish |
  | 1.x       | 1.x                |
  | 2.x       | 2.x                |
  | future    | unmaintained       |

Clearance 2 will likely have breaking API changes for this gem.  After that point,
this gem will go away.


== Install

Add it to your `Gemfile`.

  gem 'clearance_blowfish', '~> 1.0'

You might already have clearance in your `Gemfile`:

  gem 'clearance', '~> 1.5.0'

Run `bundle`

In your `config/initializers/clearance.rb` file:

  Clearance.configure do |config|
    ...
    config.password_strategy = Clearance::PasswordStrategies::Blowfish
  end


== LICENSE

MIT
