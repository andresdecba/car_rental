List<String> ciudades = [
  'Cordoba Capital',
  'Bs. As. Ciudad',
  'San Carlos de Bariloche',
  'Rosario',
  'Mar del Plata',
  'Carlos Paz',
  'San Miguel de Tucumán',
  'Corrientes Capital',
  'Ushuaia',
  'Mendoza Capital'
];

class AutosModel {
  String marca; //
  String modelo; //
  int maletas;
  int asientos; //
  double valoracion; //
  String xmodel;
  int velocidad;
  List <String> image; //
  int precio;

  AutosModel({this.marca, this.modelo, this.precio, this.valoracion, this.asientos, this.image, this.maletas, this.velocidad, this.xmodel});
}

List<AutosModel> stockDeAutos = [
  AutosModel(marca: "Mercedes Benz", modelo: "Turbo", precio: 350, valoracion: 4.0, asientos: 2, image: ["images/auto-1.png", "images/auto-1.png", "images/auto-1.png"], maletas: 2, velocidad: 220, xmodel: 'x2'),
  AutosModel(marca: "Audi", modelo: "Cabrio", precio: 499, valoracion: 4.7, asientos: 2, image: ["images/auto-2.png", "images/auto-2.png","images/auto-2.png"], maletas: 2, velocidad: 250, xmodel: 'x3'),
  AutosModel(marca: "Hiunday", modelo: "Way", precio: 300, valoracion: 4.6, asientos: 5, image: ["images/auto-3.png", "images/auto-3.png", "images/auto-3.png"], maletas: 3, velocidad: 160, xmodel: 'x1'),
  AutosModel(marca: "Mercedes Benz", modelo: "Faster", precio: 499, valoracion: 4.0, asientos: 4, image: ["images/auto-4.png", "images/auto-4.png", "images/auto-4.png"], maletas: 2, velocidad: 200, xmodel: 'x4'),
  AutosModel(marca: "Mercedes Benz", modelo: "MotorHome", precio: 450, valoracion: 3.9, asientos: 4, image: ["images/auto-5.png", "images/auto-5.png", "images/auto-5.png"], maletas: 2, velocidad: 120, xmodel: 'x1'),
  AutosModel(marca: "JEEP", modelo: "4x4", precio: 399, valoracion: 4.2, asientos: 4, image: ["images/auto-6.png", "images/auto-6.png", "images/auto-6.png"], maletas: 2, velocidad: 150, xmodel: 'x2'),
];
