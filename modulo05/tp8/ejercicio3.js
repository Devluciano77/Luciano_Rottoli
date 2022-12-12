'use strict';
const fs = require('fs');
fs.readFile('./personas.json', (err, data) => {
if (err) throw err;
//console.log(JSON.parse(data));
console.log(JSON.stringify(data));
console.log(data);
});


//a) cuando utilizamos console.log(JSON.stringify(data)); nos trae un dato del buffer que no se puede interpretar.
//b) cuando utilizamos console.log(data) nos muestra un dato del buffer de tipo hexadecimal.

