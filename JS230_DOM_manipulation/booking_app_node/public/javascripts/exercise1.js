function retrieveSchedules() {
  const request = new XMLHttpRequest();

  // Be sure to change your host and port number accordingly
  request.open('GET','http://localhost:3000/api/schedules')
  request.timeout = 5000;
  request.responseType = 'json';

  request.addEventListener('load', event => {
    const schedules = request.response;
    const staffs = [];
    const tally = [];

    if (schedules.length > 0) {
      schedules.forEach(({staff_id}) => {
        const key = `staff ${String(staff_id)}`;
        if (!staffs.includes(key)) {
          staffs.push(key);
          tally.push(1);
        } else {
          tally[staffs.indexOf(key)] += 1;
        }
      });

      alert(tally.map((_, index) => `${staffs[index]}: ${tally[index]}`).join("\n"));
    } else {
      alert('There are currently no schedules available for booking');
    }
  });

  request.addEventListener('timeout', event => {
    alert('It is taking longer than usual, please try again later.')
  });

  request.addEventListener('loadend', event => {
    alert('The request has completed.');
  });

  request.send();
}

function formDataToObject(formData) {
  let object = {};
  for (var pair of formData.entries()) {
    object[pair[0]] = pair[1];
  }

  return object;
}

document.addEventListener("DOMContentLoaded", () => {
  let form = document.querySelector("form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();
    let formData = new FormData(form)
    let json = JSON.stringify(formDataToObject(formData))

    const request = new XMLHttpRequest();
    request.open("POST", form.action);
    request.setRequestHeader("Content-type", "application/json")
    request.send(json);

    request.addEventListener('load', () => {
      switch(request.status) {
        case 201:
          const data = JSON.parse(request.response);
          alert(`Successfully created staff with id: ${data.id}`);
          form.reset();
          break;
        case 400:
          alert(xhr.responseText);
      }
    })
  })
})