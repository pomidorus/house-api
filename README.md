# House API

## Staging
https://house-api-test.herokuapp.com/

heroku run --app house-api-test rake db:migrate


## API Endpoints

- POST /hpi

`{date:, region_name:, index:'}`

- GET /hpi

- GET /hpi/count

- GET /regions

- GET /region params :name

- GET /region/year params :region_name, :year
