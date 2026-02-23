package fi.uef.thj.demo.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;
import java.io.Serializable;
import java.util.Objects;

@Embeddable
public class EnrollmentId implements Serializable {

    @Column(name = "id_student")
    private Long studentId;

    @Column(name = "id_course")
    private Long courseId;

    @Column(name = "id_academic_year")
    private Long academicYearId;

    public EnrollmentId() {}

    public EnrollmentId(Long studentId, Long courseId, Long academicYearId) {
        this.studentId = studentId;
        this.courseId = courseId;
        this.academicYearId = academicYearId;
    }

    public Long getStudentId() {
        return studentId;
    }

    public void setStudentId(Long studentId) {
        this.studentId = studentId;
    }

    public Long getCourseId() {
        return courseId;
    }

    public void setCourseId(Long courseId) {
        this.courseId = courseId;
    }

    public Long getAcademicYearId() {
        return academicYearId;
    }

    public void setAcademicYearId(Long academicYearId) {
        this.academicYearId = academicYearId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        EnrollmentId that = (EnrollmentId) o;
        return Objects.equals(studentId, that.studentId) &&
               Objects.equals(courseId, that.courseId) &&
               Objects.equals(academicYearId, that.academicYearId);
    }

    @Override
    public int hashCode() {
        return Objects.hash(studentId, courseId, academicYearId);
    }
}
