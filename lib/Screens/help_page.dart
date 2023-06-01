import 'package:flutter/material.dart';

class help_page extends StatelessWidget {
  const help_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Bantuan'),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.01,
                bottom: MediaQuery.of(context).size.height * 0.01,
                right: MediaQuery.of(context).size.width * 0.02,
                left: MediaQuery.of(context).size.width * 0.02,
              ),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Container(
                margin: const EdgeInsets.only(
                  top: 20,
                  bottom: 20,
                ),
                child: Column(
                  children: <Widget>[
                    Container(
                      width: 330,
                      margin: const EdgeInsets.only(
                        top: 10,
                      ),
                      child: const Text(
                        'Dónde puedo conseguirlo?',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 11,
                          letterSpacing: 1.25,
                          color: Colors.black,
                          fontFamily: 'Hind Vadodara',
                        ),
                      ),
                    ),
                    Container(
                      width: 330,
                      margin: const EdgeInsets.only(
                        top: 5,
                        bottom: 10,
                      ),
                      child: const Text(
                        'Hay muchas variaciones de los pasajes de Lorem Ipsum disponibles, '
                        'pero la mayoría sufrió alteraciones en alguna manera, ya sea porque '
                        'se le agregó humor, o palabras aleatorias que no parecen ni un poco creíbles.',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 11,
                          letterSpacing: 1.25,
                          color: Colors.black,
                          fontFamily: 'Hind Vadodara',
                        ),
                      ),
                    ),
                    Container(
                      width: 330,
                      margin: const EdgeInsets.only(
                        top: 10,
                      ),
                      child: const Text(
                        'Por qué lo usamos?',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 11,
                          letterSpacing: 1.25,
                          color: Colors.black,
                          fontFamily: 'Hind Vadodara',
                        ),
                      ),
                    ),
                    Container(
                      width: 330,
                      margin: const EdgeInsets.only(
                        top: 5,
                        bottom: 10,
                      ),
                      child: const Text(
                        'Es un hecho establecido hace demasiado tiempo que un lector se '
                        'distraerá con el contenido del texto de un sitio mientras '
                        'que mira su diseño. El punto de usar Lorem Ipsum es que tiene '
                        'una distribución más o menos normal de las letras, al contrario '
                        'de usar textos como por ejemplo "Contenido aquí, contenido aquí". '
                        'Estos textos hacen parecerlo un español que se puede leer. Muchos '
                        'paquetes de autoedición y editores de páginas web usan el Lorem '
                        'Ipsum como su texto por defecto, y al hacer una búsqueda de "Lorem '
                        'Ipsum" va a dar por resultado muchos sitios web que usan este texto '
                        'si se encuentran en estado de desarrollo.',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 11,
                          letterSpacing: 1.25,
                          color: Colors.black,
                          fontFamily: 'Hind Vadodara',
                        ),
                      ),
                    ),
                    Container(
                      width: 330,
                      margin: const EdgeInsets.only(
                        top: 10,
                      ),
                      child: const Text(
                        'De dónde viene?',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 11,
                          letterSpacing: 1.25,
                          color: Colors.black,
                          fontFamily: 'Hind Vadodara',
                        ),
                      ),
                    ),
                    Container(
                      width: 330,
                      margin: const EdgeInsets.only(
                        top: 5,
                        bottom: 10,
                      ),
                      child: const Text(
                        'Al contrario del pensamiento popular, el texto de Lorem '
                        'Ipsum no es simplemente texto aleatorio. Tiene sus raices '
                        'en una pieza cl´sica de la literatura del Latin, que data '
                        'del año 45 antes de Cristo, haciendo que este adquiera mas '
                        'de 2000 años de antiguedad. Richard McClintock, un profesor '
                        'de Latin de la Universidad de Hampden-Sydney en Virginia, '
                        'encontró una de las palabras más oscuras de la lengua del '
                        'latín, "consecteur", en un pasaje de Lorem Ipsum, y al seguir '
                        'leyendo distintos textos del latín, descubrió la fuente indudable. '
                        'Lorem Ipsum viene de las secciones 1.10.32 y 1.10.33 de "de '
                        'Finnibus Bonorum et Malorum" (Los Extremos del Bien y El Mal) '
                        'por Cicero, escrito en el año 45 antes de Cristo.',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 11,
                          letterSpacing: 1.25,
                          color: Colors.black,
                          fontFamily: 'Hind Vadodara',
                        ),
                      ),
                    ),
                    Container(
                      width: 330,
                      margin: const EdgeInsets.only(
                        top: 10,
                      ),
                      child: const Text(
                        'De dónde viene?',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 11,
                          letterSpacing: 1.25,
                          color: Colors.black,
                          fontFamily: 'Hind Vadodara',
                        ),
                      ),
                    ),
                    Container(
                      width: 330,
                      margin: const EdgeInsets.only(
                        top: 5,
                        bottom: 10,
                      ),
                      child: const Text(
                        'Al contrario del pensamiento popular, el texto de Lorem '
                        'Ipsum no es simplemente texto aleatorio. Tiene sus raices '
                        'en una pieza cl´sica de la literatura del Latin, que data '
                        'del año 45 antes de Cristo, haciendo que este adquiera mas '
                        'de 2000 años de antiguedad. Richard McClintock, un profesor '
                        'de Latin de la Universidad de Hampden-Sydney en Virginia, '
                        'encontró una de las palabras más oscuras de la lengua del '
                        'latín, "consecteur", en un pasaje de Lorem Ipsum, y al seguir '
                        'leyendo distintos textos del latín, descubrió la fuente indudable. '
                        'Lorem Ipsum viene de las secciones 1.10.32 y 1.10.33 de "de '
                        'Finnibus Bonorum et Malorum" (Los Extremos del Bien y El Mal) '
                        'por Cicero, escrito en el año 45 antes de Cristo.',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 11,
                          letterSpacing: 1.25,
                          color: Colors.black,
                          fontFamily: 'Hind Vadodara',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}
