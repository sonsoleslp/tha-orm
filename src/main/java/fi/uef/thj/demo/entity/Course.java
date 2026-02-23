package fi.uef.thj.demo.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.JoinColumn;
import java.util.Set;

@Entity
@Table(name="course")
public class Course {

    public enum CourseType {
        basic, mandatory, elective
    }

    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Long id;

    @Column(name="name", nullable = false, length = 100)
    private String name;

    @Column(name="credits", nullable = false)
    private Float credits;

    @Enumerated(EnumType.STRING)
    @Column(name="type", nullable = false)
    private CourseType type;

    @Column(name="year", nullable = false)
    private Integer year;

    @Column(name="semester", nullable = false)
    private Integer semester;

    @ManyToOne
    @JoinColumn(name="id_teacher")
    private Teacher teacher;

    @ManyToOne
    @JoinColumn(name="id_degree", nullable = false)
    private Degree degree;

    @OneToMany(mappedBy = "course")
    private Set<Enrollment> enrollments;

    public Course() {}

    public Course(Long id, String name, Float credits, CourseType type, Integer year,
                  Integer semester, Teacher teacher, Degree degree) {
        this.id = id;
        this.name = name;
        this.credits = credits;
        this.type = type;
        this.year = year;
        this.semester = semester;
        this.teacher = teacher;
        this.degree = degree;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Float getCredits() {
        return credits;
    }

    public void setCredits(Float credits) {
        this.credits = credits;
    }

    public CourseType getType() {
        return type;
    }

    public void setType(CourseType type) {
        this.type = type;
    }

    public Integer getYear() {
        return year;
    }

    public void setYear(Integer year) {
        this.year = year;
    }

    public Integer getSemester() {
        return semester;
    }

    public void setSemester(Integer semester) {
        this.semester = semester;
    }

    public Teacher getTeacher() {
        return teacher;
    }

    public void setTeacher(Teacher teacher) {
        this.teacher = teacher;
    }

    public Degree getDegree() {
        return degree;
    }

    public void setDegree(Degree degree) {
        this.degree = degree;
    }

    public Set<Enrollment> getEnrollments() {
        return enrollments;
    }

    public void setEnrollments(Set<Enrollment> enrollments) {
        this.enrollments = enrollments;
    }
}
