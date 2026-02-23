package fi.uef.thj.demo.service;

import fi.uef.thj.demo.entity.Course;
import fi.uef.thj.demo.entity.Person;
import java.util.List;

public interface CourseService {
    List<Course> getAllCourses();
    Course saveCourse(Course course);
    Course getCourseById(Long id);
    List<Person> getEnrolledStudents(Long courseId);
}
