#! /usr/bin/env ruby

require 'byebug'
require 'csv'
require 'dotenv/load'
require 'gitlab'

projects = []
results = []

puts 'Loading projects from GitLab. This might take a while...'

# per_page: 1 is to avoid timeout issues with some projects on EIPM Gitlab
Gitlab.projects(per_page: 1).auto_paginate { |p| projects << p }

puts "Final project count: #{projects.count}"
puts 'Fetching commit information. This might take a while...'

projects.each do |p|
  last_commit = Gitlab.commits(p.id)&.first
  results << {
    project_id: p.id,
    project_name: p.name,
    last_committed_name: last_commit&.committer_name,
    last_committed_date: last_commit&.committed_date
  }
end

puts 'Done fetching commit information.'
puts 'Generating csv...'

CSV.open('gitlab.csv', 'wb') do |csv|
  csv << %w[project_id project_name last_committed_name last_committed_date]

  results.each do |r|
    csv << [r[:project_id], r[:project_name], r[:last_committed_name], r[:last_committed_date]]
  end
end

puts 'Done.'
