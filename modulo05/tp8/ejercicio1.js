const fs = require('fs');
let rawdata = fs.readFileSync('./personas.json');
//let persona = JSON.parse(rawdata);
//console.log(persona);

console.log(JSON.stringify(rawdata));

//Cuando utilizamos JSON.stringify() toma un objeto y lo transforma en una cadena JSON pero cuando lo mostramos en la consola nose puede interpretar ya que el dato proviene del buffer.

//Mientras que en el JSON.parse() hace lo inverso.Toma una cadena y pasa a ser un objeto, este a su vez,cunado lo mostramos en la consola si se puede interpretar.
