function createStudent(name, yearth) {
  let courses = [];

  return {
    info() {
      console.log(`${name} is a ${yearth} year student`)
    },

    listCourses() {
      console.log(courses);
    },

    addCourse(course) {
      courses.push(course)
    },

    addNote(courseCode, note) {
      const course = courses.filter(({code}) => code === courseCode)[0];

      if (course) {
        if (course.note) {
          course.note += `; ${note}`;
        } else {
          course.note = note;
        }
      }
    },

    viewNotes() {
      const coursesWithNotes = courses.filter(({note}) => note);
      coursesWithNotes.forEach(course => {
        console.log(`${course.name}: ${course.note}`)
      })
    },

    updateNote(courseCode, note) {
      const course = courses.filter(({code}) => code === courseCode)

      if (course) {
        course.note = note
      }
    }

  }
}

let foo = createStudent('Foo', '1st');
foo.info();
// "Foo is a 1st year student"
foo.listCourses();
// [];
foo.addCourse({ name: 'Math', code: 101 });
foo.addCourse({ name: 'Advanced Math', code: 102 });
foo.listCourses();
// [{ name: 'Math', code: 101 }, { name: 'Advanced Math', code: 102 }]
foo.addNote(101, 'Fun course');
foo.addNote(101, 'Remember to study for algebra');
foo.viewNotes();
// "Math: Fun course; Remember to study for algebra"
foo.addNote(102, 'Difficult subject');
foo.viewNotes();
// "Math: Fun course; Remember to study for algebra"
// "Advanced Math: Difficult subject"
foo.updateNote(101, 'Fun course');
foo.viewNotes();
// "Math: Fun course"
// "Advanced Math: Difficult subject"