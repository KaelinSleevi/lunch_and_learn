# Lunch and Learn
* Created during a 5 day sprint, this rails back-end API allows a front-end application to find recipes from a country, as well as videos and images specific to each country. Additionally, it has the capability to add and retrieve favorite recipes from each country for each user.

## Built With
------------------
![Ruby on Rails](https://img.shields.io/badge/Ruby_on_Rails-CC0000?style=for-the-badge&logo=ruby-on-rails&logoColor=white)

### Versions
* Rails 5.2.8
* Ruby 2.7.4


## Setup/Install
-----------------
* Fork this repository
* Clone your fork
* From the command line, install gems and set up your DB:
    * `bundle`
    * `rails db:{create,migrate,seed}`

## API's
---------
* Some of the APIs consumed for this project require you to have API keys. Here are the links to each API used:
  * <a href="https://developer.edamam.com/edamam-recipe-api">Edamam</a>
  * <a href="https://restcountries.com/#api-endpoints-v3-all">Rest Countries</a>
  * <a href="https://developers.google.com/youtube/v3/docs/search/list">Youtube: Search Lists</a>
  * <a href="https://unsplash.com/documentation">Unsplash</a>

## Endpoints
-------------
* Below are the endpoints in the requests and example responses for each endpoint.

*  GET Recipes For A Particular Country
  * Request:

  ```
     GET /api/v1/recipes?country=thailand
     Content-Type: application/json
     Accept: application/json
  ```

  * Response:
  
  ```
  {
    "data": [
        {
            "id": null,
            "type": "recipe",
            "attributes": {
                "title": "Andy Ricker's Naam Cheuam Naam Taan Piip (Palm Sugar Simple Syrup)",
                "url": "https://www.seriouseats.com/recipes/2013/11/andy-rickers-naam-cheuam-naam-taan-piip-palm-sugar-simple-syrup.html",
                "country": "thailand",
                "image": "https://edamam-product-images.s3.amazonaws.com..."
            }
        },
        {
            "id": null,
            "type": "recipe",
            "attributes": {
                "title": "Sriracha",
                "url": "http://www.jamieoliver.com/recipes/vegetables-recipes/sriracha/",
                "country": "thailand",
                "image": "https://edamam-product-images.s3.amazonaws.com/."
            }
        },
        {...},
        {...},
        {...},
        {etc},
      ]
    }
    ```
* GET Learning Resources for a Particular Country
  * Request:

  ```
  GET /api/v1/learning_resources?country=laos
  Content-Type: application/json
  Accept: application/json
  ```

  * Response:

  ```
  {
    "data": {
        "id": null,
        "type": "learning_resource",
        "attributes": {
            "country": "laos",
            "video": {
                "title": "A Super Quick History of Laos",
                "youtube_video_id": "uw8hjVqxMXw"
            },
            "images": [
                {
                    "alt_tag": "standing statue and temples landmark during daytime",
                    "url": "https://images.unsplash.com/photo-1528181304800-259b08848526?ixid=MnwzNzg2NzV8MHwxfHNlYXJjaHwxfHx0aGFpbGFuZHxlbnwwfHx8fDE2Njc4Njk1NTA&ixlib=rb-4.0.3"
                },
                {
                    "alt_tag": "five brown wooden boats",
                    "url": "https://images.unsplash.com/photo-1552465011-b4e21bf6e79a?ixid=MnwzNzg2NzV8MHwxfHNlYXJjaHwyfHx0aGFpbGFuZHxlbnwwfHx8fDE2Njc4Njk1NTA&ixlib=rb-4.0.3"
                },
                {
                    "alt_tag": "orange temples during daytime",
                    "url": "https://images.unsplash.com/photo-1563492065599-3520f775eeed?ixid=MnwzNzg2NzV8MHwxfHNlYXJjaHwzfHx0aGFpbGFuZHxlbnwwfHx8fDE2Njc4Njk1NTA&ixlib=rb-4.0.3"
                },
                {...},
                {...},
                {...},
                {etc},
              ]
        }
    }
  }
  ```

  
* POST User Registration
  * Request:

   ```
    POST /api/v1/users
    Content-Type: application/json
    Accept: application/json

    {
      "name": "Athena Dao",
      "email": "athenadao@bestgirlever.com"
    }
   ```


  * Response:

   ```
    {
    "data": {
    "type": "user",
    "id": "1",
      "attributes": {
        "name": "Athena Dao",
        "email": "athenadao@bestgirlever.com",
        "api_key": "jgn983hy48thw9begh98h4539h4"
        }
      }
    }
   ```
  
* POST Add Favorites
  * Request:

   ```
    POST /api/v1/favorites
    Content-Type: application/json
    Accept: application/json

    {
      "api_key": "jgn983hy48thw9begh98h4539h4",
      "country": "thailand",
      "recipe_link": "https://www.tastingtable.com/.....",
      "recipe_title": "Crab Fried Rice (Khaao Pad Bpu)"
    }
   ```

  * Response:

   ```
    {
      "success": "Favorite added successfully"
    }
   ```
  
* GET a User’s Favorites
  * Request:

   ```
    GET /api/v1/favorites
    Content-Type: application/json
    Accept: application/json

    {
      "api_key": "jgn983hy48thw9begh98h4539h4"
    }
   ```

  * Response:

   ```
    {
    "data": [
        {
            "id": "1",
            "type": "favorite",
            "attributes": {
                "recipe_title": "Recipe: Egyptian Tomato Soup",
                "recipe_link": "http://www.thekitchn.com/recipe-egyptian-tomato-soup-weeknight....",
                "country": "egypt",
                "created_at": "2022-11-02T02:17:54.111Z"
            }
        },
        {
            "id": "2",
            "type": "favorite",
            "attributes": {
                "recipe_title": "Crab Fried Rice (Khaao Pad Bpu)",
                "recipe_link": "https://www.tastingtable.com/.....",
                "country": "thailand",
                "created_at": "2022-11-07T03:44:08.917Z"
            }
        }
      ]
    } 
   ```


## Database Structure
----------------------
![Screen Shot 2022-11-15 at 5 40 44 PM](https://user-images.githubusercontent.com/105956031/202055197-f80df458-1e0b-40a9-98e5-15e8052473e5.png)

