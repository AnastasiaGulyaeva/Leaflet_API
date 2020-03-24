var map = L.map("mapid")
  .on("load", onMapLoad)
  .setView([41.4, 2.206], 9);

//   map.locate({ setView: true, maxZoom: 17 });

var tiles = L.tileLayer(
  "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
  {}
).addTo(map);

//en el clusters almaceno todos los markers
var markers = L.markerClusterGroup();
let data_markers = [];
let arrKindFood = [];
let splitArray = [];
let sepArrKindFood = [];

function onMapLoad() {
  console.log("Mapa cargado");
  /*
	FASE 3.1
		1) Relleno el data_markers con una petición a la api
		2) Añado de forma dinámica en el select los posibles tipos de restaurantes
		3) Llamo a la función para --> render_to_map(data_markers, 'all'); <-- para mostrar restaurantes en el mapa
  */

  // Coger la info de base de datos
  $.getJSON("http://localhost/mapa/api/apiRestaurants.php", function(data) {
    for (let i = 0; i < data.length; i++) {
      data_markers.push(data[i]);
    }
    console.log(data_markers);

    // añadir los datos de kind_food al array;
    $.each(data, function(key, val) {
      arrKindFood.push(val.kind_food);
    });
    console.log(arrKindFood);

    // separar los valores
    sepArrKindFood = arrKindFood.toString();
    sepArrKindFood = sepArrKindFood.split(",");
    console.log(sepArrKindFood);

    // crear nuevo array sin kind_food repetidos
    finalArray = [...new Set(sepArrKindFood)];
    finalArray.unshift("Todos");
    console.log(finalArray);

    // añádir los datos al menu
    for (let j = 0; j < finalArray.length; j++) {
      $("#kind_food_selector").append("<option>" + finalArray[j] + "</option>");
    }

    // añadir los markers a la mapa
    for (let marker of data_markers) {
      markers.addLayer(
        L.marker([marker.lat, marker.lng]).bindPopup(
          "<b>" +
            marker.name +
            "</b><br>" +
            marker.address +
            "<br><i>" +
            marker.kind_food +
            "<i>"
        )
      );
    }
    map.addLayer(markers);
  });
}

$("#kind_food_selector").on("change", function() {
  console.log(this.value);
  //limpiar marcadores
  markers.clearLayers();
  render_to_map(data_markers, this.value);
});

function render_to_map(data_markers, filter) {
  /*
	FASE 3.2
		1) Limpio todos los marcadores
		2) Realizo un bucle para decidir que marcadores cumplen el filtro, y los agregamos al mapa
  */

  // filtros
  for (marker of data_markers) {
    if (marker.kind_food.includes(filter)) {
      markers.addLayer(
        L.marker([marker.lat, marker.lng]).bindPopup(
          "<b>" +
            marker.name +
            "</b><br>" +
            marker.address +
            "<br><i>" +
            marker.kind_food +
            "<i>"
        )
      );
    } else if (filter == "Todos") {
      markers.addLayer(
        L.marker([marker.lat, marker.lng]).bindPopup(
          "<b>" +
            marker.name +
            "</b><br>" +
            marker.address +
            "<br><i>" +
            marker.kind_food +
            "<i>"
        )
      );
    }
  }
  map.addLayer(markers);
}
