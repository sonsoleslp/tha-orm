package fi.uef.thj.demo.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import fi.uef.thj.demo.entity.AcademicYear;

public interface AcademicYearRepository extends JpaRepository<AcademicYear, Long> {
}
