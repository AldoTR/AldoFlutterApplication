# myapp

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

Para poder Ejecutar correctamente este programa deberas añadir el archivo firebase_options.dart en la carpeta lib de tu proyecto.
Para ello ejecuta los siguientes pasos:

1.- dart pub global activate flutterfire_cli =>Para instalar la consola de firebase para flutter, esta linea te dara como resultado una
    ruta de quederas exportar, o ingresar al archivo de inicio del shell para añadir el path.

2.- echo '<export PATH="$PATH:path_to_flutter_directory/flutter/bin">' >> $HOME/.bashrc remplaza lo que esta entre <> con el comando
    que te retorno la linea 1.

3.- Para confirmar si se ingreso correctamente reinicia tu computador y ejecuta echo $PATH

4.- Si todo se configuro correctamente procede a añadir paquetes en tu proyeto:
	flutter pub add firebase_core
	
5.- Y crea el archivo de configuración faltante:
	flutterfire configure
	Este comando te solicitara el nombre de tu proyecto y el tipo de applicación.
	
