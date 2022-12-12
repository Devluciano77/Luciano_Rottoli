const fs = require('fs');
const rawdata = fs.readFileSync('./departamentos.json');
var departamento = JSON.parse(rawdata);

function getnombre_puesto (array) {
    for (let i = 0; i <array['Departamentos'][0]['Tecnología'].length;i++){

        let i_puesto = array['Departamentos'][0]['Tecnología'][i]['Puesto'];
        let nombre = array['Departamentos'][0]['Tecnología'][i]['nombre'];

        console.log(`${nombre} ${i_puesto}`);

    }
}
getnombre_puesto(departamento);