# Writing Reviewer

[![Build Status](https://www.travis-ci.org/ezwang/writing-reviewer.svg?branch=master)](https://www.travis-ci.org/ezwang/writing-reviewer)

An essay reviewer application similar to the [Penn Reviewer](https://apps.sas.upenn.edu/sso/writing/cw/ng/dashboard) application used to peer review essays in writing seminar classes.

## Setup

```bash
bundle install
rails db:migrate
rails server
```

To load test data, run `rails db:fixtures:load`.

## Environment Variables
- `RAILS_ENV`: Should be `production` in production, or `development` or not set otherwise.
- `DATABASE_URL`: Specifies the location of the database. Uses sqlite by default if not specified.
- `SENDGRID_USERNAME`: Sendgrid username used to send password reset emails.
- `SENDGRID_PASSWORD`: Sendgrid password used to send password reset emails.
- `S3_BUCKET_NAME`, `AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY`, `AWS_REGION`: Used to store essays. Uses filesystem by default if not set. Should be set when using a service like Heroku because of [ephemeral filesystems](https://devcenter.heroku.com/articles/dynos#ephemeral-filesystem).
