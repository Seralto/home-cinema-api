# Home Cinema [![Build Status](https://travis-ci.org/Seralto/home-cinema-api.svg?branch=master)](https://travis-ci.org/Seralto/home-cinema-api)
This project is a RESTFul API that implements a content purchase system for Movies and Seasons.

## Demo
You can see a live demo of this API and test the endpoints bellow here (wip)

## Dependencies
The project has the following dependencies:

* Ruby 2.6.2
* Rails 5.2.2

## Setup
In order to run the program, follow the steps:

1. Install the project dependencies above and run the following commands.
2. `$ git clone https://github.com/Seralto/home-cinema-api`
3. `$ cd home-cinema-api`
4. `$ bundle install`
5. `$ rails db:setup`

## Running
1. `$ rails server`
2. Go to [http://localhost:3000/api/v1/](http://localhost:3000/api/v1/) in your browser.

## API Usage
Bellow you can see the main usage of the project resources.

### Movies

```
GET /movies
```

**Response**:

```
Status: 200 OK
```

```json
[
  {
    "id": 1,
    "type": "Movie",
    "title": "Matrix",
    "plot": "A computer hacker learns about the true nature of his reality and his role in the war against its controllers.",
    "created_at": "2018-10-01T19:34:22.520Z"
  }
]
```

### Seasons

```
GET /seasons
```

**Response**:

```
Status: 200 OK
```

```json
[
  {
    "id": 1,
    "type": "Season",
    "title": "Black Mirror",
    "plot": "An anthology series exploring a twisted high-tech world.",
    "created_at": "2018-10-01T19:34:22.520Z",
    "episodes": [
      {
        "id": 1,
        "number": 1,
        "title": "Playtest",
        "plot": "After accepting a mysterious offer from a high profile video game developer, things start to go wrong."
      }
    ]
  }
]
```

### Contents

```
GET /contents
```

**Response**:

```
Status: 200 OK
```

```json
[
  {
    "id": 1,
    "type": "Movie",
    "title": "Matrix",
    "plot": "A computer hacker learns about the true nature of his reality and his role in the war against its controllers.",
    "created_at": "2018-10-01T19:34:22.520Z"
  },
  {
    "id": 1,
    "type": "Season",
    "title": "Black Mirror",
    "plot": "An anthology series exploring a twisted high-tech world.",
    "created_at": "2018-10-01T19:34:22.520Z",
    "episodes": [
      {
        "id": 1,
        "number": 1,
        "title": "Playtest",
        "plot": "After accepting a mysterious offer from a high profile video game developer, things start to go wrong."
      }
    ]
  }
]
```

### Performing a Purchase

```
POST /purchases
```

**Input**:

Attribute	|	Type	|	Description
----	|	----	|	----
`user_id`	|	`integer`	|	User ID **(required)**
`purchase_option_id`	|	`integer`	|	Purchase Option ID **(required)**

**Example**:

```json
{
	"user_id": 1,
	"purchase_option_id": 1
}
```

**Response**:

```
Status: 201 Created
```

```json
{
    "id": 3,
    "purchase_date": "04/02/2019",
    "remaing_days": 2,
    "user": {
        "id": 1,
        "email": "joan@schneider.io"
    },
    "purchase_option": {
        "id": 2,
        "price": "2.99",
        "quality": "SD",
        "content": {
            "id": 1,
            "title": "Matrix",
            "plot": "A computer hacker learns about the true nature of his reality and his role in the war against its controllers."
        }
    }
}
```

### Library

```
GET /users/:id/library
```

**Response**:

```
Status: 200 OK
```

```json
[
    {
        "id": 1,
        "purchase_date": "04/02/2019",
        "remaing_days": 2,
        "user": {
            "id": 1,
            "email": "joan@schneider.io"
        },
        "purchase_option": {
            "id": 1,
            "price": "2.99",
            "quality": "HD",
            "content": {
                "id": 1,
                "title": "Matrix",
                "plot": "A computer hacker learns about the true nature of his reality and his role in the war against its controllers."
            }
        }
    }
]
```

### Pagination
All resources are paginated.\
You can select an specific page passing the parameter ```?page=1```.

### Testing
Run all tests with the command:

```shell
$ bundle exec rspec
```
