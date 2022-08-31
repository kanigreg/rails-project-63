![CI](https://github.com/kanigreg/rails-project-63/actions/workflows/main.yml/badge.svg)
![HexletCheck](https://github.com/kanigreg/rails-project-63/actions/workflows/hexlet-check.yml/badge.svg)

# HexletCode

Form generator

## Usage

```ruby
User = Struct.new(:name, :job, :age keyword_init: true)

user = User.new name: 'rob', job: 'hexlet', age: 25

HexletCode.form_for user, url: '#' do |f|
  f.input :name, class: 'user-input'
  f.input :job, as: text, rows: 50, cols: 50
  f.submit
end

# <form action="#" method="post">
#   <input type="text" class="user-input" name="name" value="rob">
#   <textarea cols="50" rows="50" name="job">hexlet</textarea>
# </form>
```
