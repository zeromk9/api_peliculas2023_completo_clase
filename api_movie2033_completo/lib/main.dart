// Importaciones necesarias de paquetes y archivos
import 'package:flutter/material.dart';
import 'package:api_movie2033_completo/providers/movies_provider.dart';
import 'package:api_movie2033_completo/screens/screens.dart';
import 'package:provider/provider.dart';

// Función principal que inicia la aplicación
void main() => runApp(const AppState());

// Clase principal que inicializa el estado de la aplicación
class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    // Inicialización de proveedores de cambio de notificador
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          // Creación de un proveedor para manejar los datos de las películas
          create: (_) => MoviesProvider(),
          lazy: false,
        )
      ],
      child: const MyApp(),
    ); // Muestra la aplicación MyApp con el proveedor de estado
  }
}

// Clase principal de la aplicación
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Construcción de la interfaz de usuario usando MaterialApp
    return MaterialApp(
      debugShowCheckedModeBanner:
          false, // Oculta el banner de depuración en la esquina superior derecha
      title: 'Peliculas', // Título de la aplicación
      initialRoute: 'home', // Ruta inicial de la aplicación
      routes: {
        'home': (_) => const HomeScreen(), // Ruta para la pantalla de inicio
        'details': (_) =>
            const DetailsScreen() // Ruta para la pantalla de detalles
      },
    ); // Muestra la aplicación con las rutas especificadas
  }
}
