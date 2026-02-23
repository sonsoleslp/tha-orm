package fi.uef.thj.demo.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import fi.uef.thj.demo.service.CourseService;
import fi.uef.thj.demo.entity.Course;
import fi.uef.thj.demo.entity.Person;
import java.util.List;

@Controller
public class CourseController {
    private final CourseService courseService;

    public CourseController(CourseService courseService) {
        this.courseService = courseService;
    }

    @GetMapping("/courses")
    public String listCourses(Model model) {
        model.addAttribute("courses", courseService.getAllCourses());
        return "Courses";
    }

    @GetMapping("/courses/new")
    public String courseForm(Model model) {
        Course course = new Course();
        model.addAttribute("course", course);
        return "AddCourse";
    }

    @PostMapping("/courses")
    public String saveCourse(@ModelAttribute("course") Course course) {
        courseService.saveCourse(course);
        return "redirect:/courses";
    }

    @GetMapping("/courses/{id}/students")
    public String listEnrolledStudents(@PathVariable Long id, Model model) {
        Course course = courseService.getCourseById(id);
        List<Person> students = courseService.getEnrolledStudents(id);
        model.addAttribute("course", course);
        model.addAttribute("students", students);
        return "CourseStudents";
    }
}
