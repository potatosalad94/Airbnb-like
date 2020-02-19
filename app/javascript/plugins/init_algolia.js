import places from 'places.js';

const searchAddress = () => {
  const addressContainer = document.getElementById('address-input');
  if (addressContainer) {
    const placesAutocomplete = places({
      appId: 'plBXL4O9VNG6',
      apiKey: '91182b5a1ae47df48e5bfb6d801f63d5',
      container: addressContainer
    });
  }
};

export { searchAddress };

