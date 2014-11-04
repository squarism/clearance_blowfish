## Description

This gem is Blowfish encryption extracted from the Clearance auth gem.  Blowfish is
not the default encryption format in Clearance but it's really fast and has no known attacks right now.  Clearance might be pulling Blowfish support out at a later date. This gem will let you keep using Blowfish.  If you are trying to switch encryption strategies then this will give you some time to do so.

If you upgrade Clearance and you are using blowfish and blowfish support has been dropped, at the very least Rails won't boot:

	config/initializers/clearance.rb:3:in `block in <top (required)>': 
	uninitialized constant Clearance::PasswordStrategies::Blowfish (NameError)

More crucially your users won't be able to log in because their passwords
are encrypted using an algorithm that clearance/rails doesn't know any more.

If you move from Clearance's Blowfish to this, your users' encrypted
passwords will be the same.

If you move to something other than Blowfish, you'll have to reset them most likely.
Passwords are most secure when they are one-way only.  So in almost every security
system you can't change your encryption algorithm after storage because you can't
get back to the plaintext.


## Blowfish

> Bruce Schneier, Blowfish's creator, is quoted in 2007 as saying "At this point, though, I'm amazed it's still being used. If people ask, I recommend Twofish instead.

Twofish isn't part of Ruby's stdlib at this point.  So it's unlikely that it would
be included in Clearance.  Blowfish is probably better than crypt but probably
not as good at bcrypt or scrypt.  Clearance has bcrypt has a good default.



## Versions

See the gemspec file for versioning details but here's a general plan:

| clearance | clearance_blowfish |
|-----------|--------------------|
| 1.x       | 1.x                |
| 2.x       | 2.x                |

Clearance 2 will likely have breaking API changes for this gem.  


##  Install

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


### LICENSE

MIT - See `LICENSE.txt`
