package fi.uef.thj.demo.service;

import fi.uef.thj.demo.entity.Person;
import fi.uef.thj.demo.entity.Course;
import java.util.List;

public interface PersonService {
    List<Person> getAllPersons();
    Person savePerson(Person person);
    Person getPersonById(Long id);
    List<Course> getEnrolledCourses(Long personId);
}
