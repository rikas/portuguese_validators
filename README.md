# PortugueseValidators

This is a simple gem to validate NIB, NIF, BI and phone numbers.

## Installation

Add this line to your application's Gemfile:

```console
$ gem 'portuguese_validators'
```

And then execute:

```console
$ bundle
```

Or install it yourself as:

```console
$ gem install portuguese_validators
```

## Usage

You will have to include `PortugueseValidators` and then just add the validators to your model:

```ruby
class MyModel < ActiveRecord::Base
  validates :nif, portuguese_nif: true
  validates :nib, portuguese_nib: true
  validates :bi, portuguese_bi: true
  validates :phone, portuguese_phone: true
end
```

Note that these validators are just like the ones that Rails provide you so you can customize the error message or add an `:if` condition and all that. For example:

```ruby
class MyModel < ActiveRecord::Base
  validates :bi, portuguese_bi: { message: 'é inválido' }, if: :user_pt?
end
```

## Contributing

1. Fork it ( http://github.com/rikas/portuguese_validators/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
