package fi.uef.thj.demo.serviceimplementation;

import fi.uef.thj.demo.entity.Course;
import fi.uef.thj.demo.entity.Enrollment;
import fi.uef.thj.demo.entity.Person;
import fi.uef.thj.demo.repository.CourseRepository;
import fi.uef.thj.demo.repository.EnrollmentRepository;
import fi.uef.thj.demo.service.CourseService;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.stereotype.Service;

@Service
public class CourseServiceImplementation implements CourseService {
    private CourseRepository courseRepository;
    private EnrollmentRepository enrollmentRepository;

    public CourseServiceImplementation(CourseRepository courseRepository,
                                       EnrollmentRepository enrollmentRepository) {
        this.courseRepository = courseRepository;
        this.enrollmentRepository = enrollmentRepository;
    }

    @Override
    public List<Course> getAllCourses() {
        return courseRepository.findAll();
    }

    @Override
    public Course saveCourse(Course course) {
        return courseRepository.save(course);
    }

    @Override
    public Course getCourseById(Long id) {
        return courseRepository.findById(id).orElse(null);
    }

    @Override
    public List<Person> getEnrolledStudents(Long courseId) {
        List<Enrollment> enrollments = enrollmentRepository.findByCourseId(courseId);
        return enrollments.stream()
                .map(Enrollment::getStudent)
                .collect(Collectors.toList());
    }
}
