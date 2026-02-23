package fi.uef.thj.demo.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import fi.uef.thj.demo.entity.Teacher;

public interface TeacherRepository extends JpaRepository<Teacher, Long> {
}
