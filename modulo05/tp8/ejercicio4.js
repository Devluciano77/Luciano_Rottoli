const fs = require('fs');
const rawdata = fs.readFileSync('./personas.json');
var persona = JSON.parse(rawdata);

function getnombre (array) {
    for (let i = 0; i <array['Personas'].length;i++){
        let i_localidad = array['Personas'][i]['Localidad'];
        let nombre = array['Personas'][i]['Nombre'];
        let apellido =array['Personas'][i]['Apellido'];

        if (i_localidad === 'Posadas'){
            console.log(`${nombre} ${apellido} `)
        }
    }
}
getnombre(persona);
