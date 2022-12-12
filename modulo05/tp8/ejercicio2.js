'use strict';
let jsonData = require('./personas.json');
console.log(JSON.stringify(jsonData));
//console.log(jsonData);
console.log(JSON.parse(jsonData));

//Cuando utilizamos JSON.stringify, transforma el dato en un string en la misma linea.
//Cuando utilizamos JSON.parse, nos tira un error ya que el dato no esta en el formato correspondiente para pasar.

