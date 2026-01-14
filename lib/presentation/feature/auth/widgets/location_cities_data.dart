/// City data for Lagos and Abuja states
class LocationCitiesData {
  static const Map<String, List<String>> stateCities = {
    'Lagos': [
      'Agege',
      'Alimosho',
      'Amuwo-Odofin',
      'Apapa',
      'Badagry',
      'Epe',
      'Eti-Osa',
      'Ibeju-Lekki',
      'Ifako-Ijaiye',
      'Ikorodu',
      'Ikeja',
      'Ikoyi',
      'Lekki',
      'Lagos Island',
      'Mushin',
      'Ojodu',
      'Oshodi-Isolo',
      'Shomolu',
      'Surulere',
      'Victoria Island',
      'Yaba',
    ],
    'FCT - Abuja': [
      'Abuja Municipal Area Council (AMAC)',
      'Bwari',
      'Gwagwalada',
      'Kuje',
      'Kwali',
      'Central Business District (CBD)',
      'Garki',
      'Guzape',
      'Jabi',
      'Maitama',
      'Wuse',
      'Asokoro',
      'Ikoyi',
      'Kado',
      'Katampe',
      'Nyanya',
      'Suleja',
      'Zuba',
    ],
  };

  static List<String> getCitiesForState(String state) {
    return stateCities[state] ?? [];
  }

  static List<String> getAvailableStates() {
    return stateCities.keys.toList();
  }

  static bool hasCities(String state) {
    return stateCities.containsKey(state);
  }
}