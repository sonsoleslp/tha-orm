package fi.uef.thj.demo.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.OneToMany;
import java.util.Set;

@Entity
@Table(name="teacher")
public class Teacher {

    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name="id_teacher")
    private Long idTeacher;

    @Column(name="name", nullable = false)
    private String name;

    @OneToMany(mappedBy = "teacher")
    private Set<Course> courses;

    public Teacher() {}

    public Teacher(Long idTeacher, String name) {
        this.idTeacher = idTeacher;
        this.name = name;
    }

    public Long getIdTeacher() {
        return idTeacher;
    }

    public void setIdTeacher(Long idTeacher) {
        this.idTeacher = idTeacher;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Set<Course> getCourses() {
        return courses;
    }

    public void setCourses(Set<Course> courses) {
        this.courses = courses;
    }
}
