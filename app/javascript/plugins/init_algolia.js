import places from 'places.js';

const placesAutocomplete = places({
  appId: 'plBXL4O9VNG6',
  apiKey: '91182b5a1ae47df48e5bfb6d801f63d5',
  container: document.getElementById('address-input')
});

export { placesAutocomplete };

