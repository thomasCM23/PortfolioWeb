package main

import (
	"net/http"
	"strconv"

	"github.com/labstack/echo"
	"github.com/labstack/echo/middleware"
)

func main() {
	e := echo.New()
	e.Use(middleware.CORS())
	e.GET("/data", getData)
	e.GET("/data/:id", getHero)
	e.Logger.Fatal(e.Start(":1323"))
}

type Hero struct {
	ID   int64  `json:"id"`
	Name string `json:"name"`
}

var heroes = []*Hero{
	&Hero{11, "Mr. Nice"},
	&Hero{12, "Narco"},
	&Hero{13, "Bombasto"},
	&Hero{14, "Celeritas"},
	&Hero{15, "Magneta"},
	&Hero{16, "RubberMan"},
	&Hero{17, "Dynama"},
	&Hero{18, "Dr IQ"},
	&Hero{19, "Magma"},
	&Hero{20, "Tornado"},
}

func getData(c echo.Context) error {
	return c.JSON(http.StatusOK, heroes)
}

// e.GET("/users/:id", getUser)
func getHero(c echo.Context) error {
	// User ID from path `users/:id`
	id := c.Param("id")
	var hero *Hero
	for _, v := range heroes {
		if i, _ := strconv.ParseInt(id, 0, 64); v.ID == i {
			hero = v
		}
	}

	return c.JSON(http.StatusOK, hero)
}
