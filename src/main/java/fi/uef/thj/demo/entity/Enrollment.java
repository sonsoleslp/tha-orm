package fi.uef.thj.demo.entity;

import jakarta.persistence.EmbeddedId;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.MapsId;
import jakarta.persistence.JoinColumn;

@Entity
@Table(name="enrollment")
public class Enrollment {

    @EmbeddedId
    private EnrollmentId id;

    @ManyToOne
    @MapsId("studentId")
    @JoinColumn(name = "id_student")
    private Person student;

    @ManyToOne
    @MapsId("courseId")
    @JoinColumn(name = "id_course")
    private Course course;

    @ManyToOne
    @MapsId("academicYearId")
    @JoinColumn(name = "id_academic_year")
    private AcademicYear academicYear;

    public Enrollment() {}

    public Enrollment(Person student, Course course, AcademicYear academicYear) {
        this.student = student;
        this.course = course;
        this.academicYear = academicYear;
        this.id = new EnrollmentId(student.getId(), course.getId(), academicYear.getId());
    }

    public EnrollmentId getId() {
        return id;
    }

    public void setId(EnrollmentId id) {
        this.id = id;
    }

    public Person getStudent() {
        return student;
    }

    public void setStudent(Person student) {
        this.student = student;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public AcademicYear getAcademicYear() {
        return academicYear;
    }

    public void setAcademicYear(AcademicYear academicYear) {
        this.academicYear = academicYear;
    }
}
