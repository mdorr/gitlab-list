# Gitlab list tool

This script queries a GitLab instance, gets all projects as well as the last commit for each project. The results will be stored in a CSV file with the project id, project name, as well as the date of the last commit as well as the name of the last committer.

## Requirements

- [ruby 2.6.3](https://www.ruby-lang.org/en/news/2019/04/17/ruby-2-6-3-released/) or higher
- [bundler](https://bundler.io/) 1.17.3 or higher

## Usage

Working for the `.env.sample` file included, create a new `.env` file and fill out all variables. Install all dependencies via `bundle install`. Run the script via `./start.rb`. Note that the output will **overwrite** `gitlab.csv` if it is already present.

## Further development

This script can be modified for different queries. Refer to the [narkoz/gitlab](https://narkoz.github.io/gitlab/) documentation to see which features are available in the library we use.
