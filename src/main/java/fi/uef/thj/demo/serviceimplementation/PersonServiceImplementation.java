package fi.uef.thj.demo.serviceimplementation;

import fi.uef.thj.demo.entity.Person;
import fi.uef.thj.demo.entity.Course;
import fi.uef.thj.demo.entity.Enrollment;
import fi.uef.thj.demo.repository.PersonRepository;
import fi.uef.thj.demo.repository.EnrollmentRepository;
import fi.uef.thj.demo.service.PersonService;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.stereotype.Service;

@Service
public class PersonServiceImplementation implements PersonService {
    private PersonRepository personRepository;
    private EnrollmentRepository enrollmentRepository;

    public PersonServiceImplementation(PersonRepository personRepository,
                                       EnrollmentRepository enrollmentRepository) {
        this.personRepository = personRepository;
        this.enrollmentRepository = enrollmentRepository;
    }

    @Override
    public List<Person> getAllPersons() {
        return personRepository.findAll();
    }

    @Override
    public Person savePerson(Person person) {
        return personRepository.save(person);
    }

    @Override
    public Person getPersonById(Long id) {
        return personRepository.findById(id).orElse(null);
    }

    @Override
    public List<Course> getEnrolledCourses(Long personId) {
        List<Enrollment> enrollments = enrollmentRepository.findByStudentId(personId);
        return enrollments.stream()
                .map(Enrollment::getCourse)
                .collect(Collectors.toList());
    }
}
