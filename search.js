// search.js
document.addEventListener('DOMContentLoaded', function() {
  const searchForm = document.querySelector('.search-form');

  if (!searchForm) return; // stop if form not found

  searchForm.addEventListener('submit', function(e) {
    e.preventDefault(); // Prevent form from reloading

    const city = searchForm.querySelector('select[name="city"]').value;
    const specialty = searchForm.querySelector('select[name="specialty"]').value;

    const specialtyPages = {
      'Faisalabad': {
        'cardiologist': 'specialties/Faisalabad/cardiologist.html',
        'dermatologist': 'specialties/Faisalabad/dermatologist.html',
        'dentist': 'specialties/Faisalabad/dentist.html',
        'neurologist': 'specialties/Faisalabad/neurologist.html',
        'pediatrician': 'specialties/Faisalabad/pediatrician.html'
      },
      'Lahore': {
        'cardiologist': 'specialties/Lahore/cardiologist.html',
        'dermatologist': 'specialties/Lahore/dermatologist.html',
        'dentist': 'specialties/Lahore/dentist.html',
        'neurologist': 'specialties/Lahore/neurologist.html',
        'pediatrician': 'specialties/Lahore/pediatrician.html'
      }
    };

    if (specialtyPages[city] && specialtyPages[city][specialty]) {
      window.location.href = specialtyPages[city][specialty];
    } else {
      alert('Please select both city and doctor type.');
    }
  });
});
