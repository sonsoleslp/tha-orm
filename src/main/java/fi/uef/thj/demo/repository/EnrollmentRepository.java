package fi.uef.thj.demo.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import fi.uef.thj.demo.entity.Enrollment;
import fi.uef.thj.demo.entity.EnrollmentId;
import java.util.List;

public interface EnrollmentRepository extends JpaRepository<Enrollment, EnrollmentId> {
    List<Enrollment> findByStudentId(Long studentId);
    List<Enrollment> findByCourseId(Long courseId);
}
