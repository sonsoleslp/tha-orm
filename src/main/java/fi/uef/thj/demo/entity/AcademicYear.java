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
@Table(name="academic_year")
public class AcademicYear {

    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Long id;

    @Column(name="start_year", nullable = false)
    private Integer startYear;

    @Column(name="end_year", nullable = false)
    private Integer endYear;

    @OneToMany(mappedBy = "academicYear")
    private Set<Enrollment> enrollments;

    public AcademicYear() {}

    public AcademicYear(Long id, Integer startYear, Integer endYear) {
        this.id = id;
        this.startYear = startYear;
        this.endYear = endYear;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Integer getStartYear() {
        return startYear;
    }

    public void setStartYear(Integer startYear) {
        this.startYear = startYear;
    }

    public Integer getEndYear() {
        return endYear;
    }

    public void setEndYear(Integer endYear) {
        this.endYear = endYear;
    }

    public Set<Enrollment> getEnrollments() {
        return enrollments;
    }

    public void setEnrollments(Set<Enrollment> enrollments) {
        this.enrollments = enrollments;
    }

    public String getDisplayName() {
        return startYear + "-" + endYear;
    }
}
