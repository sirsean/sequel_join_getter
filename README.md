# About

Sequel plugin that gives you a getter for every field on your model object, whether it actually belongs to the underlying database table or not.

# Install

Install it as any other gem:

```gem install sequel_join_getter```

Or do it with the Rakefile:

```
rake gem:build
rake gem:install
```

# Run the tests

```rake spec```

# Quick Start

Say you have two classes (tables), which you'll occasionally join together. Sometimes you'll want to select fields from the table that you're joining against, like so:

```sql
select a.foo, b.bar
from table_a a
join table_b b on b.id=a.b_id
where a.id=1
```

Normally, you'd have Sequel::Model classes that look like so:

```ruby
class A < Sequel::Model(:table_a)
end

class B < Sequel::Model(:table_b)
end
```

And if you joined like this:

```ruby
a = A.select(:table_a__foo, :table_b__bar).join(B, [[:id, :b_id]]).where(:table_a__id => 1)
```

You could get "foo", but not "bar".

```ruby
a.foo # <= This works
a.bar # <= This throws a NoMethodError!!!
```

But if you include the plugin, like so:

```ruby
require "sequel_join_getter"

class A < Sequel::Model(:table_a)
    plugin :join_getter
end
```

You can do the same join, and it'll work:

```ruby
a = A.select(:table_a__foo, :table_b__bar).join(B, [[:id, :b_id]]).where(:table_a__id => 1)

a.foo # <= This works
a.bar # <= This works too!
```

##License

See the LICENSE file. Licensed under the Apache 2.0 License.
