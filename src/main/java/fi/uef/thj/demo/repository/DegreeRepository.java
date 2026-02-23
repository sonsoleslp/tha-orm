package fi.uef.thj.demo.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import fi.uef.thj.demo.entity.Degree;

public interface DegreeRepository extends JpaRepository<Degree, Long> {
}
