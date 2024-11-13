# Rails-craft: Ruby on Rails Starter Kit

## Introduction

Rails-craft is a Ruby on Rails starter kit designed to bootstrap your new app with a modern Rails stack.

**Keep it simple**

The primary goal of Rails-craft is to offer a starter kit that accelerates the process of getting a new Rails application up and running with a modern tech stack and the base feature you need to quickly test a project.

It started as a recurring need to bootstrap new projects with a modern stack and a set of tools that I like to use. The goal of Rails-craft is to remain simple and minimalistic.

If you are looking for a feature rich template with payments, Team etc check out [Jumpstart](https://jumpstartrails.com/), [Bullet Train](https://bullettrain.co/) or [Business Class](https://businessclasskit.com/)

## Technology Stack

- **Rails 7.2**: The latest version of the Ruby on Rails framework.
- **Hotwire**: Turbo 8 with morphing capabilities.
- **Tailwind CSS**: A utility-first CSS framework for rapid UI development.
- **DaisyUI**: A Tailwind CSS component library for styling and theming.
- **Authentication**: Implemented with Authentication-zero.

## Development Tools

- **Standard**: Code style enforcement for Ruby and JavaScript.
- **ERB Lint**: Linter for ERB templates.
- **Livereload**: Enables live reloading of web pages as you code.
- **Minitest**: A fast, easy-to-use testing framework for Ruby.
- **Github Actions**: Continuous integration

![Screenshots](https://raw.githubusercontent.com/daniel-ansari/rails-craft/refs/heads/main/app/assets/images/screenshots/01.png)

![Screenshots](https://raw.githubusercontent.com/daniel-ansari/rails-craft/refs/heads/main/app/assets/images/screenshots/02.png)

## Generators

This starter kit includes custom generators that use the built-in components, streamlining the development process.

## Usage

To use this template for your project, follow these steps:

1. **Clone the Repository**

   ```sh
   git clone git@github.com:daniel-ansari/rails-craft.git myapp
   cd myapp
   ```

2. **Rename the Origin Remote**

   ```sh
   git remote rename origin rails-craft
   ```

3. **Add Your Repository**

   ```sh
   git remote add origin git@github.com:your-account/your-repo.git
   # Replace with your new Git repository URL
   ```

4. **Rename the Application**

   Look for Rails Craft, RailsCraft and rails_craft and replace with your app name (e.g. Myapp)

## Initial Setup

Run `bin/setup` to install Ruby and JavaScript dependencies and setup your database.

```bash
bin/setup
```

## Running the Application

To run the application, use the `bin/dev` script.

```bash
bin/dev
```

## Merging Updates

To merge changes, merge from the `rails-craft` remote.

```bash
git fetch rails-craft
git merge rails-craft/main
```

## License

Rails-craft is released under the [MIT License](https://opensource.org/licenses/MIT).

## Contributing

Bug reports and pull requests are welcome on GitHub at [github.com/daniel-ansari/rails-craft](https://github.com/daniel-ansari/rails-craft)