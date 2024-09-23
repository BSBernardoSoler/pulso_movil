class APIUrls {
  static const String _host = 'http://161.132.50.178:3000'; // Define tu host aquí
  //http://10.0.2.2:4000
  //http://161.132.49.180:4000
  static String loginUser() {
    return '$_host/auth/loginUser'; // Concatena el host con la ruta específica de la API
  }

  static String loginPsalud() {
    return '$_host/auth/loginPsalud'; // Concatena el host con la ruta específica de la API
  }

  static String registerUser() {
    return '$_host/auth/registerUser'; // Nueva ruta para registro
  }
  static String getUsuario() {
    return '$_host/usuario/buscarUser'; // Concatena el host con la ruta específica de la API
  }

  static String getEmergencias() {
    return '$_host/emergencias/user'; //Concatena el host con la ruta especifica de la API
  }

  static String websocket() {
    return '$_host'; //Concatena el host con la ruta especifica de la API
  }

  static String registrarEmergencia() {
    return '$_host/incidente'; //Concatena el host con la ruta especifica de la API
  }


}